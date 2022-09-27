class UserMailer < ApplicationMailer
  default from: 'no-reply@jungle.com'

  self.delivery_method = :test

  def welcome_email(user)
    @user = user
    @url  = 'http://localhost:3000/login'
    mail(to: @user.email, subject: 'Welcome to the Jungle')
  end
end
