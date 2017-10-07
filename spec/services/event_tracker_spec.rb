require 'segment'
require File.expand_path("../../../app/services/event_tracker", __FILE__)

describe EventTracker do
  before { ENV['SEGMENT_WRITE_KEY'] = 'segment-write-key' }
  after  { ENV['SEGMENT_WRITE_KEY'] = nil }

  let(:user) { double(id: 1, email: 'xavier') }

  describe '.track' do
    subject { described_class.track(user, event) }

    context 'signup' do
      let(:event) { :signup }

      it 'should not crash' do
        expect { subject }.not_to raise_error
      end
    end
  end
end