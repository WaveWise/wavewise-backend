class NewSpotMailer < ApplicationMailer
  require 'sendgrid-ruby'
  include SendGrid

  default from: 'info@wavewise.club'

  def confirmation_mailer(email, name, spot)
    @name = name
    @spot = spot
    mail(
      to: email,
      subject: "#{name}, thanks for submitting #{spot} as a new surf spot!"
    )
  end
end
