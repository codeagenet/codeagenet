require "spec_helper"

describe AchievementMailer do
  describe "creation" do
    before :each do
      @user = Fabricate(:user)
      @achievements = [Achievement::ForeverAlone.create!(:user => @user)]
    end

    let(:mail) { AchievementMailer.creation(@user, @achievements) }

    it "single achievement" do
      mail.subject.should eq("Wow! You got a new bage - Forever Alone!")
      mail.to.should eq([@user.email])
      mail.from.should eq(["noreply@codeage.net"])

      mail.body.should include("Forever Alone")
      mail.body.should include(@user.name)
    end

    it "multiple achievements" do
      @achievements.push Achievement::Stalker.create!(:user => @user)

      mail.subject.should eq("Wow! You got a new bages!")
      mail.to.should eq([@user.email])
      mail.from.should eq(["noreply@codeage.net"])

      mail.body.should include("Forever Alone")
      mail.body.should include("Stalker")
      mail.body.should include(@user.name)
    end
  end
end
