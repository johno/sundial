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

  it "should be counting if there's a block counting" do
    expect(FactoryGirl.create(:block, ended_at: nil).task.reload.counting?).to be_true
  end

  it "shouldn't be counting if there isn't a block counting" do
    expect(FactoryGirl.create(:block).task.reload.counting?).to be_false
  end
end
