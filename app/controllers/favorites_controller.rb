class FavoritesController < ApplicationController
    def index
      @favorite_topics = current_user.favorite_topics
    end
    # favorite_topicsはuserモデルで定義したもの

  def create
    favorite = Favorite.new
    favorite.user_id = current_user.id
    # link_to favorites_path(topic_id: topic.id), method: :post do 
    # ↑からparamsの値を受け取っている
    favorite.topic_id = params[:topic_id]

    if favorite.save
      redirect_to topics_path, success: 'お気に入りに登録しました'
    else
      redirect_to topics_path, danger: 'お気に入りに登録に失敗しました'
    end
  end
  def destroy
    @favorite = Favorite.find_by(topic_id: params[:topic_id],user_id: current_user.id)
    if @favorite
      @favorite.destroy
      redirect_to topics_path, success: 'お気に入りを取り消しました'
    end
  end
end
