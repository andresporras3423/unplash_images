class AddUrlFavorite < ActiveRecord::Migration[6.0]
  def change
    add_column(:favorite_images, :url, :String)
  end
end
