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
    user_name: Faker::Name.name,
    title: Faker::Hipster.word,
    email: Faker::Internet.email,
    password: "hithere",
    aura: rand(1..255)
  )
end

puts '*' * 100
puts '10 Users seeded'

100.times do |a|
  tags = ["Ruby", "C++", "Go", "JavaScript", "Angular", "Rails", "DevOps",
          "Java", "Node.js", "React", "Vue", "Meteor", "Front-End", "Back-End",
          "Full-Stack", "CSS 3", "SASS", "jQuery", "Web App Development",
          "Photoshop", "Design"]
  user = User.find(rand(1..10))
  question = Question.create!(
    user_id: user.id,
    title: Faker::FamilyGuy.quote,
    body: Faker::Hipster.paragraph,
    department: rand(0..4)
  )

  rand(0..10).times do |b|
    question.answers.create(
      question_id: question.id,
      user_id: question.user_id,
      body: Faker::Hipster.paragraph
    )
  end

  rand(1..5).times do |c|
    question.tags.create!(
      question_id: question.id,
      name: tags[rand(0..20)]
    )
  end
end

puts '*' * 100
puts '100 Questions with answers and tags seeded'
