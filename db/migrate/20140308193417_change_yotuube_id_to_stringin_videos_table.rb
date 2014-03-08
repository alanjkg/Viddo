class ChangeYotuubeIdToStringinVideosTable < ActiveRecord::Migration
  def change
    change_column :videos, :youtube_id, :string
  end
end
