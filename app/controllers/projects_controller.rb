class ProjectsController < ApplicationController
  before_action :require_login, only: [:new, :create]

  def index
    @projects = Project.all
    @projects = @projects.order(:end_date)
  end

  def show
    @project = Project.find(params[:id])
    @comment = @project.comments.new
  end

  def new
    @project = Project.new
    @project.rewards.build
  end

  def create
    @project = Project.new(project_params)
    @project[:owner_id] = current_user.id
    puts "==========save??============"
    if @project.save
      redirect_to projects_url
    else
      render :new
    end
   end

  private
  def project_params
    params.require(:project).permit(:title, :description, :goal, :start_date, :end_date, :image)
  end
end
