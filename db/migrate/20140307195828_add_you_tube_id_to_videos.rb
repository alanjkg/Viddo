class AddYouTubeIdToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :youtube_id, :integer
  end
end
