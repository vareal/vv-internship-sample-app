User.create!(
  name:  "Example User",
  email: "example@railstutorial.org",
  password: "foobar",
  password_confirmation: "foobar",
  role: 1,
  activated: true,
  activated_at: Time.zone.now
)

99.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@railstutorial.org"
  password = "password"
  content = Faker::Food.description
  user_id = n + 1
  User.create!(
    name: name,
    email: email,
    password: password,
    password_confirmation: password,
    activated: true,
    activated_at: Time.zone.now
  )
  Micropost.create(
    content: content,
    user_id: user_id
  )
end

10.times do |n|
  Micropost.create(
    content: Faker::Food.description,
    user_id: 100
  )
end

user  = User.first
users = User.all
following = users[2..50]
followers = users[3..40]
following.each { |followed| user.follow(followed) }
followers.each { |follower| follower.follow(user) }
