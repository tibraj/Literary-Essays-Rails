Rails.application.config.middleware.user OmniAuth::Builder do 
    provider :github, ENV["GITHUB_CLIENT_ID"],ENV["GITHUB_CLIENT_SECRET"], skip_jwt: true
end