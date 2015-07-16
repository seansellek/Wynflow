class ProjectsController < ApplicationController
  before_action :require_user, only: [:new, :create, :update, :edit, :vote, :destroy]
  def new
    @project = Project.new
  end
  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to @project
    else
      render 'new'
    end
  end
  def show
    @project = Project.find(params[:id])
  end
  def index
    @projects = Project.all
  end
  def edit
    @project = Project.find(params[:id])
  end
  def update
    @project = Project.find(params[:id])
    if @project.update(project_params)
      redirect_to @project
    else
      render 'edit'
    end
  end
  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    redirect_to projects_path
  end
  def vote
    @project = Project.find(params[:id])
    @project.votes ||= 0
    @project.votes += 1
    @project.save
    redirect_to projects_path
  end


  private
  def project_params
    params.require(:project).permit(:title,:description,:repo, :url, :img, :collab, :cohort)
  end
end
