class CommentsController < ApplicationController
  def create
    Comment.create(comment_params)
    
    #遷移元のURLを取得してリダイレクト
    redirect_to request.referer
  end

  def destroy
    Comment.find_by(id: params[:id],store_id: params[:store_id]).destroy
    redirect_to request.referer
  end

  private
  def comment_params
    params.require(:comment).permit(:comment,:comment_image).merge(user_id: current_user.id, store_id: params[:store_id])
  end
end
