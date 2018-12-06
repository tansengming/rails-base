require 'ostruct'
require 'segment'
require File.expand_path('../../app/services/event_tracker', __dir__)

RSpec.describe EventTracker do
  before { ENV['SEGMENT_WRITE_KEY'] = 'segment-write-key' }

  after  { ENV['SEGMENT_WRITE_KEY'] = nil }

  let(:user) { OpenStruct.new(id: 1, email: 'xavier') }

  describe '.track' do
    subject(:calling_track) { described_class.track(user, event) }

    context 'when the event is signup' do
      let(:event)          { :signup }
      let(:segment_client) { instance_double(Segment::Analytics::Client) }

      before do
        allow(Segment::Analytics::Client).to receive(:new) { segment_client }
        allow(segment_client).to receive(:identify) { true }
        allow(segment_client).to receive(:track) { true }
      end

      it 'does not crash' do
        expect { calling_track }.not_to raise_error
      end
    end
  end
end
