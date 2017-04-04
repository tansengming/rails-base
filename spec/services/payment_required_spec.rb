require 'spec_helper'

RSpec.describe PaymentRequired do
  subject { described_class.(user) }

  context 'when paid_until is not set' do
    let(:user) { double(paid_until: nil) }
    it { should eq true }
  end

  context 'when paid_until is in the past' do
    let(:user) { double(paid_until: 10.days.ago) }
    it { should eq true }
  end

  context 'when paid_until is in the past' do
    let(:user) { double(paid_until: 10.days.from_now) }
    it { should eq false }
  end
end