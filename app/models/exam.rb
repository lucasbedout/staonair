class Exam < ActiveRecord::Base

  has_many :notations
  has_many :questions, through: :notations
  belongs_to :user

  default_scope {
    order('created_at DESC')
  }

end
