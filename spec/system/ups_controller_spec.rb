require 'rails_helper'

RSpec.describe UpsController do
  describe '/up' do
    context 'when using json' do
      subject(:get_json) { visit '/up.json' }

      it 'should return ok' do
        get_json
        expect(page.body).to eq '{"status":"ok"}'
      end
    end

    context 'when using html' do
      subject(:get_html) { visit '/up' }

      it 'should raise an error' do
        expect { get_html }.to raise_error ActionController::UnknownFormat
      end
    end
  end
end
