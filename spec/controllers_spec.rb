require 'rails_helper'

#how to do this tests? here: https://devhints.io/capybara
RSpec.describe 'index page', type: :feature do
  before(:all) do
    fi = FavoriteImage.new(author: 'hilda', image_id: 'ascjagdyu', url: 'https://images.unsplash.com/photo-asdfg')
    fi.save
  end

  # before(:each) do
  #   visit '/'
  #   fill_in 'search', with: 'colombia'
  #   fill_in 'password', with: '123456'
  #   click_button 'Log In'
  # end

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

#   scenario 'sign up page' do
#     find('a', text: 'Logout').click
#     visit '/signup'
#     expect(page).to have_content('Password confirmation:')
#   end

#   scenario 'signup event' do
#     find('a', text: 'Logout').click
#     visit '/signup'
#     fill_in 'name', with: 'fernando'
#     fill_in 'email', with: 'f@f.com'
#     fill_in 'password', with: '123456'
#     fill_in 'password_confirmation', with: '123456'
#     click_button 'Sign Up'
#     page.should have_content('Sign In')
#   end

#   scenario 'login event' do
#     page.should have_content('Signed in as user1')
#   end

#   scenario 'post event' do
#     find('a', text: 'new article').click
#     @text = '1234qwerasdf' * 20
#     fill_in 'title', with: 'my first article'
#     fill_in 'text', with: @text
#     page.attach_file('image', File.expand_path('./app/assets/images/screenshot.png'))
#     find('#checkbox1').click
#     click_button 'Submit'
#     page.should have_content('my first article')
#   end

#   scenario 'access to category' do
#     find('a', text: 'new article').click
#     @text = '1234qwerasdf' * 20
#     fill_in 'title', with: 'my first article'
#     fill_in 'text', with: @text
#     page.attach_file('image', File.expand_path('./app/assets/images/screenshot.png'))
#     find('#checkbox1').click
#     click_button 'Submit'
#     find('a', text: 'health').click
#     page.should have_content('1234qwerasdf')
#   end

#   scenario 'vote article' do
#     find('a', text: 'new article').click
#     @text = '1234qwerasdf' * 20
#     fill_in 'title', with: 'my first article user1'
#     fill_in 'text', with: @text
#     page.attach_file('image', File.expand_path('./app/assets/images/screenshot.png'))
#     find('#checkbox1').click
#     click_button 'Submit'
#     article = Article.all.find_by_title('my first article user1')
#     find('a', text: 'health').click
#     find("#article#{article.id}").click
#     page.should have_content('1234qwerasdf')
#   end

#   scenario 'vote article' do
#     find('a', text: 'new article').click
#     @text = '1234qwerasdf' * 20
#     fill_in 'title', with: 'my first article user1'
#     fill_in 'text', with: @text
#     page.attach_file('image', File.expand_path('./app/assets/images/screenshot.png'))
#     find('#checkbox1').click
#     click_button 'Submit'
#     article = Article.all.find_by_title('my first article user1')
#     find('a', text: 'health').click
#     find("#article#{article.id}").click
#     click_button 'vote'
#     page.should have_content('total votes: 1')
#   end

#   scenario 'link to most popular article' do
#     find('a', text: 'new article').click
#     @text = '1234qwerasdf' * 20
#     fill_in 'title', with: 'my first article'
#     fill_in 'text', with: @text
#     page.attach_file('image', File.expand_path('./app/assets/images/screenshot.png'))
#     find('#checkbox1').click
#     click_button 'Submit'
#     find('a', text: 'Read More').click
#     page.should have_content('1234qwerasdf')
#   end
end
