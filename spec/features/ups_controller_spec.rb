require 'rails_helper'

describe UpsController do
  describe '/up' do
    context 'json' do
      subject { visit '/up.json' }

      it 'should return ok' do
        subject
        expect(page.body).to eq '{"status":"ok"}'
      end
    end

    context 'html' do
      subject { visit '/up' }

      it 'should raise an error' do
        expect { subject }.to raise_error ActionController::UnknownFormat
      end
    end
  end
end
