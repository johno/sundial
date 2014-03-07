require 'spec_helper'

describe Task do
  
  let(:task) { FactoryGirl.create(:task) }

  subject { task }

  it { should respond_to(:project) }
  it { should respond_to(:user)    }
  it { should respond_to(:blocks)  }

  it "should be invalid without a project" do
    expect(FactoryGirl.build(:task, project: nil).valid?).to be_false
  end
end
