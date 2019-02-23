class TopicsController < ApplicationController
  def new
    @topic = Topic.new
  end

  def create
    @topic = current_user.topics.new(topic_params)

    if @topic.save
      redirect_to topic_path
    else
      render :new
    end
  end

  private
   def topic_params
     params.require(:topic).permit(:image, :description)
   end      
end
