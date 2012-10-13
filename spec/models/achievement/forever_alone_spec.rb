require 'spec_helper'

describe Achievement::ForeverAlone do
  it "should be included in Achievement list" do
    Achievement::LIST.should include Achievement::ForeverAlone
  end

  describe "check" do
    before :all do
      @user = Fabricate :user
    end

    it "should call github and check there if positive" do
      Github.should_receive(:forever_alone?).and_return false
      Achievement::ForeverAlone.check(@user).should be_false
    end

    it "should call github and check there if negative" do
      Github.should_receive(:forever_alone?).and_return true
      Achievement::ForeverAlone.check(@user).should be_true
    end
  end
end
