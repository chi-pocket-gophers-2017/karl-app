class User < ActiveRecord::Base
  has_many :requests, foreign_key: :student_id
  has_many :responses, class_name: :Request, foreign_key: :mentor_id

  validates :first_name, :last_name, :email, presence: true
  has_secure_password

end
