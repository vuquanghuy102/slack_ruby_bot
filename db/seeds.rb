# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
WorkSpace.destroy_all
Question.destroy_all
Choice.destroy_all

admin = User.create(
  roles: "0",
  email: "admin@tomosia.com",
  password: "admin@1234"
)

leader = User.create(
  roles: "1",
  email: "leader@tomosia.com",
  password: "leader@1234"
)

work_space1 = WorkSpace.create(
  name: "Huy-Ruby",
  token: "xoxb-646759876034-658186468293-mN3i0dxZOiZoUNzya0V1QS4z",
  id_work_space_slack: "TK0NBRS10",
  user_id: leader.id
)

question1 = Question.create(
  content: "Hôm nay bạn cảm thấy thế nào?",
  type_question: false,
  incognito: false,
  active: true,
  work_space_id: work_space1.id
)

question2 = Question.create(
  content: "Đòi sếp tăng lương?",
  type_question: false,
  incognito: false,
  active: true,
  work_space_id: work_space1.id
)

choice1 = Choice.create(
  name: "Khỏe lắm",
  answer_count: 0,
  question_id: question1.id
)

choice2 = Choice.create(
  name: "Hơi khỏe thôi",
  answer_count: 0,
  question_id: question1.id
)

choice3 = Choice.create(
  name: "Mệt",
  answer_count: 0,
  question_id: question1.id
)

choice4 = Choice.create(
  name: "Tăng",
  answer_count: 0,
  question_id: question2.id
)

choice5 = Choice.create(
  name: "Thôi",
  answer_count: 0,
  question_id: question2.id
)