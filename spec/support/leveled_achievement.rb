shared_examples "leveled achievement" do
  it_should_behave_like "achievement"
  it_should_behave_like "leveled achievement statuses"

  it "should extend Achievement" do
    described_class.ancestors.should include Achievement
    described_class.ancestors.should include LeveledAchievement
  end

  it "should have levels" do
    described_class.levels.should be_a_kind_of Array
    described_class.levels.count.should == 4
  end

  describe "workflow" do
    it "should not earn achievement once more" do
      user = Fabricate :user

      described_class.should_receive(:check).twice.with(user).and_return(described_class.levels[0])

      #it should return new achievement object
      described_class.earn_achievement_for(user)

      described_class.earn_achievement_for(user)

      user.achievements.count.should == 1
    end

    it "should assign achievement when requested" do
      user = Fabricate :user

      described_class.should_receive(:check).with(user).and_return(described_class.levels[0])

      #it should return new achievement object
      described_class.earn_achievement_for(user).should be_a_kind_of(described_class)

      ach = user.achievements.first
      ach.class.should == described_class
      ach.level.should == :wood
    end
  end
end