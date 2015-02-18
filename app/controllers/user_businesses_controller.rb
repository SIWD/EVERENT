class UserBusinessesController < ApplicationController
  before_action :set_user_business, only: [:show, :edit, :update, :destroy]
  before_action :set_business, only: [:new, :edit]

  respond_to :html

  def index
    redirect_to root_path
    #@user_businesses = UserBusiness.all
    #respond_with(@user_businesses)
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
    @user_business.user = User.find_by_email(params[:user_business][:user])

    @user_business.save
    redirect_to(business_path(@user_business.business))
  end

  def update
    @user_business.update(user_business_params)
    redirect_to(business_path(@user_business.business))
    #respond_with(@user_business)
  end

  def destroy
    @user_business.destroy
    #respond_with(@user_business)
    redirect_to(business_path(@user_business.business))
  end

  private
    def set_user_business
      if(params[:id])
        @user_business = UserBusiness.find(params[:id])
      else
        redirect_to(root_path)
      end
    end

    def user_business_params
      params.require(:user_business).permit(:position, :business_id)
    end

    def set_business
      if(params[:business])
        @business = Business.find(params[:business])
      else
        redirect_to(root_path)
      end
    end
end
