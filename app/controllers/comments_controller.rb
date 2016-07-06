class CommentsController < ApplicationController
  before_action :authorise

  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user

    @comment.save
    redirect_to :back, notice: 'Comment was successfully created.'
  end

  def destroy
    @comment.destroy
    redirect_to posts_url, notice: 'Comment was successfully destroyed.'
  end

  private

  def authorise
    case action_name
    when 'create'
      redirect_to new_user_session_path if !user_signed_in?
    when 'destroy'
      # only allow destroying of comment if the user is the creator of the comment
      redirect_to new_user_session_path if !user_signed_in? || current_user != @comment.user
    end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def comment_params
    params.require(:comment).permit(:message, :commentable_id, :commentable_type)
  end
end
