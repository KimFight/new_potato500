class StoresController < ApplicationController
  #before_action :set_###, only: [:###] 最後にまとめます
  before_action :authenticate_user!, except: [:index, :show, :search]
 
      def index
        @stores = Store.order("RAND()").limit(3)
      end

      def new
          @store = Store.new
      end

      def create
        @store = Store.new(store_params)
        if @store.valid?
          @store.save
          redirect_to root_path
        else
          render 'new'
        end
      end

      def edit
        @store = Store.find(params[:id])
      end

      def update
        store = Store.find(params[:id])
        
          if store.valid? 
            store.update(store_params)
            redirect_to store_path
          else
            render 'edit'
          end
        end

      def search
        @results = @p.result
      end


      def show
        @store = Store.find(params[:id])
        @comment = Comment.new
        @comments = @store.comments.includes(:user).order("created_at DESC").limit(10)
      end
 
      def destroy
        store = Store.find(params[:id])
        store.destroy
        redirect_to action: :index
      end


  private

    def store_params
      params.require(:store).permit(:store_name, :postal_code, :prefecture_id, :city, :address, :building_name, :phone_number, :close_day, :open_time, :close_time, :content_500, :introduction, images: []).merge(user_id: current_user.id)
    end
    
end
