class Achievement::PublicPerson < ActiveRecord::Base
  def self.check(user)
    Github.public_person?
  end
end
