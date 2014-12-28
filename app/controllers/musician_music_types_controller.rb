class MusicianMusicTypesController < ApplicationController
  before_action :set_musician_music_type, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @musician_music_types = MusicianMusicType.all
    respond_with(@musician_music_types)
  end

  def show
    respond_with(@musician_music_type)
  end

  def new
    @musician_music_type = MusicianMusicType.new
    respond_with(@musician_music_type)
  end

  def edit
  end

  def create
    @musician_music_type = MusicianMusicType.new(musician_music_type_params)
    @musician_music_type.save
    respond_with(@musician_music_type)
  end

  def update
    @musician_music_type.update(musician_music_type_params)
    respond_with(@musician_music_type)
  end

  def destroy
    @musician_music_type.destroy
    respond_with(@musician_music_type)
  end

  private
    def set_musician_music_type
      @musician_music_type = MusicianMusicType.find(params[:id])
    end

    def musician_music_type_params
      params[:musician_music_type]
    end
end
