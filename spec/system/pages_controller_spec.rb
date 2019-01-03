require 'rails_helper'

RSpec.describe PagesController do
  describe '/pages/terms' do
    subject(:get_terms_page) { visit 'pages/terms' }

    it 'should show the page' do
      get_terms_page
      expect(page.body).to have_content 'Terms'
    end
  end

  describe '/pages/does-not-exist' do
    subject(:get_missing_page) { visit 'pages/does-not-exist' }

    it 'should not show the page' do
      expect { get_missing_page }.to raise_error ActiveRecord::RecordNotFound
    end
  end
end
