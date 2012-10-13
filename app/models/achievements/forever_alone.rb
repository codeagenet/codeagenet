class Achievements::ForeverAlone < Achievement
  def self.check(user)
    Github.forever_alone?
  end
end
