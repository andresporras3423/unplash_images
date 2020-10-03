class RemoveColumnSearch < ActiveRecord::Migration[6.0]
  def change
    remove_column :favorite_images, :search_name
  end
end
