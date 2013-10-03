require_relative '../config'

class RemoveStudentsTeachers < ActiveRecord::Migration
  def change
    drop_table :students_teachers
  end
end
