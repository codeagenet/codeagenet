shared_examples "achievement" do
  it "should be included in Achievement list" do
    Achievement.list.should include described_class
  end

  it "should respond to required methods" do
    described_class.should respond_to :check
  end

  it "should have title, description and image" do
    described_class.image_path.should_not be_nil
    described_class.title.should_not be_nil
    described_class.description.should_not be_nil
    described_class.hidden?.should_not be_nil
  end

  it "should have buble parameters" do
    b = described_class.bubble.with_indifferent_access
    b[:orientation].should_not be_nil

    a = []
    variants = ['left', 'bottom', 'top', 'right']

    variants.each do |k|
      a.push k if b.has_key?(k)
    end

    (variants - a).count.should == 2
  end
end

shared_examples "hidden achievement" do
  it "should be hidden" do
    described_class.hidden?.should be_true
  end
end
