class BusinessesController < ApplicationController
  before_action :set_business, only: [:show, :edit, :update, :destroy]
  before_action :set_user_businesses, only: [:index, :show, :edit, :update, :destroy]
  before_action :set_access_right, only: [:show]
  before_action :check_access_right, only: [:edit, :update, :destroy]
  before_action :set_business_users, only: [:show]

  respond_to :html

  def index
    @businesses = Business.all
    respond_with(@businesses)
  end

  def show
    respond_with(@business)
  end

  def new

    @business = Business.new
    respond_with(@business)
  end

  def edit
  end

  def create
    @address = Address.create(address_params)
    @business = Business.new(business_params)
    @business.address_id = @address.id
    if(@business.save == false)
      @address.destroy
      respond_with(@business)

    else
      current_user.add_role(:business_admin, @business)
      @business.user_businesses.create([{ user_id: current_user.id, position: :Administrator}])
      set_notice("erstellt")
      respond_with(@business)
    end

  end

  def update
    if @business.update(business_params)
      set_notice("bearbeitet")
    end
    address = Address.find(@business.address_id)
    address.update(address_params)
    respond_with(@business)
  end

  def destroy
    #First delete all services
    @services = @business.services.all
    if @services
      @services.each do |service|
        service.destroy
      end
    end

    #Then delete all user_businesses
    @user_businesses = @business.user_businesses.all
    if @user_businesses
      @user_businesses.each do |user_business|
        user_business.destroy
      end
    end

    @business.destroy
    set_notice("entfernt")

    current_user.remove_role(:business_admin, @business)

    respond_with(@business)
  end

  private
  def set_business
    #Check if business exists:
    if Business.where(id: params[:id]).count <= 0
      flash[:alert] = "Unternehmen wurde nicht gefunden"
      redirect_to businesses_path
      return
    end

    @business = Business.find(params[:id])
    @services = Service.where(business_id: @business.id)
    @address  = Address.where(id: @business.address_id).first
  end


  def business_params
    params.require(:business).permit(:name)
  end

  def address_params
      params.require(:address).permit(:city, :zipcode, :streetName, :streetNumber)
  end

  def set_user_businesses
    if current_user
      @userBusinesses = User.find(current_user).businesses.all
    end
  end

  def set_access_right
    if current_user
      if current_user.has_role? :business_admin, @business
        @admin = true
      else
        @admin = false
      end
    end
  end

  def check_access_right
    if current_user
      if not current_user.has_role? :business_admin, @business
        set_notice_no_access
        redirect_to businesses_path
      end
    else
      set_notice_no_access
      redirect_to businesses_path
    end
  end


  def set_business_users
    @businessUsers = @business.user_businesses.all
  end

  def set_notice(action)
    flash[:notice] = "'" + @business.name + "'" + " wurde " + action
  end

  def set_notice_no_access
    flash[:alert] = "Sie haben keine Berechtigung hierfür"
  end

end
