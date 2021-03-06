# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(
		name: "Eric Gunawan",
		email: "erricgunawan@gmail.com",
		password: "password",
		password_confirmation: "password",
		admin: true
	)
100.times do |n|
	User.create(
		name: "User #{n}",
		email: "user_#{n}@email.me",
		password: "password",
		password_confirmation: "password"
	)
end

users = User.first(6)

users.each do |user|
  50.times do |n|
    user.journals.create!(
      title: "#{ Faker::Address.city } Trip",
      content: Faker::Lorem.paragraph(5)
    )
  end
end
