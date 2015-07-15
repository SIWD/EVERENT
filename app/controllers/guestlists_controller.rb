class GuestlistsController < ApplicationController
  before_action :set_guestlist, only: [:show]

  # GET /guestlists
  # GET /guestlists.json
  def index
    @users_guestlists = Guestlist.where(user_id: current_user.id).all.sort { |a, b| a.date <=> b.date }
  end

  # GET /guestlists/1
  # GET /guestlists/1.json
  def show
  end

  # GET /guestlists/new
  def new
    @guestlist = Guestlist.new
  end

  # GET /guestlists/1/edit
  def edit
  end

  # POST /guestlists
  # POST /guestlists.json
  def create
    @guestlist = Guestlist.new(guestlist_params)

    respond_to do |format|
      if @guestlist.save
        format.html { redirect_to @guestlist, notice: 'Guestlist was successfully created.' }
        format.json { render :show, status: :created, location: @guestlist }
      else
        format.html { render :new }
        format.json { render json: @guestlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /guestlists/1
  # PATCH/PUT /guestlists/1.json
  def update
    respond_to do |format|
      if @guestlist.update(guestlist_params)
        format.html { redirect_to @guestlist, notice: 'Guestlist was successfully updated.' }
        format.json { render :show, status: :ok, location: @guestlist }
      else
        format.html { render :edit }
        format.json { render json: @guestlist.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /guestlists/1
  # DELETE /guestlists/1.json
  def destroy
    @guestlist.destroy
    respond_to do |format|
      format.html { redirect_to guestlists_url, notice: 'Guestlist was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_guestlist
    @event = Event.find(params[:id])
    @guestlists = Guestlist.where(event_id: @event.id).all.sort { |a, b| a.name <=> b.name }
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def guestlist_params
    params[:guestlist]
  end

end
