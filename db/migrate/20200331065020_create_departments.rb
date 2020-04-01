class CreateDepartments < ActiveRecord::Migration[5.2]
  def change
    create_table :departments do |t|
      t.date :foundation
      t.date :disbandment
      t.string :names
      t.string :current_name

      t.timestamps
    end
  end
end
