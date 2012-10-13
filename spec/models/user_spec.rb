require 'spec_helper'

describe User do
  it { Fabricate.build(:user).should be_valid }
end
