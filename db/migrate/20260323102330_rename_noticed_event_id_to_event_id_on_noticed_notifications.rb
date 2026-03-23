class RenameNoticedEventIdToEventIdOnNoticedNotifications < ActiveRecord::Migration[8.1]
  def change
    remove_foreign_key :noticed_notifications, column: :noticed_event_id
    rename_column :noticed_notifications, :noticed_event_id, :event_id
    add_foreign_key :noticed_notifications, :noticed_events, column: :event_id
  end
end
