class AddColumnsToUsers < ActiveRecord::Migration[8.1]
  def change
    add_column :users, :name, :string
    add_column :users, :date_of_birth, :date
    add_column :users, :status, :string
    add_column :users, :program_duration, :integer
    add_column :users, :departure_date, :date
    add_column :users, :batch_number, :integer
  end
end
