require 'spec_helper'

describe User do
  it { Fabricate.build(:user).should be_valid }

  it { should have_many :achievements }
  it { should have_many :authentications }

  describe "achievement methods" do
    describe "unachieved achievements" do
      let(:user) { Fabricate :user}

      it "should return all if none present" do
        user.unearned_achievements.should =~ Achievement.list
      end

      it "should not include achieved" do
        Achievement::ForeverAlone.create!(:user => user, :got_it => true)

        unearned = user.unearned_achievements
        unearned.should_not include Achievement::ForeverAlone
        unearned.count.should == (Achievement.list.count - 1)
      end
    end
  end
end
