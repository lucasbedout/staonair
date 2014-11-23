class Notation < ActiveRecord::Base

  belongs_to :exam
  belongs_to :user
  has_many :questions

  default_scope {
    order('created_at DESC')
  }

end
