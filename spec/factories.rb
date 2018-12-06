FactoryBot.define do
  factory :admin_user do
    sequence(:email) { |_| "admin-#{Faker::Internet.unique.email}" }
    password { 'foo12345' }
  end

  factory :super_admin do
    sequence(:email) { |_| "super-admin-#{Faker::Internet.unique.email}" }
    password { 'foo12345' }
  end

  factory :user do
    sequence(:email) { |_| "user-#{Faker::Internet.unique.email}" }
    password { 'foo12345' }
  end
end
