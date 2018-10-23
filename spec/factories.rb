FactoryBot.define do
  factory :admin_user do
    sequence(:email) { |n| "admin-#{Faker::Internet.unique.email}" }
    password { 'foo12345' }
  end

  factory :super_admin do
    sequence(:email) { |n| "super-admin-#{Faker::Internet.unique.email}" }
    password { 'foo12345' }
  end

  factory :user do
    sequence(:email) { |n| "user-#{Faker::Internet.unique.email}" }
    password { 'foo12345' }
  end
end
