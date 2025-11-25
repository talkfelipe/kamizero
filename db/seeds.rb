Notice.destroy_all
User.destroy_all
School.destroy_all


puts "Creating seeds"

school1 = School.new(name: "Meguro")
school2 = School.new(name: "Shinagawa")
school1.save
school2.save

notice1 = Notice.new(
  school: school1,
  category: "Event",
  title: "Grade 3A Class Party",
  grade: "3",
  classroom: "A",
  content: "Dear Parents,We are excited to invite you to our upcoming class party! This will be a fun-filled afternoon with games, snacks, and activities.
            Time: 1:00 PM - 3:00 PM
            Location: Grade 3A Classroom
            Please let us know if you can volunteer to help with: Bringing snacks Setting up decorations Organizing games
            We look forward to celebrating together!
            Ms. Johnson
            Event Date: December 5, 2025",
date: Date.new(2025, 12, 5)
)

notice2 = Notice.new(
  school: school2,
  category: "Event",
  title: "Grade 2B Class Party",
  grade: "2",
  classroom: "B",
  content: "Dear Parents,We are excited to invite you to our upcoming class party! This will be a fun-filled afternoon with games, snacks, and activities.
            Time: 1:00 PM - 3:00 PM
            Location: Grade 2B Classroom
            Please let us know if you can volunteer to help with: Bringing snacks Setting up decorations Organizing games
            We look forward to celebrating together!
            Ms. Johnson
            Event Date: January 15, 2026",
date: Date.new(2026, 1, 15)
)

notice3 = Notice.new(
  school: school1,
  category: "General",
  title: "School Lunch Menu Update",
  grade: "All",
  classroom: "All",
  content: "Dear Parents,
Please note that the school lunch menu has been updated for November. The new menu includes more vegetarian options and allergen-friendly meals.
You can view the full menu on our school website or pick up a printed copy from the main office.
If your child has specific dietary requirements, please contact the school office.
Thank you,
School Administration"
)

notice4 = Notice.new(
  school: school2,
  category: "General",
  title: "School Lunch Menu Update",
  grade: "All",
  classroom: "All",
  content: "Dear Parents,
Please note that the school lunch menu has been updated for November. The new menu includes more vegetarian options and allergen-friendly meals.
You can view the full menu on our school website or pick up a printed copy from the main office.
If your child has specific dietary requirements, please contact the school office.
Thank you,
School Administration"
)

notice1.save
notice2.save
notice3.save
notice4.save

teacher1 = User.new(
  email: "teacher@meguro.com",
  password: "123456",
  role: "teacher",
  school: school1
)

teacher2 = User.new(
  email: "teacher@shinagawa.com",
  password: "123456",
  role: "teacher",
  school: school2
)

teacher1.save!
teacher2.save!

parent1 = User.create(
  email: "parent@meguro.com",
  password: "123456",
)

subscription = Subscription.create(
  user: parent1,
  school: school1,
  grade: "3",
  classroom: "A"
)

puts "done!"
