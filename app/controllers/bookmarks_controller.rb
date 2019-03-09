class BookmarksController < ApplicationController
  def index
    @bookmark_topics = current_user.bookmark_topics
  end

  def create
    bookmark = Bookmark.new
    bookmark.user_id = current_user.id
    bookmark.topic_id = params[:topic_id]

    bookmark.save
    redirect_to topics_path
  end

  def destroy
    Bookmark.where(user_id: current_user.id).where(topic_id: params[:topic_id]).delete_all
    redirect_to topics_path
  end
end
