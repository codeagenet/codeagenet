require 'spec_helper'

describe User do
  it { Fabricate.build(:user).should be_valid }

  it { should have_many :achievements }
  it { should have_many :authentications }

  let(:user) { Fabricate :user}

  describe "achievement methods" do
    describe "unachieved achievements" do
      it "should return all if none present" do
        user.unearned_achievements.should =~ Achievement.list
      end

      it "should not include achieved" do
        Achievement::ForeverAlone.create!(:user => user)

        unearned = user.unearned_achievements
        unearned.should_not include Achievement::ForeverAlone
        unearned.count.should == (Achievement.list.count - 1)
      end
    end

    describe "checking and saving process" do
      it "should earn achievement if check returned true" do
        Achievement::ForeverAlone.should_receive(:check).with(user).and_return true

        list = Achievement.list
        list.delete(Achievement::ForeverAlone)
        list.each {|ac| ac.should_receive(:check).with(user).and_return(false)}

        user.earn_achievements

        user.unearned_achievements.should =~ list
        user.achievements.count.should == 1
        user.achievements.first.class.should == Achievement::ForeverAlone
      end

      it "should return earned ones" do
        Achievement::ForeverAlone.should_receive(:check).with(user).and_return true

        list = Achievement.list
        list.delete(Achievement::ForeverAlone)
        list.each {|ac| ac.should_receive(:check).with(user).and_return(false)}

        res = user.earn_achievements
        res.count.should == 1
        res.first.class.should == Achievement::ForeverAlone
        res.first.user.should == user
      end

      it "should mark datetime when done" do
        Achievement.list.each {|ac| ac.should_receive(:check).with(user).and_return(false)}

        user.earn_achievements

        user.achievements_fetched_at.to_i.should be_within(5).of(Time.now.to_i)
      end

      it "should send letters" do
        Achievement.list.each {|ac| ac.should_receive(:check).with(user).and_return(false)}

        AchievementMailer.stub_chain :creation, :deliver

        user.earn_achievements
      end
    end
  end
end
