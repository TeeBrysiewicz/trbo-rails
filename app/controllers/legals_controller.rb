class LegalsController < ApplicationController
  before_action :set_legal, only: [:show, :edit, :update, :destroy]

  # GET /legals
  # GET /legals.json
  def index
    @projects = Project.find(params[:project_id])
    @project = Project.find(params[:project_id])

    @legals = Legal.where(:project_id => @project.id)
    @legal = @project.legals
  end

  # GET /legals/1
  # GET /legals/1.json
  def show
    @project = Project.find(params[:project_id])
    @legal = @project.legals.find(params[:id])
  end

  # GET /legals/new
  def new
    @project = Project.find(params[:project_id])
    @legal = @project.legals.build
  end

  # GET /legals/1/edit
  def edit
  end

  # POST /legals
  # POST /legals.json
  def create
    @project = Project.find(params[:project_id])
    @legal = @project.legals.create(params[:legal])

    respond_to do |format|
      if @legal.save
        format.html { redirect_to ([@legal.project, @legal]), notice: 'Legal was successfully created.' }
        format.json { render :show, status: :created, location: @legal }
      else
        format.html { render :new }
        format.json { render json: ([@legal.project, @legal.errors]), status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /legals/1
  # PATCH/PUT /legals/1.json
  def update
    respond_to do |format|
      if @legal.update(legal_params)
        format.html { redirect_to ([@legal.project, @legal]), notice: 'Legal was successfully updated.' }
        format.json { render :show, status: :ok, location: @legal }
      else
        format.html { render :edit }
        format.json { render json: ([@legal.project, @legal.errors]), status: :unprocessable_entity }
      end
    end
  end

  # DELETE /legals/1
  # DELETE /legals/1.json
  def destroy
    @project = Project.find(params[:project_id])
    @legal = @project.legals.find(params[:id])

    @legal.destroy
    respond_to do |format|
      format.html { redirect_to (project_legals_url), notice: 'Legal was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_legal
      @legal = Legal.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def legal_params
      params.require(:legal).permit(:name, :project_id)
    end
end
