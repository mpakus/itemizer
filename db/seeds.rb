10.times do
  Item.create(name: Faker::Lorem.sentence(5))
end
