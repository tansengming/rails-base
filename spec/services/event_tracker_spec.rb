require 'spec_helper'
require File.expand_path("../../../app/services/event_tracker", __FILE__)

describe EventTracker do
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