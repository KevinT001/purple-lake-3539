require 'rails_helper'

RSpec.describe Ticket, type: :model do
  describe 'relationships' do
   

    it { should have_many(:employeetickets)}

    it { should have_many(:employees).through(:employeetickets)}

  end

  it 'I see that this list is ordered from oldest to youngest' do 
    @ticket_1 = Ticket.create!(subject: "Finance", age: 5, open: true )
    @ticket_2 = Ticket.create!(subject: "Personal", age: 6, open: true )
    @ticket_3 = Ticket.create!(subject: "Health", age:7, open: true )
    @ticket_4 = Ticket.create!(subject: "Staff", age: 9, open: false )
    @ticket_5 = Ticket.create!(subject: "Staff", age: 8, open: true)

    expect(Ticket.organized_tickets).to eq([@ticket_5, @ticket3, @ticket2, @ticket1])
  end


end