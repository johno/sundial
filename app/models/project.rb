class Project < ActiveRecord::Base
  belongs_to :user
  has_many :tasks, inverse_of: :project
  has_many :blocks, through: :tasks
end
