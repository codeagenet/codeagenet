require 'spec_helper'

describe Achievement do
  it { should belong_to :user }
  it { should validate_presence_of :user }

  let(:user) { Fabricate :user}

  describe "checks" do
  	it "should not respond to check" do
      expect { Achievement.check(user) }.to raise_error
    end
  end
end
