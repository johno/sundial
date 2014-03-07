class Task < ActiveRecord::Base
  before_save :assign_total_seconds

  belongs_to :project, inverse_of: :tasks
  has_many :blocks, inverse_of: :task
  has_one :user, through: :project

  validates_presence_of :project

  default_scope ->{ includes(:blocks) }

  private

    def assign_total_seconds
      self.total_seconds = blocks.select(&:counting?)
                                 .map(&:total_seconds).inject(&:+)
    end
end
