class AchievementMailer < ActionMailer::Base
  default from: "\"CodeAge mailer\" <noreply@codeage.net>"

  def creation(user, achievements)
    @achievements = achievements
    @user = user

    if achievements.count == 1
      subject = "Wow! You got a new badge - #{achievements.first.class.title}!"
    else
      subject = "Wow! You got a new badges!"
    end

    mail to: user.email, subject: subject
  end
end
