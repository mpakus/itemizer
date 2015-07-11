FactoryGirl.define do
  factory :item do
    name { Faker::Lorem.sentence(5) }
  end
end
