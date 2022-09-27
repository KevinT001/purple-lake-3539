require 'rails_helper'

RSpec.describe"Department Index page" do
  before :each do
    @department_1 = Department.create!(name: "Domestic",floor: "first")
    @department_2 = Department.create!(name: "Foreign",floor: "second")

    @employee_1 = Employee.create!(name: "Kevin", level: 1, department_id: @department_1.id )
    @employee_2 = Employee.create!(name: "Bob", level: 2, department_id: @department_2.id )
    @employee_3 = Employee.create!(name: "Ash", level: 3, department_id: @department_2.id)
    @employee_4 = Employee.create!(name: "Carol", level: 3, department_id: @department_1.id)
    

  end

  it "When I visit index page I see each department's name and floor" do
    visit departments_path
    expect(page).to have_content("Name: #{@department_1.name}")
    expect(page).to have_content("Floor: #{@department_1.floor}")
    expect(page).to have_content("Name: #{@department_2.name}")
    expect(page).to have_content("Floor: #{@department_2.floor}")

  end

  it  " Underneath each department, I can see the names of all of its employees" do

    visit departments_path 

    expect(page).to have_content("#{@employee_1.name}")
    expect(page).to have_content("#{@employee_2.name}")
    expect(page).to have_content("#{@employee_3.name}")
    expect(page).to have_content("#{@employee_4.name}")
  end
end