require 'rails_helper'

RSpec.describe Employee, type: :model do
  describe 'relationships' do
    

    it { should have_many :employeetickets}

    it { should have_many(:tickets).through(:employeetickets)}

  end
end