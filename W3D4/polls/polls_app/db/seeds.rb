# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Response.destroy_all
Question.destroy_all
Poll.destroy_all
AnswerChoice.destroy_all

#User
u1 = User.create!(username: "betty")
u2 = User.create!(username: "ram")
u3 = User.create!(username: "amy")
u4 = User.create!(username: "basu")
u5 = User.create!(username: "jack")

# Poll
p1 = Poll.create!(author_id: u1.id, title: "good")
p2 = Poll.create!(author_id: u2.id, title: "better")
p3 = Poll.create!(author_id: u3.id, title: "best")
p4 = Poll.create!(author_id: u4.id, title: "excellent")
p5 = Poll.create!(author_id: u5
.id, title: "kudos")

# Question 
q1 = Question.create!(text: "what's up", poll_id: p1.id)
q2 = Question.create!(text: "what's new", poll_id: p2.id)
q3 = Question.create!(text: "what's cool", poll_id: p3.id)
q4 = Question.create!(text: "what's hot", poll_id: p4.id)
q5 = Question.create!(text: "what up", poll_id: p5.id)

#AnswerChoice

ac1 = AnswerChoice.create!(question_id: q1.id, text: "fine")
ac2 = AnswerChoice.create!(question_id: q2.id, text: "good")
ac3 = AnswerChoice.create!(question_id: q3.id, text: "superb")
ac4 = AnswerChoice.create!(question_id: q4.id, text: "at ease")
ac5 = AnswerChoice.create!(question_id: q5.id, text: "cool")

#Response
r1 = Response.create!(user_id: u1.id, answerchoice_id: ac1.id)
r2 = Response.create!(user_id: u2.id, answerchoice_id: ac2.id)
r3 = Response.create!(user_id: u3.id, answerchoice_id: ac3.id)
r4 = Response.create!(user_id: u4.id, answerchoice_id: ac4.id)
r5 = Response.create!(user_id: u5.id, answerchoice_id: ac5.id)
r6 = Response.create!(user_id: u1.id, answerchoice_id: ac5.id)




