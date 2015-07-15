class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :load_hosts, only: [:show, :edit, :update]
  before_action :is_owner?, only: [:show, :edit, :update]
  before_action :check_password_for_event, only: [:show]
  after_action :clear_flash, only: [:show]
  before_action :check_login_status, only: [:new, :edit, :update, :destroy]
  after_action :set_notice_nil, only: [:show]
  before_action :create_host_maps, only: [:new]
  before_action :load_maps, only: [:edit, :update]
  before_action :fill_maps, only: [:create, :update]
  before_action :check_access_right, only: [:update, :edit, :destroy]
  before_action :update_guestlist, only: [:show]
  respond_to :html

  def index
    @events = Event.all
    respond_with(@events)

  end

  def show
    if guestlist_detail_params
      detail = GuestlistDetail.new(guestlist_detail_params)
      detail.event = @event
      detail.active = true
      detail.save
    end


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
    current_user.add_role(:eventOwner, @event)

    @address = Address.create(address_params)
    if @address.nil?
      address_error = true
    else
      address_error = false
    end

    update_children_formular_status

    @eventLocation = EventLocation.new(eventlocation_params)
    @eventLocation.address_id = @address.id
    unless @eventLocation.save
      location_error = true
      @address.destroy
    else
      @event.event_location_id = @eventLocation.id
      location_error = false
    end

    add_event_members
    if @member_count < 1
      @event.errors.add(:base, "Sie müssen mindestens einen Gastgeber auswählen")
    end

    if @member_count > 0 && !location_error && !address_error
      if @event.save
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
      end
    else
      @eventLocation.destroy
      @address.destroy
      destroy_event_members
    end

    if location_error
      @event.errors.add(:base, "Name der Location muss ausgefüllt werden")
    end
    if address_error
      @event.errors.add(:base, "Sie müssen die Adresse vollständig ausfüllen")
    end
    if location_error || address_error
      @event.destroy
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

    update_children_formular_status
    update_event_genre
    update_event_member_status

    @eventLocation = EventLocation.where(id: @event.event_location_id).first
    @eventLocation.update(eventlocation_params)
    unless @eventLocation.update(eventlocation_params)
      @event.errors.add(:base, "Name der Location muss ausgefüllt werden")
    end

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
      @eventLocation = EventLocation.where(id: @event.event_location_id).first
      unless @eventLocation.nil?
        @address = Address.where(id: @eventLocation.address_id).first
      end
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
    params.require(:event).permit(:name, :address_id, :teaser, :description, :who_has_access_id, :password, :date, :time, :end_date, :end_time, :accept_children_formular, :min_age)
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
    if params[:event_genre]
      params.require(:event_genre).permit(:event_genre_ids)
    else
      nil
    end
  end

  def image_params
    if params[:event_image]
      params.require(:event_image).permit(:image)
    else
      nil
    end
  end

  def event_images_params
    if params[:event_images]
      params.require(:event_images).permit(images: [])
    else
      nil
    end
  end

  def guestlist_detail_params
    if params[:guestlist_detail]
      params.require(:guestlist_detail).permit(:event_id, :active, :size, :offer, :end_date, :end_time)
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
    if event_genre_params.nil?
      @event.errors.add(:base, "Art des Events auswählen")
    else
      EventEventGenre.create(event_id: @event.id, event_genre_id: event_genre_params[:event_genre_ids])
    end
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
      @member_count = @event.event_hosts.count
    end
  end

  def destroy_event_members
    checker = true
    EventHost.where(event_id: @event.id).each do |eh|
      unless eh.destroy
        checker = false
      end
    end
    return checker
  end

  def update_event_member_status
    host_profile_params.each { |host_profile_param|
      EventHost.where(profile_id: host_profile_param).each { |eu|
        join_and_admin_event(eu)
      }
    }

    host_business_params.each { |host_business_param|
      EventHost.where(business_id: host_business_param).each { |eb|
        join_and_admin_event(eb)
      }
    }

    host_service_params.each { |host_service_param|
      EventHost.where(service_id: host_service_param).each { |es|
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
    create_host_maps
    @profiles_map = @profiles.map(&:profile_id).to_s unless @businesses.nil?
    @businesses_map = @businesses.map(&:business_id).to_s unless @businesses.nil?
    @services_map = @services.map(&:service_id).to_s unless @services.nil?
    @genre_map = @event.event_event_genres.map(&:event_genre_id).to_s
  end

  def fill_maps
    @profiles_map = host_profile_params[:profile_ids]
    @businesses_map = host_business_params[:business_ids]
    @services_map = host_service_params[:service_ids]
    @genre_map = event_genre_params[:event_genre_ids]
  end

  def load_hosts
    @profiles = EventHost.where(profile: @event.profiles).where(event_id: @event.id)
    @businesses = EventHost.where(business: @event.businesses).where(event_id: @event.id)
    @services = EventHost.where(service: @event.services).where(event_id: @event.id)
  end

  def is_owner?
    @owner = false
    if current_user
      businesses_ids = UserBusiness.where(user_id: current_user.id).map(&:business_id)
      @profiles.each do |ep|
        @owner = true if ep.profile_id.in?(Profile.where(user_id: current_user.id).map(&:id))
      end unless @profiles.nil?

      @businesses.each do |eb|
        @owner = true if eb.business_id.in?(businesses_ids)
      end unless @businesses.nil?

      @services.each do |es|
        @owner = true if es.service.business_id.in?(businesses_ids)
      end unless @services.nil?
    end
  end

  def check_access_right
    unless (current_user.has_role? :eventOwner, @event) || (current_user.has_role? :admin)
      flash[:alert] = "Sie haben hierfür leider keine Berechtigung ;)"
      redirect_to events_path
    end
  end


  def not_found
    flash[:error] = "Privates Event nicht gefunden."
    redirect_to(events_path + '?privat=true')
  end

  def update_guestlist
    if (params[:guestlist] == "join" || params[:guestlist] == "leave")
      if @event.guestlist_detail.present?
        if params[:guestlist] == "join" && current_user
          if !Guestlist.where(event_id: @event.id, user_id: current_user.id).first.nil?
            flash[:notice] = "Du bist schon auf der Gästeliste."
          elsif (@event.guestlist_details.last.size.nil? || @event.guestlists.count < @event.guestlist_details.last.size) && Guestlist.create(event_id: @event.id, user_id: current_user.id, guestlist_details_id: @event.guestlist_details.last.id)
            flash[:notice] = "Herzlichen Glückwunsch! Du bist auf der Gästeliste!"
          elsif @event.guestlists.count >= @event.guestlist_details.last.size &&
              flash[:error] = "Schade, die Gästeliste ist schon voll! Versuch es später erneut."
          else
            flash[:error] = "Du konntest der Gästeliste nicht hinzugefügt werden. Versuch es später erneut."
          end
        elsif params[:guestlist] == "leave" && current_user
          if !Guestlist.where(event_id: @event.id, user_id: current_user.id).first.nil? && Guestlist.where(event_id: @event.id, user_id: current_user.id).first.destroy
            flash[:notice] = "Du bist nicht mehr auf der Gästeliste."
          elsif Guestlist.where(event_id: @event.id, user_id: current_user.id).first.present?
            flash[:error] = "Du konntest nicht von der Gästeliste entfernt werden. Versuch es später erneut."
          else
            flash[:notice] = "Du bist nicht auf der Gästeliste."
          end
        elsif params[:guestlist] == 'join' && !current_user
          flash[:error] = "Melde Dich an um Dich auf die Gästeliste einzutragen."
        end
      elsif @event.guestlist_detail.nil?
        flash[:error] = "Keine Gästeliste vorhanden."
      end
    end
  end

  def update_children_formular_status
    unless event_params[:accept_children_formular] == "true"
      @event.accept_children_formular = false
      @event.save
    end
  end
end