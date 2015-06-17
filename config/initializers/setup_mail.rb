ActionMailer::Base.raise_delivery_errors = true
ActionMailer::Base.smtp_settings = {
    :address              => "smtp.gmail.com",
    :port                 => 587,
    :domain               => "www.partychamp.de",
    :user_name            => "bueschernico@gmail.com",
    :password             => "mnGPasswort?",
    :authentication       => "plain",
    :enable_starttls_auto => true
}
ActionMailer::Base.default_url_options[:host] = "www.partychamp.de"