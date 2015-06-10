class UserMailer < ActionMailer::Base

  def help_us_mail()
    mail(:to => "info@partychamp.de",from: "test@test.de", :subject => "Betreff")
  end
end
