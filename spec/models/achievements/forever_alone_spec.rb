require 'spec_helper'

describe Achievements::ForeverAlone do
  it "should be included in Achievements list" do
    Achievements::LIST.should include Achievements::ForeverAlone
  end

  describe "check" do
    before :all do
      @user = Fabricate :user
    end

    it "should call github and check there if positive" do
      Github.should_receive(:forever_alone?).and_return false
      Achievements::ForeverAlone.check(@user).should be_false
    end

    it "should call github and check there if negative" do
      Github.should_receive(:forever_alone?).and_return true
      Achievements::ForeverAlone.check(@user).should be_true
    end
  end
end
