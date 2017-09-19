# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

joe = User.create!(username: "joemontana49", first_name: "Joe", last_name: "Montana", password: "encryptthis", email: "joemontana@football.com")
jimi = User.create!(username: "xXpurplehazeXx", first_name: "Jimi", last_name: "Hendrix", password: "cr0sst0wntr4ff1c", email: "scusemewhile@kissthesky.com")
stahl = User.create!(username: "hstahl", first_name: "Howard", last_name: "Stahl", password: "rubylyfe", email: "hstahl@smc.com", isAdmin: true)

joe_post = Post.create!(content: "Hello there, my name is is is is is is is is is", user: joe)

Comment.create!(content: "Hey Joe", post: joe_post, user: jimi)