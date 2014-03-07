class VideosController < ApplicationController
  before_action :grab_videos, only: :index
  def index   
  end

  def new
  end

  def create
  	@video = Video.new
    @video.title = @search_response.snippet.title
    @video.description = @search_response.snippet.description
    @video.youtube_id = @search_response.id
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
			@video = current_user.collection.videos.find_by(id: params[:id])
			redirect_to root_url if @video.nil?
		end

    private

    def grab_videos
      @search_response = YOUTUBE_CLIENT.execute!(
          :api_method => YOUTUBE.videos.list,
          :parameters => {:part => 'id,snippet', :videoCategoryId => '17', :chart => 'mostPopular'}
        )

      @youtube_video = @search_response.data.items[rand(0..4)]

      @video = Video.find_by_youtube_id(@youtube_video.id)

      unless @video
        new_video = Video.new
        new_video.title = @youtube_video.snippet.title
        new_video.description = @youtube_video.snippet.description
        new_video.youtube_id = @youtube_video.id
        new_video.save

        @video = new_video
      end
    end
end
