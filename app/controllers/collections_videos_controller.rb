class CollectionsVideosController < ApplicationController
  def create
    @video = Video.find(params[:video_id])
    @collection = Collection.find(params[:collection_id])
    @find_collection = @collection.videos.find_by(@video.id)
    unless @find_collection
        @new_collection_video = @collection.videos.build()
        @new_collection_video.video_id = @video.id
        @new_collection_video.save
    end
  end

end
