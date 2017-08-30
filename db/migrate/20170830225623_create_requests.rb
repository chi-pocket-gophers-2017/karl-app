class CreateRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :requests do |t|
      t.integer :student_id, null: false
      t.integer :mentor_id

      t.timestamps
    end
  end
end
