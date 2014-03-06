class VideosController < ApplicationController
  def index
  end

  def new
  end

  def create
  	@video = current_user.collection.videos.build(video_params)
  	if @video.save
  		flash[:success] = "Video made!"
  		redirect_to root_url
  	else
  		render 'static_pages/home'
  	end
  end

  private

		def video_params
			params.require(:video).permit(:user_id)
		end

		def correct_user
			@video = current_user.collection.videos.find_by(id: perams[:id])
			redirect_to root_url if @video.nil?
		end


end