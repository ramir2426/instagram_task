class HomeController < ApplicationController
	before_action :authenticate_user!

	def index
		InstagramApi.config do |config|
			config.access_token = '5523402155.c5de8ae.d495c0c086c248e9851f575ceed0c021'
			config.client_id = 'c5de8ae6b37c4481bf4fb028d8fb6bc1'
			config.client_secret = '3b5bed7dc9484c26a98931bddb5cda47'
		end
		@user_info = InstagramApi.user(current_user.uid).show
	end
	
end
