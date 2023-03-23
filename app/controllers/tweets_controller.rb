class TweetsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    tweet = Tweet.new(tweet_params)

    if tweet.save
      redirect_to dashboard_path
    end
  end

  private

  def tweet_params
    params.require(:tweet).permit(:body).merge(user: current_user)
  end
end
