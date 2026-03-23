class AddRecordToNoticedEvents < ActiveRecord::Migration[8.1]
  def change
    add_reference :noticed_events, :record, polymorphic: true, null: true
  end
end
