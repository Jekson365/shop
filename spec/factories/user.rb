FactoryBot.define do
  factory :user do
    username { 'John Doe' }
    password { 'password1$' }
    is_admin { false }
  end
end