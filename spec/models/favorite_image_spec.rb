require 'rails_helper'

RSpec.describe FavoriteImage, type: :model do
    context 'FavoriteImage mocel' do
      let(:fi) { FavoriteImage.create(author: 'andres', image_id: 're9fh3498h', url: 'https://something.something') }
      before(:each) do
        fi.save
      end
      it 'valid image' do
        expect(fi.valid?).to eq(true)
      end
    end
end
