class RemoveImageUrlFromLists < ActiveRecord::Migration[6.0]
  def change
    remove_column :lists, :image_url
  end
end
