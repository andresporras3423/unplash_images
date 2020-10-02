Rails.application.routes.draw do
  root 'favorite_images#index'
  get 'favorite_images/index'
  get 'favorite_images/show'
  get 'favorite_images/edit'
  get 'favorite_images/create'
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
