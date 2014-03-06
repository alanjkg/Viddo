class AddCollectionIdToRelationships < ActiveRecord::Migration
  def change
    add_column :relationships, :collection_id, :integer
  end
end
