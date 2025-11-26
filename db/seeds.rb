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
date: Date.new(2025, 12, 5),
start_time: "13:30:00",
end_time: "14:30:00"
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
date: Date.new(2026, 1, 15),
start_time: "10:30:00",
end_time: "11:30:00"
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

Notice.create!(
  school: school1,
  category: "Event",
  title: "Grade 1A Morning Assembly",
  grade: "1",
  classroom: "A",
  content: "Hello Parents, our Grade 1A class will have a special morning assembly. Students will perform songs and short skits. Please join us if you can!",
  date: Date.new(2025, 11, 20),
  start_time: "09:00:00",
  end_time: "10:00:00"
)

Notice.create!(
  school: school1,
  category: "Event",
  title: "Grade 3B Science Fair",
  grade: "3",
  classroom: "B",
  content: "We’re excited to announce the annual Science Fair for Grade 3B! Students will present projects they’ve been working on for weeks.",
  date: Date.new(2025, 12, 4),
  start_time: "13:00:00",
  end_time: "14:30:00"
)

Notice.create!(
  school: school1,
  category: "Event",
  title: "Grade 4C Art Exhibition",
  grade: "4",
  classroom: "C",
  content: "Parents are invited to view the creative artwork made by Grade 4C students. Light refreshments will be served.",
  date: Date.new(2026, 1, 10),
  start_time: "10:00:00",
  end_time: "11:00:00"
)

Notice.create!(
  school: school1,
  category: "Event",
  title: "Winter Choir Concert",
  grade: "All",
  classroom: "All",
  content: "All students will participate in the Winter Choir Concert. Please come enjoy the wonderful performance!",
  date: Date.new(2025, 12, 18),
  start_time: "14:00:00",
  end_time: "15:30:00"
)

Notice.create!(
  school: school1,
  category: "Event",
  title: "Grade 5A Field Trip to Science Museum",
  grade: "5",
  classroom: "A",
  content: "Grade 5A students will visit the city Science Museum. Please prepare packed lunches and comfortable walking shoes.",
  date: Date.new(2026, 2, 12),
  start_time: "08:30:00",
  end_time: "12:00:00"
)

# --- School 1: General (5)
Notice.create!(
  school: school1,
  category: "General",
  title: "New Library Books Arrived",
  grade: "All",
  classroom: "All",
  content: "We are happy to announce that new books have been added to the school library. Students are encouraged to visit and explore!",
)

Notice.create!(
  school: school1,
  category: "General",
  title: "Lost-and-Found Reminder",
  grade: "All",
  classroom: "All",
  content: "Please check the lost-and-found box before the end of the month. Items not claimed will be donated.",
)

Notice.create!(
  school: school1,
  category: "General",
  title: "School Closure Notice",
  grade: "All",
  classroom: "All",
  content: "Due to maintenance, the school will be closed on December 3rd. Regular classes resume the following day.",
)

Notice.create!(
  school: school1,
  category: "General",
  title: "PTA Newsletter November Edition",
  grade: "All",
  classroom: "All",
  content: "The November PTA newsletter is now available on the school website. Please take a moment to read the updates.",
)

Notice.create!(
  school: school1,
  category: "General",
  title: "Winter Uniform Reminder",
  grade: "All",
  classroom: "All",
  content: "Starting December 1st, students should wear winter uniforms. Please ensure your child is properly dressed.",
)

# --- School 2: Event (5)
Notice.create!(
  school: school2,
  category: "Event",
  title: "Grade 2C Reading Presentation",
  grade: "2",
  classroom: "C",
  content: "Parents are invited to our Grade 2C reading presentation. Students will showcase their reading skills through short stories.",
  date: Date.new(2025, 12, 9),
  start_time: "09:30:00",
  end_time: "10:30:00"
)

Notice.create!(
  school: school2,
  category: "Event",
  title: "Sports Day Practice",
  grade: "All",
  classroom: "All",
  content: "Students will have Sports Day rehearsals next week. Please ensure they bring water bottles and wear comfortable shoes.",
  date: Date.new(2026, 1, 5),
  start_time: "08:00:00",
  end_time: "09:00:00"
)

Notice.create!(
  school: school2,
  category: "Event",
  title: "Grade 6A Graduation Ceremony",
  grade: "6",
  classroom: "A",
  content: "We are proud to invite parents to the Grade 6A graduation ceremony. Let’s celebrate the students’ achievements together.",
  date: Date.new(2026, 3, 20),
  start_time: "13:00:00",
  end_time: "14:00:00"
)

Notice.create!(
  school: school2,
  category: "Event",
  title: "Grade 6 Winter Festival",
  grade: "6",
  classroom: "All",
  content: "Grade 6 students will host the Winter Festival featuring performances, games, and snack booths.",
  date: Date.new(2025, 12, 15),
  start_time: "10:00:00",
  end_time: "12:00:00"
)

Notice.create!(
  school: school2,
  category: "Event",
  title: "Grade 3A Math Challenge Day",
  grade: "3",
  classroom: "A",
  content: "Grade 3A students will participate in fun math activities and problem-solving challenges!",
  date: Date.new(2025, 11, 28),
  start_time: "11:00:00",
  end_time: "12:00:00"
)

# --- School 2: General (5)
Notice.create!(
  school: school2,
  category: "General",
  title: "New Cafeteria Menu",
  grade: "All",
  classroom: "All",
  content: "Our cafeteria menu will change next month. Healthier options and more variety will be added.",
)

Notice.create!(
  school: school2,
  category: "General",
  title: "Parent-Teacher Meeting Reminder",
  grade: "All",
  classroom: "All",
  content: "Parent-teacher meetings will be held next week. Please check your child’s class schedule for details.",
)

Notice.create!(
  school: school2,
  category: "General",
  title: "After-School Program Registration",
  grade: "All",
  classroom: "All",
  content: "Registrations for the after-school program are now open. Please sign up through the school website.",
)

Notice.create!(
  school: school2,
  category: "General",
  title: "Holiday Break Notice",
  grade: "All",
  classroom: "All",
  content: "The school will be closed for winter holiday from December 24 to January 4. Enjoy your break!",
)

Notice.create!(
  school: school2,
  category: "General",
  title: "New Safety Rules on Campus",
  grade: "All",
  classroom: "All",
  content: "New safety policies have been implemented. Please review the updated rules on the school website.",
)


puts "done!"
