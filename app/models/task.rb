class Task < ActiveRecord::Base
  CHOICES = ['To Do', 'In Progress', 'Testing', 'Complete']
  PROJECTS = ['Project: One', 'Project: Two', 'Project: Three']
  belongs_to :user
#  belongs_to :project
end
