class Achievement::ForeverAlone < Achievement
  def self.check(user)
    Github.forever_alone?
  end
end
