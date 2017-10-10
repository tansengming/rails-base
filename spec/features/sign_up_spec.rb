require 'rails_helper'
require Rails.root.join('spec/support/feature_spec_helpers')

describe 'Siging Up' do
  include FeatureSpecHelpers

  it 'should create a new user and redirect to the plans page' do
    expect { fill_and_submit_sign_up_form }.to change { User.count }.by(1)
    expect(page.current_path).to eq '/plans'
  end
end
