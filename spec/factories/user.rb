FactoryGirl.define do
  factory :user do |u|
    u.sequence(:email) { |n| "developer#{n}@redu.com.br" }
    u.username 'User Name'
    u.password 'secretpass'
    u.description 'Este texto possui 51 caracteres. Mais pura verdade.'
    u.sequence(:profile_link) { |n| "http://www.redu.com.br/pessoas/user#{n}" }
  end
end
