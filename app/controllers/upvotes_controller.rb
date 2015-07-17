class UpvotesController < ApplicationController
  def create
    # @project = Project.find(params[:project_id])
    redirect_to '/login' unless current_user
    @upvote = current_user.upvotes.new(project_id: params[:project_id])

    if @upvote.save
      proj = Project.find(params[:project_id])
      proj.votes += 1
      proj.save
    else
      Upvote.find_by(user_id: current_user.id, project_id: params[:project_id]).destroy
      proj = Project.find(params[:project_id])
      proj.votes -= 1
      proj.save
    end

    redirect_to :back
    # unless current_user.upvotes.any? {|upvote| upvote.project = @project }
    #   @vote = Upvote.create
    #   @vote.project = @project
    #   @vote.user = current_user
    # else
    #   @vote = current_user.upvotes.find()
    #

  end

end
