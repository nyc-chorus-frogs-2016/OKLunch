#idk what this is, i'm just copy pasting
OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_APP_ID'], ENV['FACEBOOK_SECRET'],
           scope: 'public_profile', display: 'page', image_size: 'normal'
end
# 815593005235923
# 73caffddb50e318596a66b002d63ac5e
