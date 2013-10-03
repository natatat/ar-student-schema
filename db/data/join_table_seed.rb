require_relative '../../app/models/studentsteacher'
require_relative '../../app/models/student'
require_relative '../../app/models/teacher'

# populate the join table classes!
# each student has 6 teachers. should not repeat teachers
# for each student, assign them teachers 6 times.

6.times do
  Student.all.each do |student|
    StudentsTeacher.create(student_id: student.id, teacher_id: rand(1..9))
  end
end

# teachers = []
# Teacher.all.each do |teacher|
#   teachers << teacher
#   end

# Student.all.each do |student|
#   teachers.shuffle!
#   StudentsTeacher.new(student_id: student.id, teacher_id: teachers[1].id)
# end
