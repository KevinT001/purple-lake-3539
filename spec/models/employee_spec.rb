require 'rails_helper'

RSpec.describe Employee, type: :model do
  describe 'relationships' do
    it { should belong_to :department }

    it { should have_many :employeetickets}

    it { should have_many(:tickets).through(:employeetickets}

  end
end