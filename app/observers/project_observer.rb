class ProjectObserver < ActiveRecord::Observer

  def after_create(project)
    #Call the mailer when new object is created
    NewProjectCreatedMailer.notify_users.deliver
  end

end
