class BusinessesController < ApplicationController
  before_action :set_business, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @businesses = Business.all
    respond_with(@businesses)
  end

  def show
    respond_with(@business)
  end

  def new
    @business = Business.new
    respond_with(@business)
  end

  def edit
  end

  def create
    address = Address.new(address_params)
    geo = Geokit::Geocoders::GoogleGeocoder.geocode("#{address.city} #{address.zipcode} #{address.streetName} #{address.streetNumber}")
    address.country = geo.country_code
    address.stateCode = geo.state_code
    address.lat = geo.lat
    address.lng = geo.lng
    address.save

    @business = Business.new(business_params)
    @business.address_id = address.id
    @business.save
    @business.user_businesses.create([{ user_id: current_user.id }])
    respond_with(@business)

  end

  def update
    @business.update(business_params)
    address = Address.find(@business.address_id)
    address.update(address_params)
    geo = Geokit::Geocoders::GoogleGeocoder.geocode("#{address.city} #{address.zipcode} #{address.streetName} #{address.streetNumber}")
    address.country = geo.country_code
    address.stateCode = geo.state_code
    address.lat = geo.lat
    address.lng = geo.lng
    address.save

    respond_with(@business)
  end

  def destroy
    @business.destroy
    respond_with(@business)
  end

  private
    def set_business
      @business = Business.find(params[:id])
      @services = Service.where(business_id: @business.id)
      @address  = Address.where(id: @business.address_id).first
    end

    def business_params
      params.require(:business).permit(:name)
    end
    def address_params
      params.require(:address).permit(:city, :zipcode, :streetName, :streetNumber)
    end
end
