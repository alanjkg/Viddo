class Video < ActiveRecord::Base
    has_and_belongs_to_many :collections
    validates :youtube_id, uniqueness: true, presence: true

    # def input_videos
    #     @video = Video.new
    #     @video.title = @search_response.snippet.title
    #     @video.description = @search_response.snippet.description
    #     @video.youtube.id = @search_response.id
    # end

    # def grab_videos
    #   @search_response = YOUTUBE_CLIENT.execute!(
    #       :api_method => YOUTUBE.videos.list,
    #       :parameters => {:part => 'id,snippet', :videoCategoryId => '17', :chart => 'mostPopular'}
    #     )
    # end

    # def self.save_data_from_api
    #     video_data = JSON.parse(grab_videos)
    #     videos = video_data.map do |row|
    #         video = Video.new
    #         video.youtube_id = row['id']
    #         video.save
    #     end
    # end
end
