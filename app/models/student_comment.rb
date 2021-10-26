class StudentComment < ApplicationRecord
  belongs_to :user
  belongs_to :student_post
end
