FactoryBot.define do
  factory :admin_user do
    sequence(:email) { |n| "admin-#{n}@example.com" }
    password { 'foo12345' }
  end

  factory :super_admin do
    sequence(:email) { |n| "super-admin-#{n}@example.com" }
    password { 'foo12345' }
  end

  factory :user do
    sequence(:email) { |n| "user-#{n}@example.com" }
    password { 'foo12345' }
  end
end
