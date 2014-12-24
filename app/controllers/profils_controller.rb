class ProfilsController < ApplicationController
  before_action :set_profil, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @profils = Profil.all
    respond_with(@profils)
  end

  def show
    respond_with(@profil)
  end

  def new
    @profil = Profil.new
    respond_with(@profil)
  end

  def edit
  end

  def create
    @profil = Profil.new(profil_params)
    @profil.user_id = current_user.id
    @profil.save
    respond_with(@profil)
  end

  def update
    @profil.update(profil_params)
    respond_with(@profil)
  end

  def destroy
    @profil.destroy
    respond_with(@profil)
  end

  private
    def set_profil
      @profil = Profil.find(params[:id])
    end

    def profil_params
      params.require(:profil).permit(:gender, :firstname, :lastname, :phone, :city, :postcode, :streetname, :housenumber, :user_id)
    end
end
