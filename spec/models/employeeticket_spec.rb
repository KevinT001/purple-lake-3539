require 'rails_helper'

RSpec.describe Employeeticket do 


  it { should belong_to :ticket }
  it { should belong_to :employee }
  
end