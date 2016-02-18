Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, ENV['FACEBOOK_ID'], ENV['FACEBOOK_SECRET_KEY']
end
# 815593005235923
# 73caffddb50e318596a66b002d63ac5e
