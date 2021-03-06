FactoryGirl.define do
  factory :user do
    email { Faker::Internet.email }
    first_name "Benj"
    last_name "Comey"
    password "12345678"
    password_confirmation "12345678"
  end

  factory :contractor, class: User do
    email { Faker::Internet.email }
    first_name "Benj"
    last_name "Comey"
    password "12345678"
    password_confirmation "12345678"
    address "56, Sushi plaza"
    city "Temple Bay"
    state "Florida"
    zip_code "321345"
    country "USA"
    contractor_experience "my experience"
    contractor_description "my description"
    role :contractor
    insurance "my insurance"
  end

  factory :requester, class: User do
    email { Faker::Internet.email }
    first_name "Benj"
    last_name "Comey"
    password "12345678"
    password_confirmation "12345678"
    role :requester
  end
end
