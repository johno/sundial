require 'spec_helper'

describe Project do
  
  let(:project) { FactoryGirl.build(:project) }

  subject { project }

  it { should respond_to(:tasks)       }
  it { should respond_to(:blocks)      }
  it { should respond_to(:name)        }
  it { should respond_to(:user)        }
  it { should respond_to(:color)       }
  it { should respond_to(:description) }

end
