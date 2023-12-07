# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Event.all.each do |event|
  event.images.purge_later
end
User.all.each do |user|
  user.photo.purge
end

EventMember.destroy_all
CommunityMember.destroy_all
Event.destroy_all
Community.destroy_all
User.destroy_all

require "open-uri"
require 'faker'

user1 = User.create!(email: 'pikachu@pokemon.com', password: '12345678', first_name: 'Betty', last_name: 'White', location: 'China', nationality: 'Mexican', preferred_name: 'Betty-Boo' , gender: 'female');

user2 = User.create!(email: 'hearthrobbob@gmail.com', password: '12345678', first_name: 'Ricky', last_name: 'Bobby', location: 'China', nationality: 'Korean', preferred_name: 'Rick' , gender: 'male');

user3 = User.create!(email: 'michelle@whitehouse.gov', password: '12345678', first_name: 'Michelle', last_name: 'Obama', location: 'China', nationality: 'USA', preferred_name: 'Chelly' , gender: 'female');

user4 = User.create!(email: 'atate@hotmail.com', password: '12345678', first_name: 'Andrew', last_name: 'Tate', location: 'China', nationality: 'British', preferred_name: 'Alpha Tate' , gender: 'male');


community1 = Community.create!(name:'Happy Korean', description: 'Do you want to learn more about Korean culture or Korean language? Come join our Korean language group. We have many events such as celebrating Korean holidays or practicing language in one of our conversation meeting. All levels are welcome.', topic: 'Korean Language', user: user1,
)

CommunityMember.create!(
  user: user1,
  community: community1
)

community2 = Community.create!(name:"The Greek Gods' Rugby Association", description: 'Sigma male rugby team. Huzah!. Roll in the mud and blow off some steam. Be the man you were born to be.', topic: 'Rugby', user: user2,
)

CommunityMember.create!(
  user: user2,
  community: community2
)

community3 = Community.create!(name:"Please Knit in Your Seat", description: 'There are trees that need sweaters and little mice to be made. Sit down, chat, and get sassy as we knit big ole lumpy sweaters together.', topic: 'Rugby', user: user3,
)

CommunityMember.create!(
  user: user3,
  community: community3
)

e1 = Event.create!(title: 'Korean Chuseok', location: 'Korean Consulate', type: "offline" , start_at: Faker::Time.between(from: DateTime.now - 90, to: DateTime.now + 200), end_at: Faker::Time.between(from: DateTime.now - 90, to: DateTime.now + 200,), introduction: "Come and learn about South Korea's version of Thanksgiving.", community: community1, user: user1)

e2 = Event.create!(title: 'Saturday Pick-Up', location: "Baker's Field Next To Suzhou River", type: "offline", start_at: Faker::Time.between(from: DateTime.now - 90, to: DateTime.now + 200), end_at: Faker::Time.between(from: DateTime.now - 90, to: DateTime.now + 200,), introduction: "Come join a less formal pickup game of rugby. You are welcome to bring friends and family, but please give the event leader a heads up.", community: community2, user: user2)

e3 = Event.create!(title: 'Nonviolent Knitting', location: "Weeping Pillows Cafe",  type: "offline",start_at: Faker::Time.between(from: DateTime.now - 90, to: DateTime.now + 200), end_at: Faker::Time.between(from: DateTime.now - 90, to: DateTime.now + 200,), introduction: "Join us to knit goods to raise money for domestic violence escapees.", community: community3,
user: user3)




file1 = URI.open("https://images.unsplash.com/photo-1594373606301-5b66f999f62b?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MzIyfHxrb3JlYW58ZW58MHx8MHx8fDA%3D")
file2 = URI.open()
e1.images.attach(io: file1, filename: "c1e1i1.png", content_type: "image/png")
e1.images.attach(io: file2, filename: "c1e1i2.png", content_type: "image/png")
e1.save

