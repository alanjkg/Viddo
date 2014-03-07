class VideosController < ApplicationController
  before_action :grab_videos
  def index   
  end

  def new
  end

  def create
  	@video = Video.new
    @video.title = @search_response.snippet.title
    @video.description = @search_response.snippet.description
    @video.youtube.id = @search_response.id
  	if @video.save
  		flash[:success] = "Video made!"
  		redirect_to root_url
  	else
  		render 'static_pages/home'
  	end
  end

  private

		def video_params
			params.require(:video).permit(:user_id, :title, :description, :youtube_id)
		end

		def correct_user
			@video = current_user.collection.videos.find_by(id: perams[:id])
			redirect_to root_url if @video.nil?
		end

    private

    def grab_videos
      @search_response = YOUTUBE_CLIENT.execute!(
          :api_method => YOUTUBE.videos.list,
          :parameters => {:part => 'id,snippet', :videoCategoryId => '17', :chart => 'mostPopular'}
        )
    end
end
