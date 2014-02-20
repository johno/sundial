require 'spec_helper'

describe User do

  let(:user) { FactoryGirl.build(:user) }

  subject { user }

  it { should respond_to(:email)    }
  it { should respond_to(:projects) }
  it { should respond_to(:tasks)    }
  it { should respond_to(:blocks)   }

  describe 'email validation' do

    it 'should be valid with a valid email' do
      expect(user.valid?).to be_true
    end

    context 'with an invalid email' do

      before { user.email = 'invalid_email' }

      it 'should be invalid' do
        expect(user.valid?).to be_false
      end
    end
  end
end
