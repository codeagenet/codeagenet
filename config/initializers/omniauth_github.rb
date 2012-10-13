Rails.application.middleware.use OmniAuth::Builder do
  configure do |config|
    config.path_prefix = '/settings/auth'
  end

  provider :github, Rails.application.config.github_app_id, Rails.application.config.github_app_secret
end