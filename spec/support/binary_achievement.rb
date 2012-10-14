shared_examples "binary achievement" do
  it_should_behave_like "achievement"

  it "should extend Achievement" do
    described_class.ancestors.should include Achievement
    described_class.ancestors.should_not include LeveledAchievement
  end

  let(:user) { Fabricate :user}

  describe "earning achievement" do
    it "should earn achievement" do
      user.achievements.should be_empty
      described_class.should_receive(:check).and_return(true)

      result = described_class.earn_achievement_for(user)

      result.should be_a_kind_of described_class
      user.achievements.reload
      user.achievements.should == [result]
    end
  end
end