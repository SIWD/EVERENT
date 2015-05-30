class AgbsController < ApplicationController
  before_action :set_agb, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @agbs = Agb.all
    respond_with(@agbs)
  end

  def show
    respond_with(@agb)
  end

  def new
    @agb = Agb.new
    respond_with(@agb)
  end

  def edit
  end

  def create
    @agb = Agb.new(agb_params)
    @agb.save
    respond_with(@agb)
  end

  def update
    @agb.update(agb_params)
    respond_with(@agb)
  end

  def destroy
    @agb.destroy
    respond_with(@agb)
  end

  private
    def set_agb
      @agb = Agb.find(params[:id])
    end

    def agb_params
      params[:agb]
    end
end
