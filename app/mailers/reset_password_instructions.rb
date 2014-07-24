class UserMailer < Devise::Mailer
  default from: "from@example.com"

  def signup_approval_email(user)
    @user = user
    @course = course
    @approver = approver
    mail(to: @user.email, subject: "#{@course.course_name} signup has been approved")
  end

end
