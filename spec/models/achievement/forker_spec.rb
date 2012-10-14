require 'spec_helper'

describe Achievement::Forker do
  it_should_behave_like "leveled achievement"

  it "should have custom description" do
    a = Achievement::Forker.new
    a.counter = 10
    a.description.should == 'User owns at least 5 forks.'

    a = Achievement::Forker.new
    a.counter = 15
    a.description.should == 'User owns at least 15 forks.'
  end

  it "should have description if achievement is empty" do
    a = Achievement::Forker.new
    a.description.should == 'User owns at least 5 forks.'
  end
end