class Achievement::PublicPerson < Achievement
  def self.check(user)
    Github.public_person?
  end
end
