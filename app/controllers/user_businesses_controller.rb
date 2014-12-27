class UserBusinessesController < ApplicationController
  before_action :set_user_business, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @user_businesses = UserBusiness.all
    respond_with(@user_businesses)
  end

  def show
    respond_with(@user_business)
  end

  def new
    @user_business = UserBusiness.new
    respond_with(@user_business)
  end

  def edit
  end

  def create
    @user_business = UserBusiness.new(user_business_params)
    @user_business.save
    respond_with(@user_business)
  end

  def update
    @user_business.update(user_business_params)
    respond_with(@user_business)
  end

  def destroy
    @user_business.destroy
    respond_with(@user_business)
  end

  private
    def set_user_business
      @user_business = UserBusiness.find(params[:id])
    end

    def user_business_params
      params.require(:user_business).permit(:position, :User_id, :Business_id)
    end
end
