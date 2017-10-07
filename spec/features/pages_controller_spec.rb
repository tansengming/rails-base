require 'rails_helper'

RSpec.describe PagesController do
  describe '/pages/terms' do
   subject { visit 'pages/terms' }

   it do
    subject
    expect(page.body).to have_content 'Terms'
   end
  end
end
