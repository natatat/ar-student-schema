require_relative '../../db/config'

class StudentsTeacher < ActiveRecord::Base
  validates_uniqueness_of :teacher_id, :scope => :student_id

  belongs_to :student
  belongs_to :teacher
end
