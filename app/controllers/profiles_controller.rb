class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]
  before_action :set_user_profile, only: [:show, :edit, :update, :destroy]
  before_action :check_access_right, only: [:edit, :update, :destroy]

  respond_to :html

  def index
    @profiles = Profile.all
    respond_with(@profiles)
  end

  def show
    @usr = @profile.user
    @usrBusiness = @usr.businesses

    #respond_with(@profile)
  end

  def new
    if !current_user
      redirect_to(new_user_session_path)
    elsif User.find(current_user).profile
      redirect_to(edit_profile_path(User.find(current_user).profile))
    else
      @profile = Profile.new
      respond_with(@profile)
    end
  end

  def edit
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user_id = current_user.id
    @profile.save
    respond_with(@profile)
  end

  def update
    @profile.update(profile_params)
    respond_with(@profile)
  end

  def destroy
    if (@profile.user.user_businesses.Administrator.all.count > 0) || (@profile.event_profiles.all.count > 0)
      flash[:error] = "Bitte verlassen Sie erst alle Unternehmen, in denen Sie ein Administrator sind und/oder löschen Sie all Ihre Events"
      respond_with(@profile)
    else
      @profile.destroy
      @profile.user.destroy
      user_businesses = @profile.user.user_businesses
      user_businesses.each do |user_business|
        user_business.destroy
      end
      
      flash[:notice] = "Ihr Account wurde erfolgreich gelöscht"
      redirect_to root_path
    end
  end


  private

  def set_profile
    #Check if Profile exists:
    if Profile.where(id: params[:id]).count <= 0
      flash[:alert] = "Profil wurde nicht gefunden"
      redirect_to profiles_path
      return
    end

    @profile = Profile.find(params[:id])
  end

  def profile_params
    params.require(:profile).permit(:gender, :firstname, :lastname, :phone, :city, :postcode, :streetname, :housenumber, :user_id, :photo)
  end

  def set_user_profile
    if current_user
      @userProfile = User.find(current_user).profile
    end
  end

  def check_access_right
    if @userProfile && @profile
      if @userProfile.id.equal?(@profile.id) == false
        redirect_to root_path
      end
    else
      redirect_to root_path
    end
  end

end
