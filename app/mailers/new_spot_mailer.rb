class NewSpotMailer < ApplicationMailer
  require 'sendgrid-ruby'
  include SendGrid

  default from: 'info@wavewise.club'

  def new_spot_mailer(email)
    mail(
      to: email,
      subject: 'Thanks for submitting a surf spot!'
    )
  end
end
