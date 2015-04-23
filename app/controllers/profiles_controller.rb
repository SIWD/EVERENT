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
      @contact = Contact.new
      @contact.mail =  current_user.email
      respond_with(@profile)
    end
  end

  def edit
  end

  def create

    @address = Address.create(address_params)
    @contact = Contact.create(contact_params)
    @profile = Profile.new(profile_params)
    @profile.address_id = @address.id
    @profile.contact_id = @contact.id
    @profile.user_id = current_user.id
    @profile.save
    respond_with(@profile)
  end

  def update
    @profile.update(profile_params)
    unless @address.update(address_params)
      @profile.errors.add(:base, "Adresse nicht vollständig ausgefüllt")
    end
    unless @contact.update(contact_params)
      @profile.errors.add(:base, "Kontakt nicht vollständig ausgefüllt")
    end
    respond_with(@profile)
  end

  def destroy
    if (@profile.user.user_businesses.Administrator.all.count > 0) || (@profile.event_profiles.all.count > 0)
      flash[:error] = "Bitte verlassen Sie erst alle Unternehmen, in denen Sie ein Administrator sind und/oder löschen Sie all Ihre Events"
      respond_with(@profile)
    else
      Address.find(@profile.address_id).destroy
      Contact.find(@profile.contact_id).destroy
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
    @address  = Address.where(id: @profile.address_id).first
    @contact  = Contact.where(id: @profile.contact_id).first
  end

  def profile_params
    params.require(:profile).permit(:gender, :firstname, :lastname, :phone, :photo)
  end

  def address_params
    params.require(:address).permit(:city, :postalCode, :street1, :street2)
  end

  def contact_params
    params.require(:contact).permit(:phone, :mobilePhone, :mail)
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
