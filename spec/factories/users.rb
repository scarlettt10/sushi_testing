FactoryGirl.define do
  
  sequence :email do |number|
    "test_#{number}@test.com"
  end

  factory :user do
    first_name "Test"
    last_name "Tester"
    email 
    password "password"
  end
end