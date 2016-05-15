class User < ActiveRecord::Base

  has_many :created_events, :foreign_key => "creator_id", :class_name => "Event"
  has_many :event_attendees, :foreign_key => "attendee_id"
  has_many :attended_events, :through => :event_attendees, :source => "event"
  
  validates :name, uniqueness: true, presence: true
  
  def upcoming_events
    self.attended_events.reject { |event| event.date.past? }
  end

  def previous_events
    self.attended_events.reject { |event| event.date.future? }
  end

  def attend_event(event)
    event_attendees.create(event_id: event.id)
  end

  def unattend_event(event)
    event_attendees.find_by(event_id: event.id).destroy
  end

  def attending?(event)
    attended_events.include?(event)
  end
end
