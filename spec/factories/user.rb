FactoryGirl.define do
  factory :user do
    username 'Matheus Santana'
    email 'matheus@redu.com.br'
    password '123456'
    description 'Este texto possui 51 caracteres. Mais pura verdade.'
    profile_link 'http://www.redu.com.br/pessoas/edmatheus'
  end
end
