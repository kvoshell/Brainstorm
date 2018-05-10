# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

10.times do |a|
  User.create!(
    full_name: Faker::Simpsons.character,
    user_name: Faker::HitchhikersGuideToTheGalaxy.character,
    title: Faker::Hipster.word,
    email: Faker::Internet.email
  )
end

puts '*' * 100
puts '10 Users seeded'

100.times do |a|
  question = Question.create!(
    user_id: rand(1..5),
    title: Faker::FamilyGuy.quote,
    body: Faker::Hipster.paragraph,
    department: rand(0..2)
  )

  rand(1..3).times do |b|
    question.answers.create(
      question_id: question.id,
      user_id: question.user_id,
      body: Faker::Hipster.paragraph
    )
  end
end

puts '*' * 100
puts '100 Questions with answers seeded'
