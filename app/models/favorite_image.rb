class FavoriteImage < ApplicationRecord
    validates :image_id, :author, :url, presence: true
    validates :image_id, uniqueness: true
    VALID_URL_REGEX = %r{\A(https://images.unsplash.com/photo-){1}[\d\D]+\z}
    validates :url, format: { with: VALID_URL_REGEX }
  end