require 'rails_helper'

RSpec.describe PagesController do
  describe '/pages/terms' do
    subject { visit 'pages/terms' }

    it 'should show the page' do
      subject
      expect(page.body).to have_content 'Terms'
    end
  end

  describe '/pages/does-not-exist' do
    subject { visit 'pages/does-not-exist' }

    it 'should not show the page' do
      expect { subject }.to raise_error ActiveRecord::RecordNotFound
    end
  end
end
