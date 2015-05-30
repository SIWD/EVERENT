class ImpressumsController < ApplicationController
  respond_to :html

  def index
    respond_with(@impressums)
  end

  def show
    respond_with(@impressum)
  end
end
