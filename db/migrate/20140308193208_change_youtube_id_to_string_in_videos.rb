class ChangeYoutubeIdToStringInVideos < ActiveRecord::Migration
  def change
    change_column :videos, :youtube_id, :integer
  end
end
