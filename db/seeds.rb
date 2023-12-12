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

user1 = User.create!(email: 'pikachu@pokemon.com', password: '12345678', first_name: 'Lilancia', last_name: 'White', location: 'China', nationality: 'Mexican', preferred_name: 'Lila' , gender: 'female');

user2 = User.create!(email: 'hearthrobbob@gmail.com', password: '12345678', first_name: 'Ricky', last_name: 'Bobby', location: 'China', nationality: 'Korean', preferred_name: 'Rick' , gender: 'male');

user3 = User.create!(email: 'michelle@whitehouse.gov', password: '12345678', first_name: 'Michelle', last_name: 'Obama', location: 'China', nationality: 'USA', preferred_name: 'Chelly' , gender: 'female');

user4 = User.create!(email: 'atate@hotmail.com', password: '12345678', first_name: 'Andrew', last_name: 'Tate', location: 'China', nationality: 'British', preferred_name: 'Tater' , gender: 'male');

users = []
26.times do |i|
  p "generating user number #{i}"
  user= User.create!(email: "#{Faker::Movies::HarryPotter.character.gsub(' ', '_')}#{Faker::Number.decimal_part}#{i}@gmail.com", password: '12345678', first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, location: Faker::Address.country, nationality: 'Faker::Address.country', preferred_name: 'Faker::HarryPotter.character' , gender: Faker::Gender.binary_type);
  users << user
end

users # => [<user1>, <user2>]

users[0]



community1 = Community.create!(name:'Happy Korean', description: 'Do you want to learn more about Korean culture or Korean language? Come join our Korean language group. We have many events such as celebrating Korean holidays or practicing language in one of our conversation meeting. All levels are welcome.', topic: Constants::TOPICS[0], user: user1,
)

users.each do |user|
    CommunityMember.create!(
      user: user,
      community: community1
    )
  end

# CommunityMember.create!(
#   user: users[10],
#   community: community1
# )

# CommunityMember.create!(
#   user: users[20],
#   community: community1
# )

# CommunityMember.create!(
#   user: users[15],
#   community: community1
# )

community2 = Community.create!(name:"The Greek Gods' Rugby Association", description: 'Sigma male rugby team. Huzah!. Roll in the mud and blow off some steam. Be the man you were born to be.', topic: 'Rugby', user: user2,
)

CommunityMember.create!(
  user: users[2],
  community: community2
)

community3 = Community.create!(name:"Coffee & Do Knits", description: 'There are trees that need sweaters and little mice to be made. Sit down, chat, and get sassy as we knit big ole lumpy sweaters together.', topic: 'Rugby', user: user3,
)

CommunityMember.create!(
  user: user3,
  community: community3
)

community4 = Community.create!(name:"Bake It Till You Make It", description: "Let's get fat and sassy cooking some declicious meals.", topic: 'Cooking', user: user4,
)

community5 = Community.create!(name:"Holy Fathers", description: "Gather with other daddies of the Lord for bible studies and other events.", topic: 'Religious', user: users[9],
)

CommunityMember.create!(
  user: users[11],
  community: community3
)



#Korean Community
e11 = Event.create!(title: 'Korean Chuseok', location: 'Korean Consulate', type: "offline" , start_at: Faker::Time.between(from: DateTime.now - 90, to: DateTime.now + 200), end_at: Faker::Time.between(from: DateTime.now - 90, to: DateTime.now + 200,), introduction: "Come and learn about South Korea's version of Thanksgiving.", community: community1, user: user1)
e12 = Event.create!(title: 'Korean New Years', location: 'Korean Consulate', type: "offline" , start_at: Faker::Time.between(from: DateTime.now - 90, to: DateTime.now + 200), end_at: Faker::Time.between(from: DateTime.now - 90, to: DateTime.now + 200,), introduction: "Come and learn about South Korea's version of Thanksgiving.", community: community1, user: user1)
e13 = Event.create!(title: 'Korean Conversation Group', location: 'Korean Consulate', type: "offline" , start_at: Faker::Time.between(from: DateTime.now - 90, to: DateTime.now + 200), end_at: Faker::Time.between(from: DateTime.now - 90, to: DateTime.now + 200,), introduction: "Come and learn about South Korea's version of Thanksgiving.", community: community1, user: user1)
e14 = Event.create!(title: 'Korean Book Club', location: 'Korean Consulate', type: "offline" , start_at: Faker::Time.between(from: DateTime.now - 90, to: DateTime.now + 200), end_at: Faker::Time.between(from: DateTime.now - 90, to: DateTime.now + 200,), introduction: "Come and learn about South Korea's version of Thanksgiving.", community: community1, user: user1)
e15 = Event.create!(title: 'Korean Cinema', location: 'Korean Consulate', type: "offline" , start_at: Faker::Time.between(from: DateTime.now - 90, to: DateTime.now + 200), end_at: Faker::Time.between(from: DateTime.now - 90, to: DateTime.now + 200,), introduction: "Come and learn about South Korea's version of Thanksgiving.", community: community1, user: user1)
e16 = Event.create!(title: 'Korean Cooking Class', location: 'Korean Consulate', type: "offline" , start_at: Faker::Time.between(from: DateTime.now - 90, to: DateTime.now + 200), end_at: Faker::Time.between(from: DateTime.now - 90, to: DateTime.now + 200,), introduction: "Come and learn about South Korea's version of Thanksgiving.", community: community1, user: user1)
e17 = Event.create!(title: 'Korean Kpop Dance Practice', location: 'Korean Consulate', type: "offline" , start_at: Faker::Time.between(from: DateTime.now - 90, to: DateTime.now + 200), end_at: Faker::Time.between(from: DateTime.now - 90, to: DateTime.now + 200,), introduction: "Come and learn about South Korea's version of Thanksgiving.", community: community1, user: user1)

#Rugby Community
e21 = Event.create!(title: 'Saturday Pick-Up', location: "Baker's Field Next To Suzhou River", type: "offline", start_at: Faker::Time.between(from: DateTime.now - 90, to: DateTime.now + 200), end_at: Faker::Time.between(from: DateTime.now - 90, to: DateTime.now + 200,), introduction: "Come join a less formal pickup game of rugby. You are welcome to bring friends and family, but please give the event leader a heads up.", community: community2, user: user2)



#Knitting Community
e31 = Event.create!(title: 'Nonviolent Knitting', location: "Weeping Pillows Cafe",  type: "offline",start_at: Faker::Time.between(from: DateTime.now - 90, to: DateTime.now + 200), end_at: Faker::Time.between(from: DateTime.now - 90, to: DateTime.now + 200,), introduction: "Join us to knit goods to raise money for domestic violence escapees.", community: community3,
user: user3)




#Korean CommunityEvent images

file1 = URI.open("https://images.unsplash.com/photo-1594373606301-5b66f999f62b?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MzIyfHxrb3JlYW58ZW58MHx8MHx8fDA%3D")
file2 = URI.open("https://images.unsplash.com/photo-1605972023865-471b1488b6a9?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mjh8fGtvcmVhbnxlbnwwfHwwfHx8MA%3D%3D")
file3 = URI.open("https://images.unsplash.com/photo-1578648491523-2f2a3a8ca63a?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NjN8fGtvcmVhfGVufDB8fDB8fHww")
file4 = URI.open("https://cdn.houstonpublicmedia.org/wp-content/uploads/2018/02/09113051/Korean-Festival-Houstoin.jpg")
e11.images.attach(io: file1, filename: "c1e1i1.png", content_type: "image/png")
e11.images.attach(io: file2, filename: "c1e1i2.png", content_type: "image/png")
e11.images.attach(io: file3, filename: "c1e1i3.png", content_type: "image/png")
e11.save
community1.photo.attach(io: file4, filename: "c1e1i4.png",content_type:"image/png")
community1.save


file1 = URI.open("https://images.unsplash.com/photo-1517154421773-0529f29ea451?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8a29yZWF8ZW58MHx8MHx8fDA%3D")
file2 = URI.open("https://images.unsplash.com/photo-1531931477284-7e16215c9540?w=1000&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDB8fGtvcmVhfGVufDB8fDB8fHww")
file3 = URI.open("https://images.unsplash.com/photo-1485186337913-a42c84d7ffcc?w=1000&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDJ8fGtvcmVhfGVufDB8fDB8fHww")
file4 = URI.open("https://resources.world.rugby/worldrugby/photo/2021/05/27/ebd0ace7-f5c1-46e4-861b-f96130f137cd/Yara1.jpeg")
e12.images.attach(io: file1, filename: "c1e2i1.png", content_type: "image/png")
e12.images.attach(io: file2, filename: "c1e2i2.png", content_type: "image/png")
e12.images.attach(io: file3, filename: "c1e2i3.png", content_type: "image/png")
e12.save
community2.photo.attach(io: file4, filename: "c1e2i4.png",content_type:"image/png")
community2.save

file1 = URI.open("https://images.unsplash.com/photo-1511376979163-f804dff7ad7b?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8ZGlhbG9ndWV8ZW58MHx8MHx8fDA%3D")
file2 = URI.open("https://images.unsplash.com/photo-1530811761207-8d9d22f0a141?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8Y2hhdHxlbnwwfHwwfHx8MA%3D%3D")
file3 = URI.open("https://images.unsplash.com/photo-1577563908411-5077b6dc7624?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Y2hhdHxlbnwwfHwwfHx8MA%3D%3D")
file4 = URI.open("https://www.hartlepoolmail.co.uk/webimg/b25lY21zOjg5N2MxMWFhLTc2NWYtNGIwOC1hNzJiLTdlZGNjYjliNmNlNDo3OTA5ZjQzOC0yZjkzLTRhNmMtYjhhMC1iZTA4OGE0MjVlMGI=.jpg?crop=3:2,smart&width=640&quality=65&enable=upscale")
e13.images.attach(io: file1, filename: "c1e3i1.png", content_type: "image/png")
e13.images.attach(io: file2, filename: "c1e3i2.png", content_type: "image/png")
e13.images.attach(io: file3, filename: "c1e3i3.png", content_type: "image/png")
e13.save
community3.photo.attach(io: file4, filename: "c1e3i4.png",content_type:"image/png")
community3.save


file1 = URI.open("https://images.unsplash.com/photo-1532012197267-da84d127e765?w=1000&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Ym9va3xlbnwwfHwwfHx8MA%3D%3D")
file2 = URI.open("https://images.unsplash.com/photo-1576872381149-7847515ce5d8?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8Ym9va3xlbnwwfHwwfHx8MA%3D%3D")
file3 = URI.open("https://images.unsplash.com/photo-1544716278-e513176f20b5?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTV8fGJvb2t8ZW58MHx8MHx8fDA%3D")
file4 = URI.open("https://www.hansberrygarden.org/wp-content/uploads/2019/09/bake_sale_people.jpg")
e14.images.attach(io: file1, filename: "c1e4i1.png", content_type: "image/png")
e14.images.attach(io: file2, filename: "c1e4i2.png", content_type: "image/png")
e14.images.attach(io: file3, filename: "c1e4i3.png", content_type: "image/png")
e14.save
community4.photo.attach(io: file4, filename: "c1e4i4.png",content_type:"image/png")
community4.save


file1 = URI.open("https://images.unsplash.com/photo-1440404653325-ab127d49abc1?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTR8fG1vdmllfGVufDB8fDB8fHww")
file2 = URI.open("https://images.unsplash.com/photo-1598899134739-24c46f58b8c0?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8bW92aWV8ZW58MHx8MHx8fDA%3D")
file3 = URI.open("https://images.unsplash.com/photo-1543536448-d209d2d13a1c?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjB8fG1vdmllfGVufDB8fDB8fHww")
file4 = URI.open("https://images.unsplash.com/photo-1609234656432-603fd648adf8?q=80&w=2670&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
e15.images.attach(io: file1, filename: "c1e5i1.png", content_type: "image/png")
e15.images.attach(io: file2, filename: "c1e5i2.png", content_type: "image/png")
e15.images.attach(io: file3, filename: "c1e5i3.png", content_type: "image/png")
e15.save
community5.photo.attach(io: file4, filename: "c1e5i4.png",content_type:"image/png")
community5.save

file1 = URI.open("https://images.unsplash.com/photo-1528712306091-ed0763094c98?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8Y29va2luZ3xlbnwwfHwwfHx8MA%3D%3D")
file2 = URI.open("https://images.unsplash.com/photo-1635363638580-c2809d049eee?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8S29yZWFuJTIwZm9vZHxlbnwwfHwwfHx8MA%3D%3D")
file3 = URI.open("https://images.unsplash.com/photo-1532347231146-80afc9e3df2b?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8S29yZWFuJTIwZm9vZHxlbnwwfHwwfHx8MA%3D%3D")
e16.images.attach(io: file1, filename: "c1e6i1.png", content_type: "image/png")
e16.images.attach(io: file2, filename: "c1e6i2.png", content_type: "image/png")
e16.images.attach(io: file3, filename: "c1e6i3.png", content_type: "image/png")
e16.save

file1 = URI.open("https://images.unsplash.com/photo-1537365587684-f490102e1225?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8ZGFuY2V8ZW58MHx8MHx8fDA%3D")
file2 = URI.open("https://images.unsplash.com/photo-1523450001312-faa4e2e37f0f?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTB8fGRhbmNlfGVufDB8fDB8fHww")
file3 = URI.open("https://images.unsplash.com/photo-1568299484622-c9ffd64093ff?w=600&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8a3BvcHxlbnwwfHwwfHx8MA%3D%3D")
e17.images.attach(io: file1, filename: "c1e7i1.png", content_type: "image/png")
e17.images.attach(io: file2, filename: "c1e7i2.png", content_type: "image/png")
e17.images.attach(io: file3, filename: "c1e7i3.png", content_type: "image/png")
e17.save


#Other event images
file1 = URI.open("https://images.unsplash.com/photo-1616500156885-e51d834cab8e?w=1000&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NDB8fHJ1Z2J5fGVufDB8fDB8fHww")
file2 = URI.open("https://images.unsplash.com/photo-1516689807549-04b4c3b4ee35?w=1000&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MzZ8fHJ1Z2J5fGVufDB8fDB8fHww")
file3 = URI.open("https://images.unsplash.com/photo-1599832899648-9666985c1bd2?w=1000&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mzl8fHJ1Z2J5fGVufDB8fDB8fHww")
e21.images.attach(io: file1, filename: "c2e1i1.png", content_type: "image/png")
e21.images.attach(io: file2, filename: "c2e1i2.png", content_type: "image/png")
e21.images.attach(io: file3, filename: "c2e1i3.png", content_type: "image/png")
e21.save


file1 = URI.open("https://images.unsplash.com/photo-1584992236310-6edddc08acff?w=1000&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8a25pdHRpbmd8ZW58MHx8MHx8fDA%3D")
file2 = URI.open("https://images.unsplash.com/photo-1632649027900-389e810204e6?w=1000&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8a25pdHRpbmd8ZW58MHx8MHx8fDA%3D")
file3 = URI.open("https://images.unsplash.com/photo-1541944743827-e04aa6427c33?w=1000&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8a25pdHRpbmd8ZW58MHx8MHx8fDA%3D")
e31.images.attach(io: file1, filename: "c3e1i1.png", content_type: "image/png")
e31.images.attach(io: file2, filename: "c3e1i2.png", content_type: "image/png")
e31.images.attach(io: file3, filename: "c3e1i3.png", content_type: "image/png")
e31.save


#user images

file1 = URI.open("https://images.unsplash.com/photo-1438761681033-6461ffad8d80?w=1000&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8cGVyc29ufGVufDB8fDB8fHww")
user1.photo.attach(io: file1, filename: "user1.png", content_type: "image/png")
user1.save

file1 = URI.open("https://images.unsplash.com/flagged/photo-1570612861542-284f4c12e75f?w=1000&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8M3x8cGVyc29ufGVufDB8fDB8fHww")
user2.photo.attach(io: file1, filename: "user2.png", content_type: "image/png")
user2.save

file1 = URI.open("https://images.unsplash.com/photo-1544005313-94ddf0286df2?q=80&w=388&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
user3.photo.attach(io: file1, filename: "user3.png", content_type: "image/png")
user3.save
