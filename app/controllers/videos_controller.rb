class VideosController < ApplicationController
  before_action :grab_videos, only: :index
  def index
    @videos = Video.all
  end

  def show
    @video = Video.find(params[:id])
    @comments = @video.comments.all
    @comment = Comment.new
    @collections = Collection.all
  end

  def new
  end

  def destroy
    @video = Video.find(params[:id])
    @video.destroy
    redirect_to collections_path
  end

  def create
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
          :parameters => {:part => 'id,snippet', :maxResults => 50, :chart => 'mostPopular'}
        )

      @search_response.data.items.each do |video|
        @youtube_video = video
      end

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
