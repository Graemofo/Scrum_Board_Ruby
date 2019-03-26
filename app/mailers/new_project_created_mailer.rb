class NewProjectCreatedMailer < ApplicationMailer

  def notify_user(user)
    @user = user
    mail(to: @user, subject: "New Project Created")
  end

  def notify_users()
    @users = User.all
    @users.each do |user|
      mail(to: user.email, subject: "New Project Created")
    end
  end

end
