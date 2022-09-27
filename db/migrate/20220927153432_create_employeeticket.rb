class CreateEmployeeticket < ActiveRecord::Migration[5.2]
  def change
    create_table :employeetickets do |t|
      t.references :employee, foreign_key: true
      t.references :ticket, foreign_key: true
    end
  end
end
