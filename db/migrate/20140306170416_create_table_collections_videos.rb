class CreateTableCollectionsVideos < ActiveRecord::Migration
  def change
    create_table :collections_videos do |t|
      t.integer :video_id
      t.integer :collection_id
    end
  end
end
