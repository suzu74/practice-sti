class Student < ApplicationRecord
  has_many :teachers
  belongs_to :school
end
