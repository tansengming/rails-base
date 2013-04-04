FactoryGirl.define do
  factory :admin_user do
    sequence(:email) { |n| "admin-#{n}@example.com" }
    password "foo1234"
  end

  factory :super_admin do
    sequence(:email) { |n| "super-admin-#{n}@example.com" }
    password "foo1234"
  end
end