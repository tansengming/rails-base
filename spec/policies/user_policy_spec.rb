require 'rails_helper'
require 'pundit/rspec'

RSpec.describe UserPolicy do
  subject { described_class }

  permissions :edit? do
    context 'when user has not paid' do
      it 'denies access' do
        expect(subject).not_to permit User.new
      end
    end

    context 'when user has paid' do
      it 'grants access' do
        expect(subject).to permit User.new(active_until: 10.days.from_now)
      end

      context 'but payment has expired' do
        it 'denise access' do
          expect(subject).not_to permit User.new(active_until: 10.days.ago)
        end
      end
    end
  end
end
