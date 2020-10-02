class FavoriteImagesController < ApplicationController
  def index
    @search_name = params[:search_name]
    unless @search_name.nil?
        puts "WHAT A WONDERFUL WORLD"
        url = "https://api.unsplash.com/search/photos?query=#{@search_name}&client_id=z88eko8yjR2DJRxJhpSWZAAS-eNdEP19QBE6mvQGrDI"
        uri = URI(url)
        response = Net::HTTP.get(uri)
        @api_response = JSON.parse(response)["results"].map{|image| image["urls"]["small"]}
    end
  end

  def show
  end

  def edit
  end

  def create
  end
end
