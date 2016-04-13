class UserMailer < ActionMailer::Base
  default from: 'reservations@razbnb.com'
 
  def reservation_email(user)
    @user = user
    mail(to: @user.email, subject: 'You have a RazBnB reservation!')
  end
end