require 'spec_helper'

describe Block do

  let(:block) { FactoryGirl.build(:block) }

  it { should respond_to(:started_at)    }
  it { should respond_to(:ended_at)      }
  it { should respond_to(:total_seconds) }
  it { should respond_to(:user)          }
  it { should respond_to(:task)          }
  it { should respond_to(:project)       }
end
