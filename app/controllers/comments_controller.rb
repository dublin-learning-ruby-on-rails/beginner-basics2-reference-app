class CommentsController < ApplicationController
  before_action :set_comment, only: :destroy

  def create
    @comment = Comment.new(comment_params)

    @comment.save
    redirect_to :back, notice: 'Comment was successfully created.'
  end

  def destroy
    @comment.destroy
    redirect_to :back, notice: 'Comment was successfully destroyed.'
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def comment_params
    params.require(:comment).permit(:message, :commentable_id, :commentable_type)
  end
end
