class ApplicationController < ActionController::Base
    Unsplash.configure do |config|
        config.application_access_key = "z88eko8yjR2DJRxJhpSWZAAS-eNdEP19QBE6mvQGrDI"
        config.application_secret = "dWAWqJm_1kPwl9VOh8O-07c5_w2ortBj0VSsrNBS9O4"
        config.application_redirect_uri = "https://your-application.com/oauth/callback"
        config.utm_source = "alices_terrific_client_app"
      end
end
