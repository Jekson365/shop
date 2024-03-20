FactoryBot.define do
  factory :user do
    username { 'John Doe' }
    password { 'password1$' }
    status_id { 1 }
    deleted { false }
    is_admin { false }
  end
end