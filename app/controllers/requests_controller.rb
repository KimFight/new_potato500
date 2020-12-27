class RequestsController < ApplicationController
  def create
    Requests.create(requests_params)
    
    #遷移元のURLを取得してリダイレクト
    redirect_to request.referer
  end

  private
  def requests_params
    params.require(:requests).permit(:request).merge(user_id: current_user.id)
  end

end
