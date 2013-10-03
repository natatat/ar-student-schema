require_relative '../config'

class CreateJoinTableStudentTeachers < ActiveRecord::Migration
  def change
    drop_table :classes
    create_join_table :teachers, :students
  end
end
