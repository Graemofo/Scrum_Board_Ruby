class ProjectObserver < ActiveRecord::Observer
#after the creation of a project, run this code
  def after_create(project)
    #Call the mailer when new object is created
    NewProjectCreatedMailer.notify_users.deliver
  end

end
