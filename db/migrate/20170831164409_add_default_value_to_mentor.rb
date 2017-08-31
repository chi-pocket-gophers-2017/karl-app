class AddDefaultValueToMentor < ActiveRecord::Migration[5.1]
  def change
    change_column :users, :mentor, :boolean, default: false
  end
end
