# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Message.delete_all
User.delete_all
Receiver.delete_all
Friendship.delete_all

user1 = User.create!(name: "Phong", email:'phong@gmail.com', password: '123')
user2 = User.create!(name: "Khoa", email:'khoa@gmail.com', password: '123')
user3 = User.create!(name: "hihi", email:'hihi@gmail.com', password: '123')

Friendship.create!(user_id: user1.id, friend_id: user2.id, friend_name:user2.name, friend_email: user2.email)
Friendship.create!(user_id: user2.id, friend_id: user1.id, friend_name:user1.name, friend_email: user1.email)

mess1= Message.create!(title: Faker::Lorem.sentence, body: Faker::Lorem.paragraph(10), user_id: user2.id, seen: false)
mess2= Message.create!(title: Faker::Lorem.sentence, body: Faker::Lorem.paragraph(10), user_id: user2.id, seen: false)
mess3= Message.create!(title: Faker::Lorem.sentence, body: Faker::Lorem.paragraph(10), user_id: user2.id, seen: false)
mess4= Message.create!(title: Faker::Lorem.sentence, body: Faker::Lorem.paragraph(10), user_id: user2.id, seen: false)
mess5= Message.create!(title: Faker::Lorem.sentence, body: Faker::Lorem.paragraph(10), user_id: user2.id, seen: false)
mess6= Message.create!(title: Faker::Lorem.sentence, body: Faker::Lorem.paragraph(10), user_id: user2.id, seen: false)
mess7= Message.create!(title: Faker::Lorem.sentence, body: Faker::Lorem.paragraph(10), user_id: user2.id, seen: false)
mess8= Message.create!(title: Faker::Lorem.sentence, body: Faker::Lorem.paragraph(10), user_id: user2.id, seen: false)
mess9= Message.create!(title: Faker::Lorem.sentence, body: Faker::Lorem.paragraph(10), user_id: user2.id, seen: false)
mess10= Message.create!(title: Faker::Lorem.sentence, body: Faker::Lorem.paragraph(10), user_id: user2.id, seen: false)


Receiver.create!(message_id: mess1.id, user_id: user1.id)
Receiver.create!(message_id: mess2.id, user_id: user1.id)
Receiver.create!(message_id: mess3.id, user_id: user1.id)
Receiver.create!(message_id: mess4.id, user_id: user1.id)
Receiver.create!(message_id: mess5.id, user_id: user1.id)
Receiver.create!(message_id: mess6.id, user_id: user1.id)
Receiver.create!(message_id: mess7.id, user_id: user1.id)
Receiver.create!(message_id: mess8.id, user_id: user1.id)
Receiver.create!(message_id: mess9.id, user_id: user1.id)
Receiver.create!(message_id: mess10.id, user_id: user1.id)
