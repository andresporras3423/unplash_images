class FavoriteImagesController < ApplicationController

  def index
    $home=true
    @search = params[:search]
    if @search
        photos = Unsplash::Photo.search(@search)
        # p "HERE CHECK OUT"
        # p photos[0]
        # url = "https://api.unsplash.com/search/photos?query=#{@search_name}&client_id=z88eko8yjR2DJRxJhpSWZAAS-eNdEP19QBE6mvQGrDI"
        # uri = URI(url)
        # response = Net::HTTP.get(uri)
        @favorite_images = FavoriteImage.all
        @api_response = photos.map{|image| {"url"=> image["urls"]["small"], "user"=> image["user"]["username"], "id"=>image["id"]}}
    end

    # if params[:method]=="save_image"
    #   avoriteImage.create(image_id: params[:id], search_name: "hello world")
    # end
    # photo = Unsplash::Photo.find("3SIXZisims4")
    #   p "BELOW ALL THE DETAILS"
    #   p photo["urls"]["small"]
  end

  def save
    FavoriteImage.create(image_id: params[:id], url: params[:url], author: params[:author])
    redirect_to controller: 'favorite_images', action: 'index', search: params[:search]
    # redirect_to "/favorite_images/index", method: 'post', params: {search: params[:search]}
  end

  def delete
    image_to_delete = FavoriteImage.find_by_image_id(params[:id])
    image_to_delete.destroy
    redirect_back fallback_location: root_path
    # redirect_to controller: 'favorite_images', action: 'index', search: params[:search]
    # redirect_to "/favorite_images/index", method: 'post', params: {search: params[:search]}
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