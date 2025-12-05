ReadNotification.destroy_all
Classroom.destroy_all
Notice.destroy_all
User.destroy_all
School.destroy_all


puts "Creating seeds"

# Notice Templates (will be created for each school)
NOTICE_TEMPLATES = [
  {
    category: "Event",
    title: "Field Trip Permission",
    content: "Dear Parents,

We are planning a **field trip** for our class. Please review the details below and sign the permission slip.

## Trip Details

- **Destination:** *[Enter destination]*
- **Date:** *[Enter date]*
- **Departure Time:** *[Enter time]*
- **Return Time:** *[Enter time]*

## What to Bring

- Packed lunch and water bottle
- Comfortable walking shoes
- Weather-appropriate clothing

---

Please return the signed permission slip by **[deadline date]**.

*Thank you for your support!*"
  },
  {
    category: "General",
    title: "Parent-Teacher Conference",
    content: "Dear Parents,

We would like to invite you to our upcoming **Parent-Teacher Conference** to discuss your child's progress.

## Conference Details

- **Date:** *[Enter date]*
- **Time Slots Available:** *[Enter available times]*
- **Location:** *[Enter location/classroom]*

## Topics to Discuss

1. Academic progress
2. Social development
3. Areas for improvement
4. Goals for the upcoming term

---

Please reply to confirm your preferred time slot.

*We look forward to meeting with you!*"
  },
  {
    category: "Event",
    title: "School Event Invitation",
    content: "Dear Parents,

You are cordially invited to attend our upcoming **school event**!

## Event Details

- **Event Name:** *[Enter event name]*
- **Date:** *[Enter date]*
- **Time:** *[Enter start time] - [Enter end time]*
- **Location:** *[Enter location]*

## What to Expect

- Student performances
- Activities and games
- Refreshments

---

We hope to see you there!

*Warm regards,*
**[Teacher Name]**"
  },
  {
    category: "General",
    title: "Homework and Study Tips",
    content: "Dear Parents,

Here are some helpful tips to support your child's learning at home.

## Daily Homework Routine

- Set a consistent time and quiet place for homework
- Review assignments together when needed
- Encourage breaks every **20-30 minutes**

## Reading at Home

- Read together for at least **15 minutes** daily
- Discuss the story and ask questions
- Visit the library regularly

## Upcoming Assignments

- *[List any upcoming projects or tests]*

---

Please reach out if you have any questions about your child's homework.

*Best regards,*
**[Teacher Name]**"
  },
  {
    category: "General",
    title: "Classroom Supply Request",
    content: "Dear Parents,

We are running low on some classroom supplies and would appreciate any donations.

## Items Needed

- Tissues
- Hand sanitizer
- Colored pencils
- Glue sticks
- Construction paper

## Optional Donations

- Board games for indoor recess
- Books for classroom library

---

*Any contribution, big or small, is greatly appreciated!*

Thank you for your continued support.

*Best regards,*
**[Teacher Name]**"
  }
]

schools = ["Sunrise", "Harmony", "Evergreen"]
surnames = ["Sato", "Suzuki", "Tanaka", "Yamada", "Ueno"]
first_names = ["Ken", "Taro","Hiroshi", "Makoto", "Yuko", "Yuki", "Isao", "Kenichi"]
notices_for_classroom = [
  {
    title: "{{classroom}} Party",
    category: "Event",
    content: "Dear Parents, we are excited to invite you to our upcoming class party! This will be a fun-filled afternoon with games, snacks, and activities.
              Time: 1:00 PM - 3:00 PM
              Please let us know if you can volunteer to help with: Bringing snacks Setting up decorations Organizing games
              We look forward to celebrating together!
              Ms. Johnson",
    start_time: "13:30:00",
    end_time: "14:30:00"
  },
  {
    title: "Morning Assembly {{classroom}}",
    category: "Event",
    content: "Hello Parents, our Grade {{classroom}} class will have a special morning assembly. Students will perform songs and short skits. Please join us if you can!",
    start_time: "09:00:00",
    end_time: "10:00:00"
  },
  {
    title: "Science Fair {{classroom}}",
    category: "Event",
    content: "We're excited to announce the annual Science Fair for Grade {{classroom}}! Students will present projects they've been working on for weeks.",
    start_time: "13:00:00",
    end_time: "14:30:00"
  },
  {
    title: "Art Exhibition {{classroom}}",
    category: "Event",
    content: "Parents are invited to view the creative artwork made by Grade {{classroom}} students. Light refreshments will be served.",
    start_time: "10:00:00",
    end_time: "11:00:00"
  },
  {
    title: "Science Museum Trip {{classroom}}",
    category: "Event",
    content: "Grade {{classroom}} students will visit the city Science Museum. Please prepare packed lunches and comfortable walking shoes.",
    start_time: "08:30:00",
    end_time: "12:00:00",
  },
  {
    title: "Graduation Ceremony {{classroom}}",
    category: "Event",
    content: "We are proud to invite parents to the Grade {{classroom}} graduation ceremony. Let's celebrate the students achievements together.",
    start_time: "13:00:00",
    end_time: "14:00:00"
  },
  {
    title: "Winter Festival {{classroom}}",
    category: "Event",
    content: "Grade {{classroom}} students will host the Winter Festival featuring performances, games, and snack booths.",
    start_time: "10:00:00",
    end_time: "12:00:00"
  },
  {
    title: "Math Quiz {{classroom}}",
    category: "Event",
    content: "Grade {{classroom}} students will participate in fun math activities and problem-solving challenges!",
    start_time: "11:00:00",
    end_time: "12:00:00"
  },
  {
    title: "Summer Projects {{classroom}}",
    category: "Event",
    content: "Grade {{classroom}} will launch a small Summer Project where students choose a topic, collect information, and create a simple presentation. The teacher will explain expectations and share ideas. Families can support by talking with children about topics that interest them at home.",
    start_time: "09:30:00",
    end_time: "10:30:00"
  },
  {
    title: "Water Play Day {{classroom}}",
    category: "Event",
    content: "Grade {{classroom}} will have a Water Play Day in the school yard, weather permitting. Students will use small buckets and sprinklers under teacher supervision. Please send a towel, change of clothes, and a plastic bag for wet items. Sandals are not allowed for safety reasons.",
    start_time: "10:00:00",
    end_time: "11:00:00"
  },
  {
    title: "Summer Memory Sharing {{classroom}}",
    category: "Event",
    content: "Grade {{classroom}} will hold a Summer Memory Sharing circle in the classroom. Students may bring one photo or small object related to a summer experience and talk about it. This helps develop speaking skills and allows classmates to learn more about one another in a relaxed way.",
    start_time: "09:30:00",
    end_time: "10:30:00"
  },
  {
    title: "Autumn Nature Walk {{classroom}}",
    category: "Event",
    content: "Grade {{classroom}} will take a short Autumn Nature Walk near the school. Students will look for seasonal changes, collect safe natural items, and write short reflection sentences back in class. Comfortable walking shoes and a small bag for collected items are recommended.",
    start_time: "10:00:00",
    end_time: "11:30:00"
  },
  {
    title: "Autumn Storytime {{classroom}}",
    category: "Event",
    content: "Grade {{classroom}} will have a special Autumn Storytime in the classroom. The teacher will read seasonal picture books, and students will talk about their favorite scenes. This gentle activity supports listening skills, imagination, and enjoyment of books at a calm pace.",
    start_time: "09:20:00",
    end_time: "10:10:00"
  },
  {
    title: "Field Trip Briefing {{classroom}}",
    category: "Event",
    content: "Grade {{classroom}} will hold a Field Trip Briefing for students and parents. The teacher will explain the destination, schedule, what to bring, and behavior expectations. There will also be a short Q&A time so that families can feel prepared and ask about any concerns.",
    date: Date.new(2025, 10, 9),
    start_time: "18:00:00",
    end_time: "19:00:00"
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
    date: Date.new(2025, 12, 19),
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
  puts "#{school.name} School created"

  # Create notice templates for this school
  NOTICE_TEMPLATES.each do |template_attrs|
    Notice.create!(template_attrs.merge(school: school, is_template: true))
    puts "#{school.name} Template '#{template_attrs[:title]}' created"
  end

  notices_general.each_with_index do |attributes, i|
    school_notice = Notice.new(attributes)
    if school_notice.date
      if school_notice.title.include?("Summer") || school_notice.title.include?("Water")
        school_notice.date = school_notice.date.change(month: 9, year: 2026)
      elsif school_notice.title.include?("Autumn")
        school_notice.date = school_notice.date.change(month: 10, year: 2026)
      elsif school_notice.title.include?("Winter")
        school_notice.date = school_notice.date.change(month: 12, year: 2025)
      elsif school_notice.title.include?("Graduation")
        school_notice.date = school_notice.date.change(month: 3, year: 2026)
      end
      school_notice.created_at = school_notice.date.last_week
      if school_notice.date > Date.today
        school_notice.created_at = school_notice.created_at.change(year: 2025)
      end
    end
    school_notice.school = school
    school_notice.save!
    puts "#{school.name} General Notice ##{i + 1} created"
  end

  classrooms = ("A".."D").to_a

  6.times do |grade|
    grade += 1
    puts "#{school.name} Grade #{grade}..."
    teacher = User.create!(
      email: "teacher_#{grade}@#{school_name.downcase}.com",
      password: "123456",
      first_name: "Teacher",
      last_name: surnames.sample,
      role: "teacher",
      school: school
    )
    puts "#{school.name} Grade #{grade} teacher created"
    classrooms.each do |classroom_name|
      classroom = Classroom.create!(grade: grade.to_s, name: classroom_name, school: school, user: teacher)
      puts "#{school.name} #{classroom.grade}#{classroom.name} Grade created"

      notices_for_classroom.each_with_index do |attributes, i|
        puts "#{school.name} Grade #{grade}#{classroom_name} notice ##{i + 1} created"
        random_date = [Date.new(2025, rand(11..12), rand(1..20)), Date.new(2026, rand(1..6), rand(1..28))]
        notice_classroom = Notice.new(attributes)
        notice_classroom.title = notice_classroom.title.gsub('{{classroom}}', "#{grade}#{classroom_name}")
        notice_classroom.content = notice_classroom.content.gsub('{{classroom}}', "#{grade}#{classroom_name}")
        notice_classroom.date = random_date.sample
        if notice_classroom.title.include?("Summer") || notice_classroom.title.include?("Water")
          notice_classroom.date = notice_classroom.date.change(month: 9, year: 2026)
        elsif notice_classroom.title.include?("Autumn")
          notice_classroom.date = notice_classroom.date.change(month: 10, year: 2026)
        elsif notice_classroom.title.include?("Winter")
          notice_classroom.date = notice_classroom.date.change(month: 12, year: 2025)
        elsif notice_classroom.title.include?("Graduation")
          notice_classroom.date = notice_classroom.date.change(month: 3, year: 2026)
        end
        notice_classroom.created_at = notice_classroom.date.last_week
        if notice_classroom.date > Date.today
          notice_classroom.created_at = notice_classroom.created_at.change(year: 2025)
        end


        notice_classroom.classroom = classroom
        notice_classroom.school = school
        notice_classroom.save!
      end
    end
  end
end


sunrise = School.find_by(name: "Sunrise")
harmony = School.find_by(name: "Harmony")

parent1 = User.create!(
  email: "parent@sunrise.com",
  first_name: "Koni",
  last_name: "Tasuku",
  password: "123456",
)
puts "Parent account created"


Student.create!(
  user: parent1,
  school: sunrise,
  classroom: Classroom.find_by(grade: "3", name: "A", school: sunrise),
  name: parent1.last_name
)
puts "Student created"

Student.create!(
  user: parent1,
  school: harmony,
  classroom: Classroom.find_by(grade: "1", name: "B", school: harmony),
  name: parent1.last_name
)
puts "Student created"

puts "#{School.count} Schools created"


puts "#{Notice.where(classroom: nil).count} General Notices created"
puts "#{Notice.where(category: 'Event').count} Event Notices created"
puts "#{Student.count} Students created"
puts "#{User.where(role: 'parent').count} Parents account created"
puts "#{User.where(role: 'teacher').count} Teachers account created"

puts "#{Note.count} Notes created"

# Mark most notices as read for parent@sunrise.com, leaving only 5 unread
parent1_notices = parent1.parent_notices.order(created_at: :desc)
notices_to_mark_read = parent1_notices.offset(5) # Skip the first 5 (most recent), mark the rest as read

notices_to_mark_read.each do |notice|
  ReadNotification.create!(
    user: parent1,
    notification: notice,
    status: true
  )
end
puts "Marked #{notices_to_mark_read.count} notices as read for parent@sunrise.com (5 left unread)"

puts "done!"
