
ActionMailer::Base.default_url_options = { :host => 'partychamp.de' }
ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.raise_delivery_errors = true

ActionMailer::Base.smtp_settings = {
    :address              => "partychamp.com",
   # :port                 => 25,
    :domain               => "partychamp.de",
    :user_name            => "n.buescher@partychamp.de",
    :password             => "Champ+pass-1520",
    :authentication       => "plain",
    :enable_starttls_auto => true
}