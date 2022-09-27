require 'rails_helper'

RSpec.describe"Employee show page" do
  before :each do
    @department_1 = Department.create!(name: "Domestic",floor: "first")
    @department_2 = Department.create!(name: "Foreign",floor: "second")

    @employee_1 = Employee.create!(name: "Kevin", level: 1, department_id: @department_1.id )
    @employee_2 = Employee.create!(name: "Bob", level: 2, department_id: @department_2.id )
    @employee_3 = Employee.create!(name: "Ash", level: 3, department_id: @department_2.id)
    @employee_4 = Employee.create!(name: "Carol", level: 3, department_id: @department_1.id) 
    
    @ticket_1 = Ticket.create!(subject: "Finance", age: 5, open: true )
    @ticket_2 = Ticket.create!(subject: "Personal", age: 6, open: true )
    @ticket_3 = Ticket.create!(subject: "Health", age:7, open: true )
    @ticket_4 = Ticket.create!(subject: "Staff", age: 9, open: false )
    @ticket_5 = Ticket.create!(subject: "Staff", age: 8, open: true)
    @employeeticket_1 = Employeeticket.create!(employee_id: @employee_1.id, ticket_id: @ticket_1)
    @employeeticket_2 = Employeeticket.create!(employee_id: @employee_2.id, ticket_id: @ticket_2)
    @employeeticket_3 = Employeeticket.create!(employee_id: @employee_1.id, ticket_id: @ticket_3)
    @employeeticket_4 = Employeeticket.create!(employee_id: @employee_1.id, ticket_id: @ticket_5)
    

  end

  describe 'US_2' do 

    it " On employee show page I see the employees name and department name," do

        visit employee_path(@employee_1.id)
      save
        expect(page).to have_content("Employee name: #{@employee_1.name}")
        expect(page).to have_content("Employee Dept: #{@department_1.name}")
        expect(page).to_not have_content("Employee name: #{@employee_2.name}")
        expect(page).to_not have_content("Employee Dept: #{@department_2.name}")
      end
      
      it "I see a list of the employee's tickets including the ticket subject and age," do
        
        visit employee_path(@employee_1.id)
        
        expect(page).to have_content("#{@ticket_1.subject}")
        expect(page).to have_content("#{@ticket_1.age}")
        expect(page).to_not have_content("#{@ticket_2.subject}")
    end

    it " I see that this list is ordered from oldest to youngest," do

      visit employee_path(@employee_1.id)

      expect("#{@ticket_5}").to appear_before("#{@ticket_3}")
      expect("#{@ticket_3}").to appear_before("#{@ticket_1}")
      expect("#{@ticket_1}").to_not appear_before("#{@ticket_5}")
      
    end

    it "I see that this list only includes open tickets" do

      visit employee_path(@employee_1.id)

    end
  end
end 