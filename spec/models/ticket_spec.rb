require 'rails_helper'

RSpec.describe Ticket, type: :model do
  describe 'relationships' do
   

    it { should have_many(:employeetickets)}

    it { should have_many(:employees).through(:employeetickets)}

  end
end