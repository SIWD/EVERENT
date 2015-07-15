class GuestlistDetailsController < ApplicationController
  before_action :set_guestlist_detail, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @guestlist_details = GuestlistDetail.all
    respond_with(@guestlist_details)
  end

  def show
    respond_with(@guestlist_detail)
  end

  def new
    @guestlist_detail = GuestlistDetail.new
    respond_with(@guestlist_detail)
  end

  def edit
  end

  def create
    @guestlist_detail = GuestlistDetail.new(guestlist_detail_params)
    @guestlist_detail.save
    respond_with(@guestlist_detail)
  end

  def update

    new = GuestlistDetail.new(guestlist_detail_params)
    if new.size == @guestlist_detail.size &&
        new.offer == @guestlist_detail.offer &&
        new.end_date == @guestlist_detail.end_date &&
        new.end_time == @guestlist_detail.end_time

      @guestlist_detail.update(guestlist_detail_params)
    else
      event = Event.find(@guestlist_detail.event)
      @guestlist_detail = GuestlistDetail.new(guestlist_detail_params)
      @guestlist_detail.event = event
      @guestlist_detail.save
    end

    unless guestlist_detail_params[:active] == "true"
      @guestlist_detail.active = false
      @guestlist_detail.save
    end

    respond_with(@guestlist_detail.event)
  end

  def destroy
    @guestlist_detail.active = false
    @guestlist_detail.save
    respond_with(@guestlist_detail.event)
  end

  private
    def set_guestlist_detail
      @guestlist_detail = GuestlistDetail.find(params[:id])
    end

    def guestlist_detail_params
      params.require(:guestlist_detail).permit(:event_id, :active, :size, :offer, :end_date, :end_time)
    end
end
