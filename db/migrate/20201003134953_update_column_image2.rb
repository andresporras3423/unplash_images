class UpdateColumnImage2 < ActiveRecord::Migration[6.0]
  def change
    change_column :favorite_images, :image_id, :String
  end
end
