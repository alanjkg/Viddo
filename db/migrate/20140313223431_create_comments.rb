class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :blog
      t.integer :user_id
      t.integer :video_id
      t.integer :collection_id

      t.timestamps
    end
  end
end
