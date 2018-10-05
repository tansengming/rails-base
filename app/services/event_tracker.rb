class EventTracker
  attr_reader :user, :event

  def self.track(user, event)
    new(user, event).track
  end

  def initialize(user, event)
    @user  = user
    @event = event
  end

  def track
    identify
    segment.track(user_id: user.id, event: event)
  end

  def identify
    segment.identify(
      user_id: user.id,
      traits: {
        email: user.email
      }
    )
  end

  private

  def segment
    @segment ||= Segment::Analytics.new(write_key: ENV['SEGMENT_WRITE_KEY'])
  end
end
