class CommentsController < ApplicationController

  def create
    @project = Project.find(params[:project_id])
    @comment = @project.comments.new
    @comment.comment = params[:comment][:comment]

    if @comment.save
      redirect_to @project

    else
      render 'projects/show'
    end
  end

end
