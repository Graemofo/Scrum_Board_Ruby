class ProjectObserver < ActiveRecord::Observer

  def after_create(project)
    NewProjectCreatedMailer.notify_users.deliver
  end

end
