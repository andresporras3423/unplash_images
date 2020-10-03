class AddAuthor < ActiveRecord::Migration[6.0]
  def change
    add_column(:favorite_images, :author, :String)
  end
end
