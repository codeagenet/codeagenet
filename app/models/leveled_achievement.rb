class LeveledAchievement < Achievement
  def level
    self.class.get_level_from_number(self.counter.to_i)
  end

  def got_it?
    true if level
  end

  class << self
    def levels
      self::Levels
    end

    def get_level_from_number(number)
      return false unless number.is_a? Fixnum

      if number >= levels[3]
        :gold 
      elsif number >= levels[2]
        :silver 
      elsif number >= levels[1]
        :bronze
      elsif number >= levels[0]
        :wood
      else
        false
      end      
    end

    def earn_achievement_for(user)
      record = self.find_or_initialize_by_user_id(user.id)
      number = self.check(user)

      return false unless get_level_from_number(number)
      return false if record.level == get_level_from_number(number)

      record.counter = number
      record.save!
      record      
    end
  end
end