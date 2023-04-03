FactoryBot.define do
  factory :user do
    email { "email@mail.com" }
    password_digest { "password123" }
  end
end
