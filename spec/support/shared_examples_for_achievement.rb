shared_examples "achievement" do
  it "should be included in Achievement list" do
    Achievement.list.should include described_class
  end

  it "should extend Achievement" do
    described_class.ancestors.should include Achievement
  end

  it "should respond to required methods" do
    described_class.should respond_to :check
  end

  it "should have title, description and image" do
    described_class.image_path.should_not be_nil
    described_class.title.should_not be_nil
    described_class.description.should_not be_nil
  end
end
