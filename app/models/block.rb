class Block < ActiveRecord::Base
  belongs_to :task
  has_one :project, through: :task
  has_one :user, through: :project

  def total_seconds
  end
end
