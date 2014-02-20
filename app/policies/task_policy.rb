class TaskPolicy < ApplicationPolicy
  
  attr_reader :project, :task

  def initialize(user, project)
    @user    = user
    @project = project
  end

  def index?
    belongs_to_user?(@project)
  end
end
