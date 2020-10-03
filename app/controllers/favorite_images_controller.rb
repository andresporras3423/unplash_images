class FavoriteImagesController < ApplicationController

  def index
    if params[:search_name]
        photos = Unsplash::Photo.search(params[:search_name])
        # p "HERE CHECK OUT"
        # p photos[0]
        # url = "https://api.unsplash.com/search/photos?query=#{@search_name}&client_id=z88eko8yjR2DJRxJhpSWZAAS-eNdEP19QBE6mvQGrDI"
        # uri = URI(url)
        # response = Net::HTTP.get(uri)
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
    p "ID VALUE IS: #{params[:id]}"
    FavoriteImage.create(image_id: params[:id], search_name: "hello world")
    @api_response=nil
  end

  def show
  end

  def edit
  end

  def create
  end
end
