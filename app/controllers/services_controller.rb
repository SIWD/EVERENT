class ServicesController < ApplicationController
  before_action :set_service, only: [:show, :edit, :update, :destroy]
  before_action :set_businesses, only: [:new, :edit, :update, :create]
  before_action :set_user_services, only: [:index, :show, :edit, :update, :destroy]
  before_action :check_access_right, only: [:edit, :update, :destroy]
  before_action :check_for_events, only: [:destroy]

  respond_to :html

  def index
    @services = Service.all
    respond_with(@services)
  end

  def show
    respond_with(@service)
  end

  def new
    @service = Service.new
    @service.sameAddressLikeBusiness = true
    @service.sameContactLikeBusiness = true
    respond_with(@service)
  end

  def edit
  end

  def create

    @service = Service.create(service_params)

    if @service.sameContactLikeBusiness
      @service.contact_id = @service.business.contact_id
    elsif !@service.sameContactLikeBusiness
      contact = Contact.create(contact_params)
      @service.contact = contact
    end

    if @service.sameAddressLikeBusiness
      @service.address_id = @service.business.address_id
    elsif !@service.sameAddressLikeBusiness
      address = Address.create(address_params)
      @service.address = address
    end

    @service.save
    respond_with(@service)
  end

  def update
    @service.update(service_params)

    if @service.sameAddressLikeBusiness
      @service.address = @service.business.address
    else
      if @address.nil? || @service.address == @service.business.address
        if @address = Address.create(address_params)
          @service.address_id = @address.id
          @service.save
        end
      elsif !@service.address.update(address_params)
        @service.errors.add(:base, "Adresse nicht vollständig ausgefüllt")
      end
    end

    if @service.sameContactLikeBusiness
      @service.contact = @service.business.contact
    else
      if @contact.nil? || @service.contact == @service.business.contact
        if @contact = Contact.create(contact_params)
          @service.contact_id = @contact.id
          @service.save
        end
      elsif !@service.contact.update(contact_params)
        @service.errors.add(:base, "Kontakt nicht vollständig ausgefüllt")
      end
    end
    
    @service.save
    respond_with(@service)
  end

  def destroy
    @service.destroy
    respond_with(@service)
  end

  private
  def set_service
    #Check if Service exists:
    if Service.where(id: params[:id]).count <= 0
      flash[:alert] = "Dienstleistung wurde nicht gefunden"
      redirect_to services_path
      return
    end

    @service = Service.find(params[:id])
    @address = @service.address
    @contact = @service.contact
    @business = @service.business

    if current_user
      @profile = Profile.find_by_user_id(current_user.id)
    end
  end

  def set_businesses
    @businesses = User.find(current_user).businesses.all
  end

  def set_user_services

    if current_user
      @userBusinesses = User.find(current_user).businesses.all
      @userServices = Array.new

      @userBusinesses.each do |business|
        tmpServices = business.services.all

        tmpServices.each do |tmpService|
          @userServices.push(tmpService)
        end

      end

    end

  end

  def check_access_right
    if not @userServices.include?(@service)
      redirect_to root_path
    end
  end

  def service_params
    params.require(:service).permit(:description, :name, :teaser, :business_id, :branch_id, :sameAddressLikeBusiness, :sameContactLikeBusiness)
  end

  def address_params
    params.require(:address).permit(:city, :postalCode, :street1, :street2)
  end

  def contact_params
    params.require(:contact).permit(:phone, :mobilePhone, :mail)
  end

  def check_for_events
    if @service.event_services.count > 0
      flash[:alert] = "Bitte löschen Sie zuerst alle Events, in denen diese Dienstleistung Gastgeber ist"
      redirect_to service_path(@service)
    end
  end


end
