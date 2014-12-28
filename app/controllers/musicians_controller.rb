class MusiciansController < ApplicationController
  before_action :set_musician, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @musicians = Musician.all
    respond_with(@musicians)
  end

  def show
    respond_with(@musician)
  end

  def new
    @musician = Musician.new
    respond_with(@musician)
  end

  def edit
  end

  def create
    @musician = Musician.new(musician_params)
    @musician.save
    respond_with(@musician)
  end

  def update
    @musician.update(musician_params)
    respond_with(@musician)
  end

  def destroy
    @musician.destroy
    respond_with(@musician)
  end

  private
    def set_musician
      @musician = Musician.find(params[:id])
    end

    def musician_params
      params.require(:musician).permit(:hasEquipment)
    end
end
