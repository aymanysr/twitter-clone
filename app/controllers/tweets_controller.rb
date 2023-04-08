class TweetsController < ApplicationController
  before_action :authenticate_user!

  def create
    @tweet = Tweet.new(tweet_params)

    if @tweet.save
      respond_to do |format|
        format.html { redirect_to dashboard_path }
        format.turbo_stream
      end
    end
  end

  private

  def tweet_params
    params.require(:tweet).permit(:body).merge(user: current_user)
  end
end
