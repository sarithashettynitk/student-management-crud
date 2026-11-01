class Student < ApplicationRecord

  validates :name, presence: true

  validates :email,
            presence: true,
            uniqueness: true

  validates :department, presence: true

  validates :marks,
            presence: true,
            numericality: {
              greater_than_or_equal_to: 0,
              less_than_or_equal_to: 100
            }

end