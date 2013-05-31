# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create( username: "Bob1", email: "bob1@bob.com" )
User.create( username: "Bob2", email: "bob2@bob.com" )
User.create( username: "Bob3", email: "bob3@bob.com" )
User.create( username: "Bob4", email: "bob4@bob.com" )
User.create( username: "Bob5", email: "bob5@bob.com" )

u = User.first

u.create_poll( 'Best artists of all time' )

u.add_question( Poll.first, 'Who is the best composer?', 'Bach', 'Mozart', 'Beethoven', 'Tchaikovsky' )
u.add_question( Poll.first, 'What is the best rock band?', 'Led Zeppelin', 'The Who', 'Jefferson Airplane', 'Tears for Fears' )
u.add_question( Poll.first, 'Who is the best rapper?', 'Kanye West', 'Jay-Z', 'A Tribe Called Quest', 'Wu Tang Clan' )

a = User.find(2)
b = User.find(3)
c = User.find(4)
d = User.find(5)

a.vote( Question.find(1), "Beethoven" )
a.vote( Question.find(2), "The Who" )
a.vote( Question.find(3), "Wu Tang Clan" )

b.vote( Question.find(1), "Beethoven" )
b.vote( Question.find(2), "The Who" )
b.vote( Question.find(3), "Jay-Z" )

c.vote( Question.find(1), "Beethoven" )
c.vote( Question.find(2), "Jefferson Airplane" )
c.vote( Question.find(3), "Kanye West" )

d.vote( Question.find(1), "Bach" )
d.vote( Question.find(2), "Led Zeppelin" )
d.vote( Question.find(3), "Wu Tang Clan" )
