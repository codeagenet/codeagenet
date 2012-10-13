require 'spec_helper'

describe Achievement do
  it { should belong_to :user }
  it { should validate_presence_of :user }

  describe "checks" do
    before :all do
      @user = Fabricate :user
    end

  	it "should raise error if achievement is called, not ancestor" do
      expect { Achievement.check(@user) }.to raise_error
    end
  end
end
