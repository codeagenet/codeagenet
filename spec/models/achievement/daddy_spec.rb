require 'spec_helper'

describe Achievement::Daddy do
  it_should_behave_like "leveled achievement"

  it "should have custom description" do
    a = Achievement::Daddy.new
    a.counter = 20
    a.description.should == 'Owns at least 20 repos.'

    a = Achievement::Daddy.new
    a.counter = 50
    a.description.should == 'Owns at least 50 repos.'
  end

  it "should have description if achievement is empty" do
    a = Achievement::Daddy.new
    a.description.should == 'Owns at least 20 repos.'
  end

  it "should work for class too" do
    Achievement::Daddy.description.should == 'Owns at least 20 repos.'
  end
end