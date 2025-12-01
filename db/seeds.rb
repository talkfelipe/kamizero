Classroom.destroy_all
Notice.destroy_all
User.destroy_all
School.destroy_all


puts "Creating seeds"

schools = ["Meguro", "Shinagawa"]
surnames = ["Sato", "Suzuki", "Tanaka", "Yamada", "Ueno"]
notices_for_classroom = [
  {
    category: "Event",
    content: "Dear Parents,We are excited to invite you to our upcoming class party! This will be a fun-filled afternoon with games, snacks, and activities.
              Time: 1:00 PM - 3:00 PM
              Please let us know if you can volunteer to help with: Bringing snacks Setting up decorations Organizing games
              We look forward to celebrating together!
              Ms. Johnson
              Event Date: December 5, 2025",
    date: Date.new(2026, rand(1..4), rand(1..28)),
    start_time: "13:30:00",
    end_time: "14:30:00"
  },
  {
    category: "Event",
    content: "Dear Parents,We are excited to invite you to our upcoming class party! This will be a fun-filled afternoon with games, snacks, and activities.
              Time: 1:00 PM - 3:00 PM
              Location: Grade 3A Classroom
              Please let us know if you can volunteer to help with: Bringing snacks Setting up decorations Organizing games
              We look forward to celebrating together!
              Ms. Johnson
              Event Date: December 5, 2025",
    date: Date.new(2026, rand(1..4), rand(1..28)),
    start_time: "13:30:00",
    end_time: "14:30:00"
  },
  {
    category: "Event",
    content: "Dear Parents,We are excited to invite you to our upcoming class party! This will be a fun-filled afternoon with games, snacks, and activities.
              Time: 1:00 PM - 3:00 PM
              Location: Grade 2B Classroom
              Please let us know if you can volunteer to help with: Bringing snacks Setting up decorations Organizing games
              We look forward to celebrating together!
              Ms. Johnson
              Event Date: January 15, 2026",
    date: Date.new(2020 + rand(5..6), rand(1..12), rand(1..28)),
    start_time: "10:30:00",
    end_time: "11:30:00"
  },
  {
    category: "Event",
    content: "Hello Parents, our Grade 1A class will have a special morning assembly. Students will perform songs and short skits. Please join us if you can!",
    date: Date.new(2020 + rand(5..6), rand(1..12), rand(1..28)),
    start_time: "09:00:00",
    end_time: "10:00:00",
    created_at: Date.new(2025, 10, 17)
  },
  {
    category: "Event",
    content: "We're excited to announce the annual Science Fair for Grade 3B! Students will present projects they've been working on for weeks.",
    date: Date.new(2020 + rand(5..6), rand(1..12), rand(1..28)),
    start_time: "13:00:00",
    end_time: "14:30:00",
    created_at: Date.new(2025, 11, 1)
  },
  {
    category: "Event",
    content: "Parents are invited to view the creative artwork made by Grade 4C students. Light refreshments will be served.",
    date: Date.new(2020 + rand(5..6), rand(1..12), rand(1..28)),
    start_time: "10:00:00",
    end_time: "11:00:00",
    created_at: Date.new(2025, 11, 12)
  },
  {
    category: "Event",
    content: "Grade 5A students will visit the city Science Museum. Please prepare packed lunches and comfortable walking shoes.",
    date: Date.new(2020 + rand(5..6), rand(1..12), rand(1..28)),
    start_time: "08:30:00",
    end_time: "12:00:00",
    created_at: Date.new(2025, 9, 17)
  },
  {
    category: "Event",
    content: "We are proud to invite parents to the Grade 6A graduation ceremony. Let's celebrate the students achievements together.",
    date: Date.new(2020 + rand(5..6), rand(1..12), rand(1..28)),
    start_time: "13:00:00",
    end_time: "14:00:00",
    created_at: Date.new(2025, 7, 17)
  },

  {
    category: "Event",
    content: "Grade 6 students will host the Winter Festival featuring performances, games, and snack booths.",
    date: Date.new(2020 + rand(5..6), rand(1..12), rand(1..28)),
    start_time: "10:00:00",
    end_time: "12:00:00",
    created_at: Date.new(2025, 8, 17)
  },

  {
    category: "Event",
    content: "Grade 3A students will participate in fun math activities and problem-solving challenges!",
    date: Date.new(2020 + rand(5..6), rand(1..12), rand(1..28)),
    start_time: "11:00:00",
    end_time: "12:00:00",
    created_at: Date.new(2025, 9, 17)
  },
  {
    category: "Event",
    content: "Grade 4D will launch a small Summer Project where students choose a topic, collect information, and create a simple presentation. The teacher will explain expectations and share ideas. Families can support by talking with children about topics that interest them at home.",
    date: Date.new(2020 + rand(5..6), rand(1..12), rand(1..28)),
    start_time: "09:30:00",
    end_time: "10:30:00",
    created_at: Date.new(2025, 6, 3)
  },

  {
    category: "Event",
    content: "Grade 1B will have a Water Play Day in the school yard, weather permitting. Students will use small buckets and sprinklers under teacher supervision. Please send a towel, change of clothes, and a plastic bag for wet items. Sandals are not allowed for safety reasons.",
    date: Date.new(2020 + rand(5..6), rand(1..12), rand(1..28)),
    start_time: "10:00:00",
    end_time: "11:00:00",
    created_at: Date.new(2025, 6, 5)
  },
  {
    category: "Event",
    content: "Grade 2C will hold a Summer Memory Sharing circle in the classroom. Students may bring one photo or small object related to a summer experience and talk about it. This helps develop speaking skills and allows classmates to learn more about one another in a relaxed way.",
    date: Date.new(2020 + rand(5..6), rand(1..12), rand(1..28)),
    start_time: "09:30:00",
    end_time: "10:30:00",
    created_at: Date.new(2025, 7, 29)
  },
  {
    category: "Event",
    content: "Grade 3B will take a short Autumn Nature Walk near the school. Students will look for seasonal changes, collect safe natural items, and write short reflection sentences back in class. Comfortable walking shoes and a small bag for collected items are recommended.",
    date: Date.new(2020 + rand(5..6), rand(1..12), rand(1..28)),
    start_time: "10:00:00",
    end_time: "11:30:00",
    created_at: Date.new(2025, 8, 27)
  },

  {
    category: "Event",
    content: "Grade 4C will host a small Science Fair where students display simple experiments or research posters. Other classes may visit during the day, and families are invited to join in the final viewing session. This event encourages curiosity and clear scientific explanation.",
    date: Date.new(2020 + rand(5..6), rand(1..12), rand(1..28)),
    start_time: "13:30:00",
    end_time: "15:00:00",
    created_at: Date.new(2025, 8, 18)
  },
  {
    category: "Event",
    content: "Grade 1C will have a special Autumn Storytime in the classroom. The teacher will read seasonal picture books, and students will talk about their favorite scenes. This gentle activity supports listening skills, imagination, and enjoyment of books at a calm pace.",
    date: Date.new(2020 + rand(5..6), rand(1..12), rand(1..28)),
    start_time: "09:20:00",
    end_time: "10:10:00",
    created_at: Date.new(2025, 9, 7)
  },

  {
    category: "Event",
    content: "Grade 5A will hold a Field Trip Briefing for students and parents. The teacher will explain the destination, schedule, what to bring, and behavior expectations. There will also be a short Q&A time so that families can feel prepared and ask about any concerns.",
    date: Date.new(2025, 10, 9),
    start_time: "18:00:00",
    end_time: "19:00:00",
    created_at: Date.new(2025, 9, 9)
  }

]

notices_general = [
  {
    category: "General",
    title: "School Lunch Menu Update",
    content: "Dear Parents,
      Please note that the school lunch menu has been updated for November. The new menu includes more vegetarian options and allergen-friendly meals.
      You can view the full menu on our school website or pick up a printed copy from the main office.
      If your child has specific dietary requirements, please contact the school office.
      Thank you,
      School Administration"
  },
  {
    category: "Event",
    title: "All School Summer Homework Help Session",
    content: "For students who wish to review summer homework, we will open a Homework Help Session in the library. Teachers will be available to answer simple questions and help students plan remaining tasks. This is optional, but can support children who feel behind schedule.",
    date: Date.new(2026, rand(1..4), rand(1..28)),
    start_time: "10:00:00",
    end_time: "11:30:00"
  },
  {
    category: "General",
    title: "School Lunch Menu Update",
    content: "Dear Parents,
    Please note that the school lunch menu has been updated for November. The new menu includes more vegetarian options and allergen-friendly meals.
    You can view the full menu on our school website or pick up a printed copy from the main office.
    If your child has specific dietary requirements, please contact the school office.
    Thank you,
    School Administration",
    created_at: Date.new(2025, 11, 7)
  },
  {
    category: "General",
    title: "School Lunch Menu Update",
    content: "Dear Parents,
    Please note that the school lunch menu has been updated for November. The new menu includes more vegetarian options and allergen-friendly meals.
    You can view the full menu on our school website or pick up a printed copy from the main office.
    If your child has specific dietary requirements, please contact the school office.
    Thank you,
    School Administration",
    created_at: Date.new(2025, 11, 7)
  },
  {
    category: "Event",
    title: "Winter Choir Concert",
    content: "All students will participate in the Winter Choir Concert. Please come enjoy the wonderful performance!",
    date: Date.new(2026, rand(1..4), rand(1..28)),
    start_time: "14:00:00",
    end_time: "15:30:00",
    created_at: Date.new(2025, 11, 19)
  },
  {
    category: "General",
    title: "New Library Books Arrived",
    content: "We are happy to announce that new books have been added to the school library. Students are encouraged to visit and explore!",
    created_at: Date.new(2025, 8, 17)
  },
  {
    category: "General",
    title: "Lost-and-Found Reminder",
    content: "Please check the lost-and-found box before the end of the month. Items not claimed will be donated.",
    created_at: Date.new(2025, 10, 17)
  },
  {
    category: "General",
    title: "School Closure Notice",
    content: "Due to maintenance, the school will be closed on December 3rd. Regular classes resume the following day.",
    created_at: Date.new(2025, 11, 3)
  },
  {
    category: "General",
    title: "PTA Newsletter November Edition",
    content: "The November PTA newsletter is now available on the school website. Please take a moment to read the updates.",
    created_at: Date.new(2025, 10, 17)
  },
  {
    category: "General",
    title: "Winter Uniform Reminder",
    content: "Starting December 1st, students should wear winter uniforms. Please ensure your child is properly dressed.",
    created_at: Date.new(2025, 11, 1)
  },
  {
    category: "Event",
    title: "Sports Day Practice",
    content: "Students will have Sports Day rehearsals next week. Please ensure they bring water bottles and wear comfortable shoes.",
    date: Date.new(2020 + rand(5..6), rand(1..12), rand(1..28)),
    start_time: "08:00:00",
    end_time: "09:00:00",
    created_at: Date.new(2025, 10, 17)
  },
  {
    category: "General",
    title: "New Cafeteria Menu",
    content: "Our cafeteria menu will change next month. Healthier options and more variety will be added.",
  },

  {
    category: "General",
    title: "Parent-Teacher Meeting Reminder",
    content: "Parent-teacher meetings will be held next week. Please check your child's class schedule for details.",
  },

  {
    category: "General",
    title: "After-School Program Registration",
    content: "Registrations for the after-school program are now open. Please sign up through the school website.",
  },

  {
    category: "General",
    title: "Holiday Break Notice",
    content: "The school will be closed for winter holiday from December 24 to January 4. Enjoy your break!",
  },

  {
    category: "General",
    title: "New Safety Rules on Campus",
    content: "New safety policies have been implemented. Please review the updated rules on the school website.",
  },
  {
    category: "Event",
    title: "All Grades End-of-Term Class Party",
    content: "To celebrate the end of the first term, classes will have small parties in their classrooms. Students may play simple games, share reflections, and write messages for classmates. Please note that we will not exchange food items, so no snacks are necessary.",
    date: Date.new(2025, 12, rand(1..5)),
    start_time: "13:00:00",
    end_time: "14:30:00",
    created_at: Date.new(2025, 6, 17)
  },
  {
    category: "Event",
    title: "All Grades Summer Reading Kickoff",
    content: "Before the summer break, the library will introduce a Summer Reading Challenge. Students will receive a simple reading log and suggested book list. The goal is to enjoy reading regularly during the holidays. Families can help by setting aside quiet reading time at home.",
    date: Date.new(2020 + rand(5..6), rand(1..12), rand(1..28)),
    start_time: "09:20:00",
    end_time: "10:10:00",
    created_at: Date.new(2025, 6, 19)
  },

  {
    category: "Event",
    title: "All Grades Back-to-School Assembly",
    content: "After the summer holiday, we will reopen the term with a Back-to-School Assembly. The principal and teachers will share messages about safe learning, kindness, and goals for the new term. Students will also review important school routines together.",
    date: Date.new(2020 + rand(5..6), rand(1..12), rand(1..28)),
    start_time: "09:00:00",
    end_time: "10:00:00"
  },

  {
    category: "Event",
    title: "All School Autumn Sports Day",
    content: "Our Autumn Sports Day will take place on the school field. Students from all grades will join simple races, relays, and group exercises. Families are welcome to watch from the designated area. Please prepare hats, water bottles, and check the weather forecast in advance.",
    date: Date.new(2020 + rand(5..6), rand(1..12), rand(1..28)),
    start_time: "09:00:00",
    end_time: "12:00:00",
    created_at: Date.new(2025, 8, 14)
  },

  {
    category: "Event",
    title: "All Grades Respect for the Aged Day Letters",
    content: "To mark Respect for the Aged Day, students will write letters or draw pictures for older family members or community residents. Teachers will guide students in expressing thanks and sharing kind messages. Families may choose how to deliver the letters after the event.",
    date: Date.new(2020 + rand(5..6), rand(1..12), rand(1..28)),
    start_time: "10:00:00",
    end_time: "11:00:00",
    created_at: Date.new(2025, 8, 12)
  },
  {
    category: "Event",
    title: "All Grades Art and Music Showcase",
    content: "Classes will display selected artworks and perform short music pieces in an Art and Music Showcase. Families can walk through the displays and enjoy performances in small groups. We hope this event highlights students’ creativity across different subjects.",
    date: Date.new(2020 + rand(5..6), rand(1..12), rand(1..28)),
    start_time: "14:00:00",
    end_time: "15:30:00",
    created_at: Date.new(2025, 9, 17)
  },

  {
    category: "Event",
    title: "All School Autumn Safety Week Assembly",
    content: "During Autumn Safety Week, we will hold an assembly to review road safety, safe use of bicycles, and ways to stay visible in the darker months. Please discuss safe commuting habits with your child and check that any bicycle lights or reflectors at home are working well.",
    date: Date.new(2020 + rand(5..6), rand(1..12), rand(1..28)),
    start_time: "09:00:00",
    end_time: "09:45:00",
    created_at: Date.new(2025, 9, 16)
  }
]

schools.each do |school_name|
  school = School.create!(name: school_name)

  5.times do
    school_notice = Notice.new(notices_general.sample)
    school_notice.school = school
    school_notice.save!
  end

  classrooms = ("A".."D").to_a

  6.times do |grade|
    grade += 1
    teacher = User.create!(
      email: "teacher_#{grade}@#{school_name.downcase}.com",
      password: "123456",
      first_name: "Teacher",
      last_name: surnames.sample,
      role: "teacher",
      school: school
    )
    classrooms.each do |classroom_name|
      classroom = Classroom.create!(grade: grade.to_s, name: classroom_name, school: school, user: teacher)

      2.times do
        notice_classroom = Notice.new(notices_for_classroom.sample)
        notice_classroom.title = "#{grade} #{classroom_name} Party"
        notice_classroom.classroom = classroom
        notice_classroom.school = school
        notice_classroom.save!
      end
    end
  end
end


parent1 = User.create!(
  email: "parent@meguro.com",
  first_name: "Parent",
  last_name:"Sato",
  password: "123456",
)

school = School.all.sample

Student.create!(
  user: parent1,
  school: school,
  classroom: Classroom.find_by(grade: "3", name: "A", school: school),
  name: parent1.last_name
)

puts "done!"
