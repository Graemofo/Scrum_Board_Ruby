class TaskObserver < ActiveRecord::Observer

  def after_create(task)
    #Call the mailer when new object is created
    TaskMailer.notify_managers.deliver
  end

end
