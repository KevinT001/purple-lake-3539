class Ticket < ApplicationRecord
  belongs_to :employee
  has_many :employeetickets
  has_many :employees, through: :employeetickets
end


def self.organized_tickets
  Ticket.where('open').order('age desc')
end