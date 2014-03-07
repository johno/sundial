class Block < ActiveRecord::Base
  belongs_to :task, inverse_of: :blocks
  has_one :project, through: :task
  has_one :user, through: :project

  validates_presence_of :started_at, :task
  validate :only_one_counting_block_per_task, if: :new_record?

  def counting?
    ended_at.nil?
  end

  def total_seconds
    (ended_at || Time.now).to_i - started_at.to_i
  end

  private

    def only_one_counting_block_per_task
      if task && Block.where(task_id: task.id, ended_at: nil).exists?
        errors.add(:base, "There's already a block counting for this task.")
      end
    end
end
