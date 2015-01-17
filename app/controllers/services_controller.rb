class ServicesController < ApplicationController
  before_action :set_service, only: [:show, :edit, :update, :destroy]
  before_action :set_businesses, only: [:new]

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
    @service = Service.find(params[:id])
    if current_user
      @profile = Profile.find_by_user_id(current_user.id)
    end
  end

  def set_businesses
    @businesses = User.find(current_user).businesses.all

  end

    def service_params
      params.require(:service).permit(:description, :name, :teaser, :business_id, :branch_id)
    end
end
