class StudentMailer < ActionMailer::Base
  default from: "Lucas BEDOUT"

  def exam_validation_email(notation)
    email = notation.student.to_s() + '@supinfo.com'
    @notation = notation
    mail(to: email, subject: 'Note du ' + @notation.exam.exam_type + ' de ' + @notation.exam.course)
  end

end
