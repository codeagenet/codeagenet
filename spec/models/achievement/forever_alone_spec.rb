require 'spec_helper'

describe Achievement::ForeverAlone do
  it_should_behave_like "achievement"
  let(:user) { Fabricate :user}

  describe "check" do
    it "should call github and check there if positive" do
      Github.should_receive(:forever_alone?).and_return false
      described_class.check(user).should be_false
    end

    it "should call github and check there if negative" do
      Github.should_receive(:forever_alone?).and_return true
      described_class.check(user).should be_true
    end
  end
end
