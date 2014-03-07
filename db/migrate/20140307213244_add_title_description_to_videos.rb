class AddTitleDescriptionToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :title, :string
    add_column :videos, :description, :string
  end
end
