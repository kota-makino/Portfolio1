class FavoritesController < ApplicationController
  def index
    @favorite_topics = current_user.favorite_topics
  end

  def create
    favorite = Favorite.new
    favorite.user_id = current_user.id
    favorite.topic_id = params[:topic_id]

    favorite.save
    redirect_to topics_path
  end

  def destroy
    Favorite.where(user_id: current_user.id).where(topic_id: params[:topic_id]).delete_all
    redirect_to topics_path
  end
end
