class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :set_location_main
  before_action :set_range

  def set_location_main

    if (params['usrloc'] && !(params['usrloc'] == ('')))
      @usr_loc = params['usrloc']

      unless @loc_checked = Location.where(address: @usr_loc).first
        results = Geocoder.search(@usr_loc, :region => 'DE')
        result = results.first
        if result
          @loc_checked = Location.create(address: result.address)
          cookies.permanent[:location] = @loc_checked.address
        else
          flash[:alert] = "'#{@usr_loc}' wurde nicht gefunden"
        end
      end
    elsif (params['usrloc'] && (params['usrloc'] == ('')))
      @usr_loc = nil
      @loc_checked = nil
    elsif cookies[:location]
      @loc_checked = Location.where(address: cookies[:location]).first
      if @loc_checked
        @usr_loc = @loc_checked.address
      end
    end

  end

  def set_range
    @range = params['range'] || 50
  end

end
