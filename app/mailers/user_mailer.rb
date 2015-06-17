class UserMailer < ActionMailer::Base
  default :from => "info@partychamp.de"

  def help_us_mail()
   mail(:to => "nico-buescher@versanet.de", :subject => "Testmail")
  end
end


