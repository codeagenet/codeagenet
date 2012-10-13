Rails.application.middleware.use OmniAuth::Builder do
  provider :github, Rails.application.config.github_app_id, Rails.application.config.github_app_secret
end