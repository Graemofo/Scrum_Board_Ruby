class Task < ActiveRecord::Base
  CHOICES = ['To Do', 'In Progress', 'Testing', 'Complete']

  belongs_to :user
#  belongs_to :project
  validates :title, :description, :projectname, :presence => true 


end
