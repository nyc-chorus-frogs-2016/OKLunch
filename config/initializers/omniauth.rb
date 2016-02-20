#idk what this is, i'm just copy pasting
OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  ## DO NOT PUSH WITH THESE VALUES IN!!!!!
  provider :facebook, ENV['815593005235923'], ENV['73caffddb50e318596a66b002d63ac5e'],
           scope: 'public_profile', display: 'page', image_size: 'normal'
end
