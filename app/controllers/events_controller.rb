class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :check_password_for_event, only: [:show]
  before_action :check_login_status, only: [:new, :edit, :destroy]
  after_action :set_notice_nil, only: [:show]
  before_action :create_host_maps, only: [:new]
  before_action :load_host_maps, only: [:edit]
  before_action :fill_host_maps, only: [:create]
  before_action :is_owner?, only: [:show, :edit]
  respond_to :html

  def index
    @events = Event.all
    respond_with(@events)

  end

  def show
    respond_with(@event)
  end

  def new
    @event = Event.new
    respond_with(@event)
  end

  def edit
  end

  def create


    @address = Address.create(address_params)
    @event = Event.new(event_params)

    @eventLocation = EventLocation.new(eventlocation_params)
    @eventLocation.address_id = @address.id
    @eventLocation.save
    @event.event_location_id = @eventLocation.id

    add_event_members
    if @event.save
      update_event_member_status
    else
      destroy_event_members

    end
    respond_with(@event)
  end

  def update
    @event.update(event_params)
    add_event_members

    update_event_member_status

    @eventLocation = EventLocation.find(@event.event_location_id)
    @eventLocation.update(eventlocation_params)

    @address = Address.find(@eventLocation.address_id)
    @address.update(address_params)

    respond_with(@event)
  end

  def destroy
    name = @event.name
    if (destroy_event_members && @event.destroy)
      flash[:notice] = "'#{name}' wurde gelöscht"
    else
      flash[:notice] = "'#{name}' wurde NICHT vollständig gelöscht! Bitte versuchen Sie es später erneut oder wenden Sie sich an Unseren IT-Service"
    end


    @event.destroy

    respond_with(@event)
  end



  private
  def set_event
    @event = Event.find(params[:id])
    @eventLocation = EventLocation.find(@event.event_location_id)
    @address = Address.find(@eventLocation.address_id)
  end

  def check_login_status
    unless current_user
      flash[:error] = "Bitte loggen Sie sich zuerst ein, um ein Event zu erstellen!"
      redirect_to new_user_session_path
    end
  end

  def event_params
    params.require(:event).permit(:name, :address_id, :description, :who_has_access_id, :password, :date, :time)
  end
  def address_params
    params.require(:address).permit(:city, :zipcode, :streetName, :streetNumber)
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

  def check_password_for_event

    if ((@event.who_has_access_id  == 2) && (params['password_for_event']) && !(params['password_for_event'] == (@event.password)))
      flash[:error] = "Falsches Passwort"
      flash[:notice] = nil
    elsif ((@event.who_has_access_id  == 2) && (params['password_for_event'] == (@event.password)))
      flash[:notice] = "Zugang gewährt"
      flash[:error] = nil

    end

  end

  def set_notice_nil
    if ((@event.who_has_access_id  == 2) && (params['password_for_event'] == (@event.password)))
      flash[:notice] = nil
    end
  end

  def add_event_members
    @event.update(host_profile_params)
    @event.update(host_business_params)
    @event.update(host_service_params)
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

  def load_host_maps
    @profiles_map = @event.event_profiles.map(&:profile_id).to_s
    @businesses_map = @event.event_businesses.map(&:business_id).to_s
    @services_map = @event.event_services.map(&:service_id).to_s
  end

  def fill_host_maps
    @profiles_map = host_profile_params[:profile_ids]
    @businesses_map = host_business_params[:business_ids]
    @services_map = host_service_params[:service_ids]
  end

  def is_owner?
    @owner = false
    if current_user
      businesses_ids = UserBusiness.where(user_id: current_user.id).map(&:business_id)
      @event.event_profiles.each do |ep|
        @owner = if ep.profile_id.in?(Profile.where(user_id: current_user.id).map(&:id)) then true end
      end
      @event.event_businesses.each do |eb|
        @owner = if eb.business_id.in?(businesses_ids) then true end
      end
      @event.event_services.each do |es|
        @owner = if es.service.business_id.in?(businesses_ids) then true end
      end
    end
  end


end