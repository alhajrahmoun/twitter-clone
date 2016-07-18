class TweetsController < ApplicationController
	before_action :tweet_find, only: [:edit,:update, :destroy]
	before_action :authenticate_user!

	def index
		@tweets = Tweet.all.order("created_at DESC")
	end

	def create
		@tweet = current_user.tweets.build(tweet_params)
		respond_to do |format|
		if @tweet.save
			format.html {redirect_to tweets_path }
			format.js { render action: 'tweet'} 
		else
			render 'new'
		end
	end
	end

	def edit
		respond_to do |format|
			format.js { render action: 'edit'} 
		end
	end

	def update
		if @tweet.update(tweet_params)
			respond_to do |format|
			format.js { render action: 'update'} 
		end
		end
	end

	def destroy
		@tweet.destroy!
		redirect_to tweets_path
	end

	private
	def tweet_params
		params.require(:tweet).permit(:content)
	end

	def tweet_find
		@tweet = Tweet.find(params[:id])
	end

end
