class CreateNotifications < ActiveRecord::Migration[8.1]
  def change
    create_table :notifications do |t|
      t.text :content
      t.timestamp :date_time
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
