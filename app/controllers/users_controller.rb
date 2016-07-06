class UsersController < ApplicationController
  before_action :set_user, only: :show
  before_action :authorise

  def show
    @comments = Comment.where(commentable: @user)
    @comment = Comment.new
    @comment.commentable = @user
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def authorise
    case action_name
    when 'show'
      # only allow showing own user profile page, and prohibit others showing other profile pages
      redirect_to new_user_session_path if !user_signed_in? || current_user != @user
    end
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def comment_params
    params.require(:comment).permit(:message, :commentable_id, :commentable_type)
  end
end
