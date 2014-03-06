class RemoveCategoryIdToRelationships < ActiveRecord::Migration
  def change
    remove_column :relationships, :category_id, :integer
  end
end
