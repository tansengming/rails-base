require 'segment'
require File.expand_path('../../app/services/event_tracker', __dir__)

describe EventTracker do
  before { ENV['SEGMENT_WRITE_KEY'] = 'segment-write-key' }
  after  { ENV['SEGMENT_WRITE_KEY'] = nil }

  let(:user) { double(id: 1, email: 'xavier') }

  describe '.track' do
    subject { described_class.track(user, event) }

    context 'signup' do
      let(:event) { :signup }
      before do
        expect_any_instance_of(Segment::Analytics::Client).to receive(:identify) { true }
        expect_any_instance_of(Segment::Analytics::Client).to receive(:track) { true }
      end

      it 'should not crash' do
        expect { subject }.not_to raise_error
      end
    end
  end
end
