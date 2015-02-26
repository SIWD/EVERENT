class ServicesController < ApplicationController
  before_action :set_service, only: [:show, :edit, :update, :destroy]
  before_action :set_businesses, only: [:new, :edit, :create]
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
    respond_with(@service)
  end

  def edit
  end

  def create
    @service = Service.new(service_params)
    @service.save
    respond_with(@service)
  end

  def update
    @service.update(service_params)
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
    params.require(:service).permit(:description, :name, :teaser, :business_id, :branch_id, :email, :phone)
  end

  def check_for_events
    if @service.event_services.count > 0
      flash[:alert] = "Bitte löschen Sie zuerst alle Events, in denen diese Dienstleistung Gastgeber ist"
      redirect_to service_path(@service)
    end
  end

end
