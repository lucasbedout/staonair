class Exam < ActiveRecord::Base

  has_many :notations
  belongs_to :user

  default_scope {
    order('created_at DESC')
  }

end
