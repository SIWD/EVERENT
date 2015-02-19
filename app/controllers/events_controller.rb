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
    address = Address.create(address_params)

    el = EventLocation.new(eventlocation_params)
    el.address_id = address.id
    el.save

    @event = Event.new(event_params)
    @event.event_location = el
    @event.update(host_user_params)
    @event.update(host_business_params)
    @event.update(host_service_params)
    @event.save

    update_event_status

    respond_with(@event)
  end

  def update
    @event.update(event_params)
    @event.update(host_user_params)
    @event.update(host_business_params)
    @event.update(host_service_params)

    update_event_status
    
    el = EventLocation.find(@event.event_location_id)
    el.update(eventlocation_params)

    address = Address.find(el.address_id)
    address.update(address_params)

    respond_with(@event)
  end

  def destroy
    EventUser.where(event_id: @event.id).each do |eu|
      eu.destroy
    end

    EventBusiness.where(event_id: @event.id).each do |eb|
      eb.destroy
    end

    EventService.where(event_id: @event.id).each do |es|
      es.destroy
    end

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
    params.require(:host).permit(user_ids: [])
  end
  def host_business_params
    params.require(:host).permit(business_ids: [])
  end
  def host_service_params
    params.require(:host).permit(service_ids: [])
  end

  def update_event_status
    host_user_params.each { |host_user_param|
      EventUser.where(user_id: host_user_param).each { |eu|

        eu.event_user_status_id = EventUserStatus.where(status: 'owner').first.id
        eu.event_user_join_id = EventUserJoin.where(status: 'join').first.id
        eu.save
      }
    }

    host_business_params.each { |host_business_param|
      EventBusiness.where(business_id: host_business_param).each { |eb|

        eb.event_user_status_id = EventUserStatus.where(status: 'owner').first.id
        eb.event_user_join_id = EventUserJoin.where(status: 'join').first.id
        eb.save
      }
    }

    host_service_params.each { |host_service_param|
      EventService.where(service_id: host_service_param).each { |es|

        es.event_user_status_id = EventUserStatus.where(status: 'owner').first.id
        es.event_user_join_id = EventUserJoin.where(status: 'join').first.id
        es.save
      }
    }
  end

end
