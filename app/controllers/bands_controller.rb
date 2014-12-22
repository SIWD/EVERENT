class BandsController < ApplicationController
  before_action :set_band, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @bands = Band.all
    respond_with(@bands)
  end

  def show
    respond_with(@band)
  end

  def new
    @band = Band.new
    respond_with(@band)
  end

  def edit
  end

  def create
    @band = Band.new(band_params)
    @band.save
    respond_with(@band)
  end

  def update
    @band.update(band_params)
    respond_with(@band)
  end

  def destroy
    @band.destroy
    respond_with(@band)
  end

  private
    def set_band
      @band = Band.find(params[:id])
    end

    def band_params
      params.require(:band).permit(:maxCapacity, :members, :userService_id, :category_id)
    end
end
