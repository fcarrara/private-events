class AddIndexToEventAttendees < ActiveRecord::Migration
  def change
    add_index :event_attendees, :attendee_id
    add_index :event_attendees, :event_id
    add_index :event_attendees, [:attendee_id, :event_id], unique: true
  end
end
