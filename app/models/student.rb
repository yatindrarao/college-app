class Student < ApplicationRecord
  belongs_to :semester

  validates :name, :dob, :age, :description, :semester_id, presence: true
end
