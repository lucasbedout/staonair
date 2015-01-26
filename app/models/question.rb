class Question < ActiveRecord::Base

  belongs_to :notation
  has_one :exam, through: :notation

end
