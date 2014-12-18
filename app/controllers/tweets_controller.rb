class TweetsController < ApplicationController

  def index
  end

  def show
    mood = Tweet.get_mood(tweets_params)
    if mood
      render json: { mood: mood.to_s }
    else
      render json: { mood: 'false' }
    end
  end

  private
    def tweets_params
      params.require(:id)
    end
end
