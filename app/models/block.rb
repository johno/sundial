class Block < ActiveRecord::Base
  belongs_to :task, inverse_of: :blocks
  has_one :project, through: :task
  has_one :user, through: :project

  validates_presence_of :started_at, :task

  def total_seconds
    (ended_at || Time.now).to_i - started_at.to_i
  end
end
