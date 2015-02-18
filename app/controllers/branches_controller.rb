class BranchesController < ApplicationController
  before_action :set_branch_by_name, only: [:show, :edit, :update, :destroy]
  before_action :set_service, only: [:show, :edit, :update, :destroy]
  before_action :set_location, only: [:show]

  respond_to :html

  def index
    @branches = Branch.all
    respond_with(@branches)
  end

  def show
    respond_with(@branch)
  end

  def new
    @branch = Branch.new
    respond_with(@branch)
  end

  def edit
  end

  def create
    @branch = Branch.new(branch_params)
    @branch.save
    respond_with(@branch)
  end

  def update
    @branch.update(branch_params)
    respond_with(@branch)

    respond_to do |format|
      if @branch.update(branch_params)
        name = @branch.name
        if name.include? ' '
          name[' '] = '_'
        end

        format.html { redirect_to "#{branch_path}/#{name}", notice: 'Branche wurde erfolgreich aktualisiert.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @branch.destroy
    respond_with(@branch)
  end

  private
  def set_branch_by_name
    name = params[:name]
    if name.include? '_'
      name['_'] = ' '
    end
    @branch = Branch.where(name: name).first
  end

  def set_branch
    @branch = Branch.find(params[:id])
  end

  def set_service
    @services = Service.where(branch_id: @branch)
  end


  def set_location
    @range = params['range'] || 50
    @success = false
    if (params['location'] && !(params['location'] == ('')))
      @loc = params['location']

      if @loc_from = Location.where(address: @loc).first
      else
        results = Geocoder.search(@loc, :region => 'DE')
        result = results.first
        @loc_from = Location.create(address: result.address)
      end
    end
  end


  def branch_params
    params.require(:branch).permit(:name, :branchCategory_id)
  end
end