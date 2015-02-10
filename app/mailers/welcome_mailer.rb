class WelcomeMailer < ActionMailer::Base
  default from: "giflords@gifster.com"

  def welcome_email(user)
    @user = user
    mail(to: @user.email, subject: '☃ Welcome to Gifster! ʕ•ᴥ•ʔ')
  end
end
