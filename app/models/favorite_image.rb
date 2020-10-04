class FavoriteImage < ApplicationRecord
    validates :image_id, :author, :url, presence: true
    validates :image_id, uniqueness: true
    # VALID_EMAIL_REGEX = /\A[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}\z/ix.freeze
    # validates :url, format: { with: VALID_EMAIL_REGEX }
end
