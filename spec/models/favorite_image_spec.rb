require 'rails_helper'

RSpec.describe FavoriteImage, type: :model do
    context 'FavoriteImage model' do
      let(:fi) { FavoriteImage.create(author: 'andres', image_id: 'qwe2wdiuduic', url: 'https://www.something.com') }
      before(:each) do
        fi.save
      end
      it 'check if image is valid' do
        expect(fi.valid?).to eq(true)
      end
      it 'check if image is invalid by existing image_id' do
        fi2 = FavoriteImage.new(author: 'andres', image_id: 'qwe2wdiuduic', url: 'https://www.something.com')
        expect(fi2.valid?).to_not eq(true)
      end
      it 'check if image is invalid by not present image_id' do
        fi2 = FavoriteImage.new(author: 'andres', image_id: '', url: 'https://www.something.com')
        expect(fi2.valid?).to eq(false)
      end
      it 'check if image is invalid by not present author' do
        fi2 = FavoriteImage.new(author: '', image_id: 'rvih3r89h', url: 'https://www.something.com')
        expect(fi2.valid?).to eq(false)
      end
      it 'check if image is invalid by not present url' do
        fi2 = FavoriteImage.new(author: 'oscar', image_id: 'acwhrawhruih', url: '')
        expect(fi2.valid?).to eq(false)
      end
      it 'check if image is invalid by invalid url' do
        fi2 = FavoriteImage.new(author: 'jenny', image_id: 'wichawcgawi', url: 'hello world')
        expect(fi2.valid?).to eq(false)
      end
    end
end
