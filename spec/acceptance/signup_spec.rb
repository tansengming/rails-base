require 'acceptance/acceptance_helper'

feature 'Signup', %q{
  doing a signup
} do

  scenario 'visit signup page' do
    visit "/auth"
  end
end