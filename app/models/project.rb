class Project < ActiveRecord::Base
  belongs_to :user
  has_many :tasks, inverse_of: :project
  has_many :blocks, through: :tasks

  default_scope -> { includes(:tasks) }

  def counting?
    tasks.select(&:counting?).any?
  end
end
