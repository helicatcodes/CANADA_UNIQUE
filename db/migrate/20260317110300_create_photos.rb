class CreatePhotos < ActiveRecord::Migration[8.1]
  def change
    create_table :photos do |t|
      t.string :photo
      t.string :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
