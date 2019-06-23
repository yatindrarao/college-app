class CreateStudents < ActiveRecord::Migration[5.2]
  def change
    create_table :students do |t|
      t.string :name
      t.integer :age
      t.date :dob
      t.text :description
      t.references :semester
      t.timestamps
    end
  end
end
