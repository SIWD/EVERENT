class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :check_login_status, only: [:new, :edit, :destroy]

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
    address = Address.new(address_params)
    geo = Geokit::Geocoders::GoogleGeocoder.geocode("#{address.city} #{address.zipcode} #{address.streetName} #{address.streetNumber}")
    address.country = geo.country_code
    address.stateCode = geo.state_code
    address.lat = geo.lat
    address.lng = geo.lng
    address.save

    el = EventLocation.new(eventlocation_params)
    el.address_id = address.id
    el.save

    @event = Event.new(event_params)
    @event.event_location = el
    @event.save

=begin
    eventuser = EventUser.new(host_user_params)
    eventuser.event = @event.id
    eventuser.event_user_status_id = EventUserStatus.where(status: 'owner').first.id
    eventuser.event_user_join_id = EventUserJoin.where(status: 'join').first.id
    eventuser.save

    eventbusiness = EventBusiness.new(host_business_params)
    eventbusiness.event_id = @event.id
    eventbusiness.event_user_status_id = EventUserStatus.where(status: 'owner').first.id
    eventbusiness.event_user_join_id = EventUserJoin.where(status: 'join').first.id
    eventbusiness.save

    eventservice = EventService.new(host_service_params)
    eventservice.event_id = @event.id
    eventservice.event_user_status_id = EventUserStatus.where(status: 'owner').first.id
    eventservice.event_user_join_id = EventUserJoin.where(status: 'join').first.id
    eventservice.save
=end

    respond_with(@event)
  end

  def update
    @event.update(event_params)
    respond_with(@event)
  end

  def destroy
    @event.destroy
    respond_with(@event)
  end



  def username

  end
  private
  def set_event
    @event = Event.find(params[:id])
    @eventLocation = EventLocation.find(@event.event_location_id)
    @address = if Address.where(id: @eventLocation.address_id).count > 0
                 Address.find(@eventLocation.address_id)
               end
    @profiles = Profile.where(user_id: current_user.id).all
  end

  def check_login_status
    unless current_user
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
  def host_user_params
    params.require(:host).permit(:user_id)
  end
  def host_business_params
    params.require(:host).permit(business_ids: [])
  end
  def host_service_params
    params.require(:host).permit(service_ids: [])
  end


end
