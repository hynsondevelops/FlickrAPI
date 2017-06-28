class StaticPageController < ApplicationController

	def new

	end

	def create

	end

	def index
		FlickRaw.api_key=ENV["API_KEY"]
		FlickRaw.shared_secret=ENV["SHARED_SECRET"]
		flickr.access_token = ENV["ACCESS_TOKEN"]
		flickr.access_secret = ENV["ACCESS_SECRET"]
		@photos = flickr.photos.search(:user_id => params[:user_id])
		@photo_urls = []
		for i in 0...(@photos.size)
			@photo_urls.push(FlickRaw.url_b(flickr.photos.getInfo(:photo_id => @photos[i].id)))
		end
	end

	def show 
		FlickRaw.api_key=ENV["API_KEY"]
		FlickRaw.shared_secret=ENV["SHARED_SECRET"]
		flickr.access_token = ENV["ACCESS_TOKEN"]
		flickr.access_secret = ENV["ACCESS_SECRET"]
		#@photos = flickr.photos.search(:user_id => "151538338@N03")
		@photo_urls = []
		for i in 0...(@photos.size)
			@photo_urls.push(FlickRaw.url_b(flickr.photos.getInfo(:photo_id => @photos[i].id)))
		end
	end
end
