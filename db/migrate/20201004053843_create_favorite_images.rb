class CreateFavoriteImages < ActiveRecord::Migration[6.0]
  def change
    create_table :favorite_images do |t|
      t.string :author
      t.string :image_id
      t.string :url

      t.timestamps
    end
  end
end
