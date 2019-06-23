class Semester < ApplicationRecord
  has_many :students, dependent: :destroy

  validates :name, :credits, :start_date, :end_date, presence: true
end
