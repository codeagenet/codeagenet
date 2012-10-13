require 'spec_helper'

describe Achievement::PublicPerson do
  it "should be included in Achievement list" do
    Achievement.list.should include described_class
  end

  describe "check" do
    let(:user) { Fabricate :user}

    it "should call github and check there if positive" do
      Github.should_receive(:public_person?).and_return false
      described_class.check(user).should be_false
    end

    it "should call github and check there if negative" do
      Github.should_receive(:public_person?).and_return true
      described_class.check(user).should be_true
    end
  end
end
