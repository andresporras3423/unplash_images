class FavoriteImagesController < ApplicationController

  def index
    $home=true
    @search = params[:search]
    if @search
        photos = Unsplash::Photo.search(@search)
        @favorite_images = FavoriteImage.all
        @api_response = photos.map{|image| {"url"=> image["urls"]["small"], "user"=> image["user"]["username"], "id"=>image["id"]}}
    end
  end

  def save
    FavoriteImage.create(image_id: params[:id], url: params[:url], author: params[:author])
    redirect_to controller: 'favorite_images', action: 'index', search: params[:search]
  end

  def delete
    image_to_delete = FavoriteImage.find_by_image_id(params[:id])
    image_to_delete.destroy
    redirect_back fallback_location: root_path
  end

  def show
    $home=false
    @favorites = FavoriteImage.all
  end

  def edit
  end

  def create
  end
end