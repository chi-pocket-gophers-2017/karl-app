class Request < ActiveRecord::Base
  belongs_to :student, class_name: :User
  belongs_to :mentor, class_name: :User, required: false

  validates :student_id, presence: true
end
