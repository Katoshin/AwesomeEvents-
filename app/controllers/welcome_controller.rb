class WelcomeController < ApplicationController
	PER = 10

	def index
		@musics = Music.page(params[:page]).per(PER)
	end
end
