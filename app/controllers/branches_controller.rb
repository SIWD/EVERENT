class BranchesController < ApplicationController
  before_action :set_branch_by_name, only: [:show, :edit, :update, :destroy]
  before_action :set_service, only: [:show, :edit, :update, :destroy]

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
    if defined? params['filter']['zipcode']
      unless params['filter']['zipcode'] == ''
        @zip = params['filter']['zipcode']




        services = @services.where(business_id: Business.where(address_id: Address.where(zipcode: @zip))).all
        if services.size > 0
         # @services = services

        end
      end
    end
  end

  def branch_params
    params.require(:branch).permit(:name, :branchCategory_id)
  end
end