class EventImagesController < ApplicationController
  before_action :set_event_image, only: [:show, :edit, :update, :destroy]

  respond_to :html

  # GET /event_images
  # GET /event_images.json
  def index
    @event_images = EventImage.all
  end

  # GET /event_images/1
  # GET /event_images/1.json
  def show

  end

  # GET /event_images/new
  def new
    @event_image = EventImage.new
  end

  # GET /event_images/1/edit
  def edit
  end

  # POST /event_images
  # POST /event_images.json
  def create
    if (params[:event_image].present? && params[:event_image][:image].present?)
      if params[:event_image][:image].count == 0
        flash[:error] = "Keine Bilder ausgewählt!"
      else
        counter = 0
        params[:event_image][:image].each { |pic|
          i = EventImage.new(:image=> pic)
          i.album = "Upload"
          i.event_id = params[:event_id]
          counter = counter + 1 if i.save
        }
        if counter == params[:event_image][:image]
          flash[:notice] = "Es wurden alle Bilder hochgeladen."
        else
          flash[:error] = "Ein Fehler ist aufgetreten. Es wurden nur #{counter} Bilder hochgeladen!"
        end
      end
    end

    respond_with(Event.find(params[:event_id]))


  end

  # PATCH/PUT /event_images/1
  # PATCH/PUT /event_images/1.json
  def update
    respond_to do |format|
      if @event_image.update(event_image_params)
        format.html { redirect_to @event_image, notice: 'Event image was successfully updated.' }
        format.json { render :show, status: :ok, location: @event_image }
      else
        format.html { render :edit }
        format.json { render json: @event_image.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event_images/1
  # DELETE /event_images/1.json
  def destroy
    @event_image.destroy
    respond_to do |format|
      format.html { redirect_to event_images_url, notice: 'Event image was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event_image
      @event_images = EventImage.where(event_id: params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_image_params
      params[:event_image]
    end
end
