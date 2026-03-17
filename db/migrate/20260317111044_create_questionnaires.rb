class CreateQuestionnaires < ActiveRecord::Migration[8.1]
  def change
    create_table :questionnaires do |t|
      t.text :ai_summary
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
