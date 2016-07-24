Rails.application.config.middleware.use OmniAuth::Builder do
  provider :github, 
   Rails.application.secrets.GITHUB_KEY,
   Rails.application.secrets.GITHUB_SECRET, scope: "user:email,user:follow"
  provider :facebook,
   Rails.application.secrets.FB_APP_ID,
   Rails.application.secrets.FB_SECRET
end
