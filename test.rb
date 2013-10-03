
require_relative 'app/models/teacher'
require_relative 'app/models/student'

##### VALIDATION TESTS

# # not unique email
# teacher = Teacher.new(first_name: 'Charlie', email: 'milton@beer.name')
# if !teacher.save
#   p teacher.errors
# end

# # invalid email format
# student = Student.new(first_name: 'Benny', last_name: 'Freid', gender: 'm', birthday: '1990-03-24', email: 'aawekughawekjg', phone: '234-234-9853')
# if !student.save
#   p student.errors
# end

# # invalid phone number
# student = Student.new(first_name: 'Jane', last_name: 'Freid', gender: 'f', birthday: '1990-03-24', email: 'jane@whatever.com', phone: '234-234-853')
# if !student.save
#   p student.errors
# end

##### STUDENT/TEACHER TESTS

# .join method?
# Student.where(teacher_id: teacher_id)
# Teacher.joins(:students).where(students: {teacher_id: teacher_id})

# # given a student, find a teacher (using .where => returns an array)
# jon = Student.where(first_name: 'Jonathan')
# jon_teacher_id = jon[0].teacher_id
# jon_teacher = Teacher.where(id: jon_teacher_id)
# puts "Jonathan's teacher is: #{jon_teacher[0].first_name}"

# # given a student, find a teacher (using .find_by => returns an ActiveRecord object)
# jon = Student.find_by first_name: 'Jonathan'
# jon_teacher_id = jon.teacher_id
# jon_teacher = Teacher.find_by id: jon_teacher_id
# puts "Jonathan's teacher is: Dr. #{jon_teacher.last_name}"

# find all of a teacher's students (using .find(id) => returns an ActiveRecord object)
(1..9).each do |n|
  teacher = Teacher.find(n)
  students = Student.where(teacher_id: n) # => returns an array of all the students belonging to the teacher
  students_names = []
  students.each { |student| students_names << "#{student.first_name} #{student.last_name}" }

  puts "Dr. #{teacher.last_name}'s students:"
  puts students_names
  puts ""
end
# how do I split up the students more evenly amongst the teachers
