class ApplicationController < ActionController::Base
  #tutorial unsplash: https://github.com/unsplash/unsplash_rb/tree/7414642a7068a31cc872f5613bc3baff4a1b9428
  Unsplash.configure do |config|
      config.application_access_key = "z88eko8yjR2DJRxJhpSWZAAS-eNdEP19QBE6mvQGrDI"
      config.application_secret = "dWAWqJm_1kPwl9VOh8O-07c5_w2ortBj0VSsrNBS9O4"
      config.application_redirect_uri = "https://your-application.com/oauth/callback"
      config.utm_source = "alices_terrific_client_app"
    end
    $home=true
end
