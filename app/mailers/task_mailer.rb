class TaskMailer < ApplicationMailer

   def notify_managers()
     @managers = Manager.all
     @managers.each do |manager|
       mail(to: manager.email, subject: "New Task Created")
     end
   end


end
