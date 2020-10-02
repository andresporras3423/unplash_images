class CreateFavoriteImages < ActiveRecord::Migration[6.0]
  def change
    create_table :favorite_images do |t|
      t.string :search_name
      t.integer :image_id

      t.timestamps
    end
  end
end
