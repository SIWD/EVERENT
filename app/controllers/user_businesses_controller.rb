class UserBusinessesController < ApplicationController
  before_action :set_user_business, only: [:show, :edit, :update, :destroy]
  before_action :set_business, only: [:new, :edit]
  before_action :check_access_right, only: [:new, :edit, :destroy]

  respond_to :html

  def index
    redirect_to root_path
    #@user_businesses = UserBusiness.all
    #respond_with(@user_businesses)
  end

  def show
    redirect_to root_path
    #respond_with(@user_business)
  end

  def new
    @user_business = UserBusiness.new
    respond_with(@user_business)
  end

  def edit
    @edit = true
  end

  def create
    error = false
    @user_business = UserBusiness.new(user_business_params)
    #@user_business.user_id = User.find_by_email(user_params).id
    if(User.where(user_params).first)
      @user_business.user_id = User.where(user_params).first.id
    end

    business_users = @user_business.business.users.all
    business_users.each do |user|
      if user == @user_business.user
        flash[:alert] = "Den Benutzer gibt es bereits im Unternehmen"
        error = true
      end
    end

    if ! error
      set_role()

      if @user_business.save
        set_notice("hinzugefügt")
        redirect_to(business_path(@user_business.business))
      else
        @business = @user_business.business
        respond_with(@user_business)
      end

    else
      redirect_to(business_path(@user_business.business))
    end
  end

  def update
    @user_business.update(user_business_params)
    if business_admin_number < 1
      @user_business.position = :Administrator
      @user_business.save
      set_admin_alert
    else
      set_role()
      if @user_business.Mitarbeiter?
        @user_business.user.remove_role(:business_admin, @user_business.business)
      end
      set_notice("aktualisiert")
    end

    redirect_to(business_path(@user_business.business))
  end

  def destroy
    if @user_business.Administrator?
      error = false

      #Check if one admin is left:
      user_businesses_number =
      if business_admin_number <= 1
        set_admin_alert
        error = true
      else
        #Remove role:
        @user_business.user.remove_role(:business_admin, @user_business.business)
      end
    end

    #Destroy:
    if ! error
      @user_business.destroy
      set_notice("entfernt")
    end
    #respond_with(@user_business)
    redirect_to(business_path(@user_business.business))
  end

  private
    def set_user_business
      if(params[:id])
        #Check if Service exists:
        if UserBusiness.where(id: params[:id]).count <= 0
          set_error
          redirect_to(root_path)
          return
        end

        @user_business = UserBusiness.find(params[:id])
      else
        set_error
        redirect_to(root_path)
      end
    end

    def user_business_params
      params.require(:user_business).permit(:position, :business_id)
    end

    def user_params
      params.require(:user).permit(:email)
    end

    def set_business
      if(params[:business])
        @business = Business.find(params[:business])
      else
        set_error
        redirect_to(root_path)
      end
    end

    def set_role
      if @user_business.Administrator?
        @user_business.user.add_role(:business_admin, @user_business.business)
      end
    end

    def business_admin_number
      @user_business.business.user_businesses.Administrator.all.count
    end

    def check_access_right
      if current_user
        business = false
        if @business
          business = @business
        else
          if @user_business
            business = @user_business.business
          else
            business = false
          end
        end

        if business
          admin_users = business.user_businesses.Administrator.all
          found = false
          admin_users.each do |admin_user|
            if admin_user.user == current_user
              found = true
            end
          end

          if ! found
            flash[:alert] = "Sie haben leider keine Administrator-Berechtigungen für dieses Unternehmen"
            redirect_to business_path(@business)
          end
        else
          set_error
          redirect_to root_path
        end
      else
        flash[:notice] = "Bitte loggen Sie sich ein"
        redirect_to business_path(@business)
      end
    end

    def set_error
      flash[:alert] = "Sorry, es gab einen technischen Fehler."
    end

    def set_notice(action)
      flash[:notice] = @user_business.user.email + " wurde " + action
    end

    def set_admin_alert
      flash[:alert] = "Es muss mindestens einen Administrator geben"
    end
end
