class MusicsController < ApplicationController
	before_action :authenticate, expect: :show

	def show
		@music = Music.find(params[:id])
		@check = current_user && current_user.checks.find_by(music_id: params[:id])
		@checks = @music.checks.includes(:user).order(:created_at)
	end

	def new
		@music = current_user.created_musics.build
	end

	def create
		@music = current_user.created_musics.build(music_params)
		if @music.save
			redirect_to @music, notice: '作成しました'
		else
			render :new
		end
	end

	
	def destroy
		@music = current_user.created_musics.find(params[:id])
		@music.destroy!
		redirect_to root_path, notice: '削除しました'
	end

	private

	def music_params
		params.require(:music).permit(
			:url
		)
	end
end
