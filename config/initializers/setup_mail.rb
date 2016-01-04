ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "smtp.gmail.com",
  :user_name            => "mailtohay@gmail.com",
  :password             => "mail.to.hay",
  :authentication       => "plain",
  :enable_starttls_auto => true
}
