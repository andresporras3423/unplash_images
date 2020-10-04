class UniqImageId < ActiveRecord::Migration[6.0]
  def change
    add_index :favorite_images, :image_id, unique: true, name: 'uniq_image_id'
  end
end
