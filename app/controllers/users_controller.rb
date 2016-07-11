class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @comments = Comment.where(commentable: @user)
    @comment = Comment.new
    @comment.commentable = @user
  end
end
