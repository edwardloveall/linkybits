begin
  credentials = YAML.load_file("#{Rails.root}/config/credentials.yml")['smtp_auth']
rescue
  credentials = { 'username' => ENV['smtp_user'], 'password' => ENV['smtp_pass'] }
end

ActionMailer::Base.smtp_settings =  {
  address: "smtp.gmail.com",
  port: 587,
  authentication: "plain",
  user_name: credentials['username'],
  password: credentials['password'],
  enable_starttls_auto: true
}