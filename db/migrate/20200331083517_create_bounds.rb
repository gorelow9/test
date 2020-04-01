class CreateBounds < ActiveRecord::Migration[5.2]
  def change
    create_table :bounds do |t|
    	t.belongs_to :department
    	t.belongs_to :employee
    	t.date :start_date
    	t.date :end_date
    	
      t.timestamps
    end
  end
end
