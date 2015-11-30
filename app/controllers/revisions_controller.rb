class RevisionsController < ApplicationController
  before_action :set_revision, only: [:show, :edit, :update, :destroy]

  # GET /revisions
  # GET /revisions.json
  def index
    @projects = Project.find(params[:project_id])
    @revisions = Revision.find(params[:project_id])

    @project = Project.find(params[:project_id])
    @revision = @project.revisions
  end

  # GET /revisions/1
  # GET /revisions/1.json
  def show
    @project = Project.find(params[:project_id])
    @revision = @project.revisions.find(params[:id])
  end

  # GET /revisions/new
  def new
    @project = Project.find(params[:project_id])
    @revision = @project.revisions.build
  end

  # GET /revisions/1/edit
  def edit
  end

  # POST /revisions
  # POST /revisions.json
  def create
    @project = Project.find(params[:project_id])
    @revision = @project.revisions.create(params[:revision])

    respond_to do |format|
      if @revision.save
        format.html { redirect_to ([@revision.project, @revision]), notice: 'Revision was successfully created.' }
        format.json { render :show, status: :created, location: @revision }
      else
        format.html { render :new }
        format.json { render json: @revision.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /revisions/1
  # PATCH/PUT /revisions/1.json
  def update
    respond_to do |format|
      if @revision.update(revision_params)
        format.html { redirect_to ([@revision.project, @revision]), notice: 'Revision was successfully updated.' }
        format.json { render :show, status: :ok, location: @revision }
      else
        format.html { render :edit }
        format.json { render json: ([@revision.project, @revision.errors]), status: :unprocessable_entity }
      end
    end
  end

  # DELETE /revisions/1
  # DELETE /revisions/1.json
  def destroy
    @project = Project.find(params[:project_id])
    @revision = @project.revisions.find(params[:id])

    @revision.destroy
    respond_to do |format|
      format.html { redirect_to (project_revisions_url), notice: 'Revision was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_revision
      @revision = Revision.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def revision_params
      params.require(:revision).permit(:name, :project_id)
    end
end
