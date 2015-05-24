class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :is_owner?, only: [:show, :edit]
  before_action :check_password_for_event, only: [:show]
  after_action :clear_flash, only: [:show]
  before_action :check_login_status, only: [:new, :edit, :update, :destroy]
  after_action :set_notice_nil, only: [:show]
  before_action :create_host_maps, only: [:new]
  before_action :load_maps, only: [:edit]
  before_action :load_hosts, only: [:show]
  before_action :fill_maps, only: [:create, :update]
  before_action :check_access_right, only: [:update, :edit, :destroy]
  respond_to :html

  def index
    @events = Event.all
    respond_with(@events)

  end

  def show
    respond_with(@event)
  end

  def event_id
    num = params[:id].to_i
    if num > 0 && num <= Event.order(:id).last.id
      @event = Event.where(id: num).first
      if @event.present? && @event.who_has_access_id == 2
        respond_with(@event)
      else
        not_found
      end
    else
      not_found
    end

  end

  def new
    @event = Event.new
    respond_with(@event)
  end

  def edit
  end

  def create
    @event = Event.new(event_params)
    @address = Address.create(address_params)
    @eventLocation = EventLocation.new(eventlocation_params)
    @eventLocation.address_id = @address.id


    @eventLocation.save
    @event.event_location_id = @eventLocation.id

    add_event_members
    if @member_count < 1
      @event.errors.add(:base, "Sie müssen mindestens einen Gastgeber auswählen")
    end

    if @member_count > 0 && @event.save
      if @address.latitude.nil? || @address.latitude == ""
        @event.errors.add(:base, "Adresse nicht gefunden")
      end
      unless image_params.nil?
        image = @event.event_images.new(image_params)
        image.album = "Flyer"
        image.save
      end
      create_event_genre
      update_event_member_status
      current_user.add_role(:eventOwner, @event)
    else
      @eventLocation.destroy
      @address.destroy
      destroy_event_members
    end

    respond_with(@event)
  end

  def update
    @event.update(event_params)
    add_event_members
    if @member_count < 1
      @event.errors.add(:base, "Sie müssen mindestens einen Gastgeber auswählen")
    end

    unless image_params.nil?
      unless @event.event_images.first.nil?
        @event.event_images.first.destroy
      end
      image = @event.event_images.new(image_params)
      image.album = "Flyer"
      image.save
    end

    update_event_genre
    update_event_member_status

    @eventLocation = EventLocation.find(@event.event_location_id)
    @eventLocation.update(eventlocation_params)

    @address = Address.find(@eventLocation.address_id)

    unless @address.update(address_params)
      @event.errors.add(:base, "Sie müssen die Adresse vollständig ausfüllen")
    else
      if @address.latitude.nil? || @address.latitude == ""
        @event.errors.add(:base, "Adresse nicht gefunden")
      end
    end

    respond_with(@event)
  end

  def destroy
    name = @event.name


    event_images = @event.event_images.all
    if (destroy_event_members && @event.destroy)
      flash[:notice] = "'#{name}' wurde gelöscht"
      event_images.destroy_all
    else
      flash[:notice] = "'#{name}' wurde NICHT vollständig gelöscht! Bitte versuchen Sie es später erneut oder wenden Sie sich an Unseren IT-Service"
    end

    current_user.remove_role(:eventOwner, @event)
    @event.destroy

    respond_with(@event)
  end


  private
  def set_event
    @event = Event.where(id: params[:id]).first
    if @event.nil?
      flash[:error] = "Event nicht gefunden"
      redirect_to(events_path)
    else
      @eventLocation = EventLocation.find(@event.event_location_id)
      @address = Address.find(@eventLocation.address_id)
      @image = @event.event_images.where(album: "Flyer").last
    end

  end

  def check_login_status
    if !current_user
      flash[:error] = "Bitte melden Sie sich an, um ein Event zu erstellen!"
      redirect_to new_user_session_path
    elsif Profile.where(user_id: current_user.id).count == 0
      flash[:error] = "Bitte erstellen Sie ein Profil, um ein Event zu erstellen!"
      redirect_to new_profile_path
    end
  end

  def event_params
    params.require(:event).permit(:name, :address_id, :description, :who_has_access_id, :password, :date, :time, :end_date, :end_time)
  end

  def address_params
    params.require(:address).permit(:city, :postalCode, :street1, :street2)
  end

  def eventlocation_params
    params.require(:eventLocation).permit(:name)
  end

  def host_profile_params
    params.require(:host).permit(profile_ids: [])
  end

  def host_business_params
    params.require(:host).permit(business_ids: [])
  end

  def host_service_params
    params.require(:host).permit(service_ids: [])
  end

  def event_genre_params
    params.require(:event_genre).permit(:event_genre_ids)
  end

  def image_params
    if params[:event_image]
      params.require(:event_image).permit(:image)
    else
      nil
    end
  end

  def check_password_for_event
    if ((@event.who_has_access_id == 2) && (params['password_for_event']) && !(params['password_for_event'] == (@event.password)))
      flash[:error] = "Passwort inkorrekt."
    elsif ((@event.who_has_access_id == 2) && (params['password_for_event'] == (@event.password)))
      flash[:notice] = "Passwort korrekt, Zugang gewährt."
    elsif ((@event.who_has_access_id == 2) && @owner)
      flash[:notice] = "Sie Sind Gastgeber, Zugang gewährt."
    end
  end

  def clear_flash
    flash[:notice] = nil
    flash[:error] = nil
  end

  def set_notice_nil
    if ((@event.who_has_access_id == 2) && (params['password_for_event'] == (@event.password)))
      flash[:notice] = nil
    end
  end

  def create_event_genre
    EventEventGenre.create(event_id: @event.id, event_genre_id: event_genre_params[:event_genre_ids])
  end

  def update_event_genre
    @event.event_event_genres.each { |eeg|
      EventEventGenre.find(eeg).destroy
    }

    create_event_genre
  end

  def add_event_members
    @event.update(host_profile_params)
    @event.update(host_business_params)
    @event.update(host_service_params)


    if params[:host]
      @member_count = 0
      if params[:host][:profile_ids]
        params[:host][:profile_ids].each { |p|
          unless p.empty?
            @member_count += 1
          end
        }
      end

      if params[:host][:business_ids]
        params[:host][:business_ids].each { |p|
          unless p.empty?
            @member_count += 1
          end
        }
      end

      if params[:host][:service_ids]
        params[:host][:service_ids].each { |p|
          unless p.empty?
            @member_count += 1
          end
        }
      end
    else
      @member_count = @event.event_businesses.count + @event.event_profiles.count + @event.event_services.count
    end
  end

  def destroy_event_members
    checker = true
    EventProfile.where(event_id: @event.id).each do |eu|
      unless eu.destroy
        checker = false
      end
    end

    EventBusiness.where(event_id: @event.id).each do |eb|
      unless eb.destroy
        checker = false
      end
    end

    EventService.where(event_id: @event.id).each do |es|
      unless es.destroy
        checker = false
      end
    end
    return checker
  end

  def update_event_member_status
    host_profile_params.each { |host_profile_param|
      EventProfile.where(profile_id: host_profile_param).each { |eu|
        join_and_admin_event(eu)
      }
    }

    host_business_params.each { |host_business_param|
      EventBusiness.where(business_id: host_business_param).each { |eb|
        join_and_admin_event(eb)
      }
    }

    host_service_params.each { |host_service_param|
      EventService.where(service_id: host_service_param).each { |es|
        join_and_admin_event(es)
      }
    }
  end

  def join_and_admin_event(obj)
    obj.event_user_status_id = EventUserStatus.where(status: 'owner').first.id
    obj.event_user_join_id = EventUserJoin.where(status: 'join').first.id
    obj.save
  end


  def create_host_maps
    @profiles_map = [""]
    @businesses_map = [""]
    @services_map = [""]
  end

  def load_maps
    @profiles_map = @event.event_profiles.map(&:profile_id).to_s
    @businesses_map = @event.event_businesses.map(&:business_id).to_s
    @services_map = @event.event_services.map(&:service_id).to_s
    @genre_map = @event.event_event_genres.map(&:event_genre_id).to_s
  end

  def load_hosts
    @profiles = @event.event_profiles.all
    @businesses = @event.event_businesses.all
    @services = @event.event_services.all
  end

  def fill_maps
    @profiles_map = host_profile_params[:profile_ids]
    @businesses_map = host_business_params[:business_ids]
    @services_map = host_service_params[:service_ids]
    @genre_map = event_genre_params[:event_genre_ids]
  end

  def is_owner?
    @owner = false
    if current_user
      businesses_ids = UserBusiness.where(user_id: current_user.id).map(&:business_id)
      @event.event_profiles.each do |ep|
        @owner = if ep.profile_id.in?(Profile.where(user_id: current_user.id).map(&:id)) then
                   true
                 end
      end
      @event.event_businesses.each do |eb|
        @owner = if eb.business_id.in?(businesses_ids) then
                   true
                 end
      end
      @event.event_services.each do |es|
        @owner = if es.service.business_id.in?(businesses_ids) then
                   true
                 end
      end
    end
  end

  def check_access_right
    if !current_user.has_role? :eventOwner, @event
      flash[:alert] = "Sie haben hierfür leider keine Berechtigung ;)"
      redirect_to events_path
    end
  end


  def not_found
    flash[:error] = "Privates Event nicht gefunden."
    redirect_to(events_path + '#privat')
  end


end