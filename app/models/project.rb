class Project < ActiveRecord::Base
  belongs_to :manager
#  has_many :tasks

  validates :title, :description, :presence => true
  validates :title, :uniqueness => true




end
