class AccountingsController < ApplicationController
  before_action :set_accounting, only: [:show, :edit, :update, :destroy]

  # GET /accountings
  # GET /accountings.json
  def index
    @projects = Project.find(params[:project_id])
    @project = Project.find(params[:project_id])

    @accountings = Accounting.where(:project_id => @project.id)
    @accounting = @project.accountings
  end

  # GET /accountings/1
  # GET /accountings/1.json
  def show
    @project = Project.find(params[:project_id])
    @accounting = @project.accountings.find(params[:id])
  end

  # GET /accountings/new
  def new
    @project = Project.find(params[:project_id])
    @accounting = @project.accountings.build
  end

  # GET /accountings/1/edit
  def edit
  end

  # POST /accountings
  # POST /accountings.json
  def create
    @project = Project.find(params[:project_id])
    @accounting = @project.accountings.create(params[:accounting])

    respond_to do |format|
      if @accounting.save
        format.html { redirect_to ([@accounting.project, @accounting]), notice: 'Accounting was successfully created.' }
        format.json { render :show, status: :created, location: @accounting }
      else
        format.html { render :new }
        format.json { render json: ([@accounting.project, @accounting.errors]), status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /accountings/1
  # PATCH/PUT /accountings/1.json
  def update
    respond_to do |format|
      if @accounting.update(accounting_params)
        format.html { redirect_to ([@accounting.project, @accounting]), notice: 'Accounting was successfully updated.' }
        format.json { render :show, status: :ok, location: @accounting }
      else
        format.html { render :edit }
        format.json { render json: ([@accounting.project, @accounting.errors]), status: :unprocessable_entity }
      end
    end
  end

  # DELETE /accountings/1
  # DELETE /accountings/1.json
  def destroy
    @project = Project.find(params[:project_id])
    @accounting = @project.accountings.find(params[:id])

    @accounting.destroy
    respond_to do |format|
      format.html { redirect_to (project_accountings_url), notice: 'Accounting was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_accounting
      @accounting = Accounting.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def accounting_params
      params.require(:accounting).permit(:name, :project_id)
    end
end
