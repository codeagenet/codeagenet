class AchievementMailer < ActionMailer::Base
  default from: "noreply@codeage.net"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.achievement_mailer.creation.subject
  #
  def creation(user, achievements)
    @achievements = achievements
    @user = user

    if achievements.count == 1
      subject = "Wow! You got a new bage - #{achievements.first.class.title}!"
    else
      subject = "Wow! You got a new bages!"
    end

    mail to: user.email, subject: subject
  end
end
