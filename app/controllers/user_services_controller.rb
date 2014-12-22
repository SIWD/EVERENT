class UserServicesController < ApplicationController
  before_action :set_user_service, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @user_services = UserService.all
    respond_with(@user_services)
  end

  def show
    respond_with(@user_service)
  end

  def new
    @user_service = UserService.new
    respond_with(@user_service)
  end

  def edit
  end

  def create
    @user_service = UserService.new(user_service_params)
    @user_service.save
    respond_with(@user_service)
  end

  def update
    @user_service.update(user_service_params)
    respond_with(@user_service)
  end

  def destroy
    @user_service.destroy
    respond_with(@user_service)
  end

  private
    def set_user_service
      @user_service = UserService.find(params[:id])
    end

    def user_service_params
      params.require(:user_service).permit(:description, :name, :premiumServiceEndDate, :teaser, :user_id)
    end
end
