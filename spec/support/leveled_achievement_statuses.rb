shared_examples "leveled achievement statuses" do
  describe "achievement statuses" do
    let(:user) { Fabricate :user }

    it "returns false if no achievement" do
      described_class.get_level_from_number(described_class.levels[0] - 1).should be_false
    end

    it "wood" do
      described_class.get_level_from_number(described_class.levels[0]).should == :wood
    end

    it "bronze" do
      described_class.get_level_from_number(described_class.levels[1]).should == :bronze
    end

    it "silver" do
      described_class.get_level_from_number(described_class.levels[2]).should == :silver
    end

    it "gold" do
      described_class.get_level_from_number(described_class.levels[3]).should == :gold
      described_class.get_level_from_number(described_class.levels[3] + 10).should == :gold
    end
  end
end