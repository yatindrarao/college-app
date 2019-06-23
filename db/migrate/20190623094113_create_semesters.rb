class CreateSemesters < ActiveRecord::Migration[5.2]
  def change
    create_table :semesters do |t|
      t.string :name
      t.integer :credits
      t.date :start_date
      t.date :end_date
      t.timestamps
    end
  end
end
