require 'rails_helper'

#how to do this tests? here: https://devhints.io/capybara
RSpec.describe 'index page', type: :feature do
  before(:all) do
    fi = FavoriteImage.new(author: 'hilda', image_id: 'ascjagdyu', url: 'https://images.unsplash.com/photo-asdfg')
    fi.save
  end

  scenario 'visit search results' do
    visit '/'
    fill_in 'search', with: 'colombia'
    click_button 'Search'
    expect(page).to have_content('author:')
  end

  scenario 'click home' do
    visit '/favorite_images/show'
    click_link 'home'
    expect(page).to have_button('Search')
  end

  scenario 'click favorites' do
    visit '/'
    click_link 'favorite'
    expect(page).to_not have_button('Search')
  end

  scenario 'visit favorite images' do
    visit '/favorite_images/show'
    expect(page).to have_content('hilda')
  end

  scenario 'save image to favorites' do
    visit '/'
    fill_in 'search', with: 'colombia'
    click_button 'Search'
    first(:button, "save to favorites").click
    expect(page).to have_button('delete from favorites')
  end

  scenario 'remove image from favorites' do
    visit '/'
    fill_in 'search', with: 'colombia'
    click_button 'Search'
    first(:button, "save to favorites").click
    first(:button, "delete from favorites").click
    expect(page).to_not have_button('delete from favorites')
  end

  scenario 'find saved image in favorites' do
    visit '/'
    fill_in 'search', with: 'colombia'
    click_button 'Search'
    first(:button, "save to favorites").click
    click_link 'favorites'
    expect(page).to have_selector("#div-#{FavoriteImage.last.image_id}")
  end

  scenario 'should not find deleted image in favorites' do
    visit '/'
    fill_in 'search', with: 'colombia'
    click_button 'Search'
    first(:button, "save to favorites").click
    last_image_id = FavoriteImage.last.image_id
    first(:button, "delete from favorites").click
    click_link 'favorites'
    expect(page).to_not have_selector("#div-#{last_image_id}")
  end
end
