class MusicTypesController < ApplicationController
  before_action :set_music_type, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @music_types = MusicType.all
    respond_with(@music_types)
  end

  def show
    respond_with(@music_type)
  end

  def new
    @music_type = MusicType.new
    respond_with(@music_type)
  end

  def edit
  end

  def create
    @music_type = MusicType.new(music_type_params)
    @music_type.save
    respond_with(@music_type)
  end

  def update
    @music_type.update(music_type_params)
    respond_with(@music_type)
  end

  def destroy
    @music_type.destroy
    respond_with(@music_type)
  end

  private
    def set_music_type
      @music_type = MusicType.find(params[:id])
    end

    def music_type_params
      params.require(:music_type).permit(:name, :description)
    end
end
