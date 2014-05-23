# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


u1 = User.create!(
  first_name: "Andrey",
  last_name: "Azov",
  password: "password",
  password_confirmation: "password",
  biography: "Originally from Moscow, Russia. Came to GA to seek fortune",
  email: "andrey@example.com",
  role: "admin"
)

u2 = User.create!(
  first_name: "Julien",
  last_name: "Deslangles-Blanch",
  password: "password",
  password_confirmation: "password",
  biography: "After a stint in diplomacy, Julien spent a few years advising multinationals on how to successfully expand their activities in Asia. While working with exciting tech companies on equally exciting projects, he decided to make a full transition into the tech field. A tech aficionado, lifelong expat and hot chocolate enthusiast, Julien loves languages; as if speaking a whole bunch of them wasn't enough, Julien joined WDI to learn a few more - this time of the programming type. And he's had such a great time coding that he will be back to teach the next WDI at General Assembly.",
  email: "julien@example.com",
  role: "producer"
)

u3 = User.create!(
  first_name: "Geraud",
  last_name: "Mathe",
  password: "password",
  password_confirmation: "password",
  biography: "Geraud is a developer working with Ruby, Rails and recently Ember. Originally from Paris, Geraud worked as a freelance developer for three years (creating his own developer training program in the process) before joining General Assembly to teach WDI.",
  email: "gerry@example.com",
  role: "instructor"
)

u4 = User.create!(
  first_name: "Matt",
  last_name: "Studdert",
  password: "password",
  password_confirmation: "password",
  biography: "Matt came to WDI to acquire technological skills that will help him to create a successful startup.",
  email: "matt@somewhere.co.uk",
  role: "student"
)

u5 = User.create!(
  first_name: "Jane",
  last_name: "Doe",
  password: "password",
  password_confirmation: "password",
  biography: "Jane is a completely fictional character, because I need can't remember the name of the real producer of UXDI-LDN.",
  email: "jane@somewhere.co.uk",
  role: "producer"
)

u6 = User.create!(
  first_name: "Caroline",
  last_name: "Hughes",
  password: "password",
  password_confirmation: "password",
  biography: "Caroline will help me to test enrollments.",
  email: "caroline@somewhere.co.uk",
  role: "student"
)

u7 = User.create!(
  first_name: "Yasmin",
  last_name: "Razavi",
  password: "password",
  password_confirmation: "password",
  biography: "Caroline will help me to test enrollments.",
  email: "yasmin@somewhere.co.uk",
  role: "student"
)

p1 = Program.create!(
  name: "Web Development Immersive",
  description: 'Build a work-ready skill set and fluency in full stack web development. Develop a portfolio of projects individually and in small teams that are ready to present to employers. Prepare for an internship or entry-level job as a junior web developer. <a href="https://generalassemb.ly/education/web-development-immersive">Learn more...</a>'
)

p2 = Program.create!(
  name: "User Experience Design Immersive",
  description: 'Apply fundamental UX skills to several hands-on projects in order to build up your design portfolio. Learn from and connect with some of the top UX practitioners in the field, from guest speakers to your instructional team. Prepare for an internship or entry-level job as a junior user experience designer. <a href="https://generalassemb.ly/education/user-experience-design-immersive">Learn more...</a>'
)

p3 = Program.create!(
  name: "Back-End Web Development",
  description: 'Learn the fundamentals of an object-­oriented programming language (Ruby). Complement front-­end skills by building functional web applications using Rails. Implement your web applications using database solutions. <a href="https://generalassemb.ly/education/back-end-web-development">Learn more...</a>'
)

p4 = Program.create!(
  name: "Data Science",
  description: 'Applying your math and programming skills to make meaning out of large data sets. Learning how to analyze and manipulate data with Python. Learning how to make predictions about data using fundamental modeling techniques that will help you make better informed business decisions. <a href="https://generalassemb.ly/education/data-science">Learn more...</a>'
)

loc1 = Location.create!(
  name: "London",
  address: "9 Back Hill, 4F, EC1R 5EN",
  abbreviation: "LDN"
)

loc2 = Location.create!(
  name: "New York City",
  address: "Somewhere in New York, hard to find",
  abbreviation: "NYC"
)

loc4 = Location.create!(
  name: "Atlanta",
  address: "Somewhere in Atlanta, hard to find",
  abbreviation: "ATL"
)

loc5 = Location.create!(
  name: "Berlin",
  address: "Somewhere in Berlin, hard to find",
  abbreviation: "ATL"
)

loc6 = Location.create!(
  name: "Boston",
  address: "Somewhere in Boston, hard to find",
  abbreviation: "BST"
)

loc7 = Location.create!(
  name: "Hong Kong",
  address: "Somewhere in Hong Kong, hard to find",
  abbreviation: "HKG"
)

loc8 = Location.create!(
  name: "Los Angeles",
  address: "Somewhere in Los Angeles, hard to find",
  abbreviation: "LA"
)

loc9 = Location.create!(
  name: "Melbourne",
  address: "Somewhere in Melbourne, hard to find",
  abbreviation: "MLB"
)

loc10 = Location.create!(
  name: "San Francisco",
  address: "Somewhere in San Francisco, hard to find",
  abbreviation: "SF"
)

loc11 = Location.create!(
  name: "Seattle",
  address: "Somewhere in Seattle, hard to find",
  abbreviation: "STL"
)

loc12 = Location.create!(
  name: "Sydney",
  address: "Somewhere in Sydney, hard to find",
  abbreviation: "SDN"
)

loc13 = Location.create!(
  name: "Washington D.C.",
  address: "Somewhere in Washington D.C., hard to find",
  abbreviation: "WSH"
)

cls1 = Classroom.create!(
  name: "Room 3",
  size: 30,
  location_id: loc1.id
)

crs1 = Course.create!(
  name: "WDI_LDN",
  program_id: p1.id,
  location_id: loc1.id,
  producer_id: u2.id
  )

crs2 = Course.create!(
  name: "UXDI_LDN",
  program_id: p2.id,
  location_id: loc1.id,
  producer_id: u5.id
  )

crs3 = Course.create!(
  name: "WDI_NYC",
  program_id: p1.id,
  location_id: loc2.id,
  producer_id: u5.id
  )

cht1 = Cohort.create!(
  name: "WDI_LDN_6",
  course_id: crs1.id,
  start_date: Date.new(2014,04,21),
  end_date: Date.new(2014,07,11)
)

cht2 = Cohort.create!(
  name: "WDI_LDN_5",
  course_id: crs1.id,
  start_date: Date.new(2014,03,31),
  end_date: Date.new(2014,06,22)
)

cls1 = Classroom.create!(
  name: "Room 2",
  size: 30,
  location_id: loc1.id
)

b1 = Booking.create!(
  cohort_id: cht1.id,
  classroom_id: cls1.id,
  start_date: Date.new(2014,04,21),
  end_date: Date.new(2014,07,11)
)

e1 = Enrollment.create!(
  cohort_id: cht1.id,
  student_id: u4.id,
  prework_done: true,
  paid: true
)

ta1 = TeachingAssignment.create!(
  cohort_id: cht1.id,
  instructor_id: u3.id,
  negotiated_rate: 3000
)