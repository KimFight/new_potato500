class CommentsController < ApplicationController
  def create
    Comment.create(comment_params)
    redirect_to request.referer
  end

  def destroy
  end

  private
  def comment_params
    params.require(:comment).permit(:comment,:comment_image).merge(user_id: current_user.id, store_id: params[:store_id])
  end
end
