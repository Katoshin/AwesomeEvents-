class ChecksController < ApplicationController
	before_action :authenticate

	def new
		raise ActionController::RoutingError, 'ログイン状態で ChecksController#new にアクセス'
	end

	def create
		check = current_user.checks.build do |t|
			t.music_id = params[:music_id]
			t.comment = params[:check][:comment]
		end
		if check.save
			flash[:notice] = 'YO！チェケラ！'
			head 201
		else
			render json: { messages: check.errors.full_messages }, status: 422
		end
	end
end
