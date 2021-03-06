class NewProjectCreatedMailer < ApplicationMailer
#this class is used to send emails to all users after a project has been created by a manager
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

#  def notify_managers()
#    @managers = Manager.all
#    @managers.each do |manager|
#      mail(to: manager.email, subject: "New Task Created")
#    end
#  end

end
