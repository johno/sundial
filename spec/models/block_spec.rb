require 'spec_helper'

describe Block do

  let(:block) { FactoryGirl.build(:block) }

  it { should respond_to(:started_at)    }
  it { should respond_to(:ended_at)      }
  it { should respond_to(:total_seconds) }
  it { should respond_to(:user)          }
  it { should respond_to(:task)          }
  it { should respond_to(:project)       }

  it "should be invalid without a task" do
    expect(FactoryGirl.build(:block, task: nil).valid?).to be_false
  end

  describe ".total_seconds" do

    let(:started_at) { Time.now - 2.hours - 12.seconds }
    let(:ended_at)   { Time.now }

    before { block.update_attributes(started_at: started_at, ended_at: ended_at) }

    it "should calculate the proper total seconds" do
      expect(block.total_seconds).to eq(ended_at.to_i - started_at.to_i)
    end

    context "with no ended_at specified" do

      before { block.ended_at = nil }

      it "should use Time.now" do
        expect(block.total_seconds).to eq(Time.now.to_i - started_at.to_i)
      end
    end
  end

  describe "counting" do

    context "multiple counting blocks in one task" do

      before { block.update_attribute(:ended_at, nil) }

      it "shouldn't be allowed" do
        expect(FactoryGirl.build(:block, task: block.task, ended_at: nil).valid?).to be_false
      end
    end
  end
end
