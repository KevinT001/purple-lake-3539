class Employee < ApplicationRecord

  has_many :employeetickets
  has_many :tickets, through: :employeetickets
end