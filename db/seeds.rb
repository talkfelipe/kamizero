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
  end_time: "14:30:00",
  created_at: Date.new(2025, 11, 5)

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
  end_time: "11:30:00",
  created_at: Date.new(2025, 11, 17)
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
School Administration",
  created_at: Date.new(2025, 11, 7)
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
School Administration",
  created_at: Date.new(2025, 11, 7)
)

notice1.save
notice2.save
notice3.save
notice4.save

teacher1 = User.new(
  email: "teacher@meguro.com",
  password: "123456",
  first_name: "Teacher",
  last_name:"Sato",
  role: "teacher",
  school: school1
)

teacher2 = User.new(
  email: "teacher@shinagawa.com",
  password: "123456",
  first_name: "Teacher",
  last_name:"Sato",
  role: "teacher",
  school: school2
)

teacher1.save!
teacher2.save!

parent1 = User.create(
  email: "parent@meguro.com",
  first_name: "Parent",
  last_name:"Sato",
  password: "123456",
)

Subscription.create(
  user: parent1,
  school: school1,
  grade: "3",
  classroom: "A"
)

# Subscription.create(
#   user: parent1,
#   school: school2,
#   grade: "5",
#   classroom: "A"
# )

Notice.create!(
  school: school1,
  category: "Event",
  title: "Grade 1A Morning Assembly",
  grade: "1",
  classroom: "A",
  content: "Hello Parents, our Grade 1A class will have a special morning assembly. Students will perform songs and short skits. Please join us if you can!",
  date: Date.new(2025, 11, 20),
  start_time: "09:00:00",
  end_time: "10:00:00",
  created_at: Date.new(2025, 10, 17)
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
  end_time: "14:30:00",
  created_at: Date.new(2025, 11, 1)
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
  end_time: "11:00:00",
  created_at: Date.new(2025, 11, 12)
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
  end_time: "15:30:00",
  created_at: Date.new(2025, 11, 19)
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
  end_time: "12:00:00",
  created_at: Date.new(2025, 9, 17)
)

# --- School 1: General (5)
Notice.create!(
  school: school1,
  category: "General",
  title: "New Library Books Arrived",
  grade: "All",
  classroom: "All",
  content: "We are happy to announce that new books have been added to the school library. Students are encouraged to visit and explore!",
  created_at: Date.new(2025, 8, 17)
)

Notice.create!(
  school: school1,
  category: "General",
  title: "Lost-and-Found Reminder",
  grade: "All",
  classroom: "All",
  content: "Please check the lost-and-found box before the end of the month. Items not claimed will be donated.",
  created_at: Date.new(2025, 10, 17)
)

Notice.create!(
  school: school1,
  category: "General",
  title: "School Closure Notice",
  grade: "All",
  classroom: "All",
  content: "Due to maintenance, the school will be closed on December 3rd. Regular classes resume the following day.",
  created_at: Date.new(2025, 11, 3)
)

Notice.create!(
  school: school1,
  category: "General",
  title: "PTA Newsletter November Edition",
  grade: "All",
  classroom: "All",
  content: "The November PTA newsletter is now available on the school website. Please take a moment to read the updates.",
  created_at: Date.new(2025, 10, 17)
)

Notice.create!(
  school: school1,
  category: "General",
  title: "Winter Uniform Reminder",
  grade: "All",
  classroom: "All",
  content: "Starting December 1st, students should wear winter uniforms. Please ensure your child is properly dressed.",
  created_at: Date.new(2025, 11, 1)
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
  end_time: "10:30:00",
  created_at: Date.new(2025, 9, 17)
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
  end_time: "09:00:00",
  created_at: Date.new(2025, 10, 17)
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
  end_time: "14:00:00",
  created_at: Date.new(2025, 7, 17)
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
  end_time: "12:00:00",
  created_at: Date.new(2025, 8, 17)
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
  end_time: "12:00:00",
  created_at: Date.new(2025, 9, 17)
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



# ==== 2025-07 ====
Notice.create!(
  school: school1,
  category: "Event",
  title: "Grade 4D Summer Project Launch",
  grade: "4",
  classroom: "D",
  content: "Grade 4D will launch a small Summer Project where students choose a topic, collect information, and create a simple presentation. The teacher will explain expectations and share ideas. Families can support by talking with children about topics that interest them at home.",
  date: Date.new(2025, 7, 3),
  start_time: "09:30:00",
  end_time: "10:30:00",
  created_at: Date.new(2025, 6, 3)
)

Notice.create!(
  school: school1,
  category: "Event",
  title: "All Grades End-of-Term Class Party",
  grade: "All",
  classroom: "All",
  content: "To celebrate the end of the first term, classes will have small parties in their classrooms. Students may play simple games, share reflections, and write messages for classmates. Please note that we will not exchange food items, so no snacks are necessary.",
  date: Date.new(2025, 7, 17),
  start_time: "13:00:00",
  end_time: "14:30:00",
  created_at: Date.new(2025, 6, 17)
)

Notice.create!(
  school: school2,
  category: "Event",
  title: "Grade 1B Water Play Day",
  grade: "1",
  classroom: "B",
  content: "Grade 1B will have a Water Play Day in the school yard, weather permitting. Students will use small buckets and sprinklers under teacher supervision. Please send a towel, change of clothes, and a plastic bag for wet items. Sandals are not allowed for safety reasons.",
  date: Date.new(2025, 7, 5),
  start_time: "10:00:00",
  end_time: "11:00:00",
  created_at: Date.new(2025, 6, 5)
)

Notice.create!(
  school: school2,
  category: "Event",
  title: "All Grades Summer Reading Kickoff",
  grade: "All",
  classroom: "All",
  content: "Before the summer break, the library will introduce a Summer Reading Challenge. Students will receive a simple reading log and suggested book list. The goal is to enjoy reading regularly during the holidays. Families can help by setting aside quiet reading time at home.",
  date: Date.new(2025, 7, 19),
  start_time: "09:20:00",
  end_time: "10:10:00",
  created_at: Date.new(2025, 6, 19)
)

# ==== 2025-08 ====
Notice.create!(
  school: school1,
  category: "Event",
  title: "All School Summer Homework Help Session",
  grade: "All",
  classroom: "All",
  content: "For students who wish to review summer homework, we will open a Homework Help Session in the library. Teachers will be available to answer simple questions and help students plan remaining tasks. This is optional, but can support children who feel behind schedule.",
  date: Date.new(2025, 8, 20),
  start_time: "10:00:00",
  end_time: "11:30:00",
  created_at: Date.new(2025, 7, 20)
)

Notice.create!(
  school: school1,
  category: "Event",
  title: "Grade 2C Summer Memory Sharing",
  grade: "2",
  classroom: "C",
  content: "Grade 2C will hold a Summer Memory Sharing circle in the classroom. Students may bring one photo or small object related to a summer experience and talk about it. This helps develop speaking skills and allows classmates to learn more about one another in a relaxed way.",
  date: Date.new(2025, 8, 29),
  start_time: "09:30:00",
  end_time: "10:30:00",
  created_at: Date.new(2025, 7, 29)
)

Notice.create!(
  school: school2,
  category: "Event",
  title: "All Grades Back-to-School Assembly",
  grade: "All",
  classroom: "All",
  content: "After the summer holiday, we will reopen the term with a Back-to-School Assembly. The principal and teachers will share messages about safe learning, kindness, and goals for the new term. Students will also review important school routines together.",
  date: Date.new(2025, 8, 25),
  start_time: "09:00:00",
  end_time: "10:00:00",
  created_at: Date.new(2025, 7, 25)
)

Notice.create!(
  school: school2,
  category: "Event",
  title: "Grade 6A Summer Research Presentations",
  grade: "6",
  classroom: "A",
  content: "Grade 6A students who completed optional summer research projects will present their work to the class. Topics may include science, history, sports, or personal interests. The goal is to practice presentation skills and learn from peers in a supportive environment.",
  date: Date.new(2025, 8, 28),
  start_time: "13:00:00",
  end_time: "14:30:00",
  created_at: Date.new(2025, 7, 28)
)

# ==== 2025-09 ====
Notice.create!(
  school: school1,
  category: "Event",
  title: "All School Autumn Sports Day",
  grade: "All",
  classroom: "All",
  content: "Our Autumn Sports Day will take place on the school field. Students from all grades will join simple races, relays, and group exercises. Families are welcome to watch from the designated area. Please prepare hats, water bottles, and check the weather forecast in advance.",
  date: Date.new(2025, 9, 14),
  start_time: "09:00:00",
  end_time: "12:00:00",
  created_at: Date.new(2025, 8, 14)
)

Notice.create!(
  school: school1,
  category: "Event",
  title: "Grade 3B Autumn Nature Walk",
  grade: "3",
  classroom: "B",
  content: "Grade 3B will take a short Autumn Nature Walk near the school. Students will look for seasonal changes, collect safe natural items, and write short reflection sentences back in class. Comfortable walking shoes and a small bag for collected items are recommended.",
  date: Date.new(2025, 9, 26),
  start_time: "10:00:00",
  end_time: "11:30:00",
  created_at: Date.new(2025, 8, 27)
)

Notice.create!(
  school: school2,
  category: "Event",
  title: "Grade 4C Science Fair",
  grade: "4",
  classroom: "C",
  content: "Grade 4C will host a small Science Fair where students display simple experiments or research posters. Other classes may visit during the day, and families are invited to join in the final viewing session. This event encourages curiosity and clear scientific explanation.",
  date: Date.new(2025, 9, 18),
  start_time: "13:30:00",
  end_time: "15:00:00",
  created_at: Date.new(2025, 8, 18)
)

Notice.create!(
  school: school2,
  category: "Event",
  title: "All Grades Respect for the Aged Day Letters",
  grade: "All",
  classroom: "All",
  content: "To mark Respect for the Aged Day, students will write letters or draw pictures for older family members or community residents. Teachers will guide students in expressing thanks and sharing kind messages. Families may choose how to deliver the letters after the event.",
  date: Date.new(2025, 9, 12),
  start_time: "10:00:00",
  end_time: "11:00:00",
  created_at: Date.new(2025, 8, 12)
)

# ==== 2025-10 ====
Notice.create!(
  school: school1,
  category: "Event",
  title: "Grade 1C Autumn Storytime",
  grade: "1",
  classroom: "C",
  content: "Grade 1C will have a special Autumn Storytime in the classroom. The teacher will read seasonal picture books, and students will talk about their favorite scenes. This gentle activity supports listening skills, imagination, and enjoyment of books at a calm pace.",
  date: Date.new(2025, 10, 7),
  start_time: "09:20:00",
  end_time: "10:10:00",
  created_at: Date.new(2025, 9, 7)
)

Notice.create!(
  school: school1,
  category: "Event",
  title: "All Grades Art and Music Showcase",
  grade: "All",
  classroom: "All",
  content: "Classes will display selected artworks and perform short music pieces in an Art and Music Showcase. Families can walk through the displays and enjoy performances in small groups. We hope this event highlights students’ creativity across different subjects.",
  date: Date.new(2025, 10, 23),
  start_time: "14:00:00",
  end_time: "15:30:00",
  created_at: Date.new(2025, 9, 17)
)

Notice.create!(
  school: school2,
  category: "Event",
  title: "Grade 5A Field Trip Briefing",
  grade: "5",
  classroom: "A",
  content: "Grade 5A will hold a Field Trip Briefing for students and parents. The teacher will explain the destination, schedule, what to bring, and behavior expectations. There will also be a short Q&A time so that families can feel prepared and ask about any concerns.",
  date: Date.new(2025, 10, 9),
  start_time: "18:00:00",
  end_time: "19:00:00",
  created_at: Date.new(2025, 9, 9)
)

Notice.create!(
  school: school2,
  category: "Event",
  title: "All School Autumn Safety Week Assembly",
  grade: "All",
  classroom: "All",
  content: "During Autumn Safety Week, we will hold an assembly to review road safety, safe use of bicycles, and ways to stay visible in the darker months. Please discuss safe commuting habits with your child and check that any bicycle lights or reflectors at home are working well.",
  date: Date.new(2025, 10, 16),
  start_time: "09:00:00",
  end_time: "09:45:00",
  created_at: Date.new(2025, 9, 16)
)

puts "done!"
