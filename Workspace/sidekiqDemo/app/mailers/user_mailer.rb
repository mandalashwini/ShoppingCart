class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.send_mail.subject
  #
  def send_mail
    @greeting = "Hi"

    mail to: "ashumandal96@gmail.com", subject: "welcome mail"
  end
end
