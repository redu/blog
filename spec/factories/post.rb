FactoryGirl.define do
  factory :post do
    title 'About Us'
    body 'We are the champions, my friend.'
    association :user
  end
end
