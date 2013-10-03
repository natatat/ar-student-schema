require_relative '../config'

class UpdateStudents < ActiveRecord::Migration
  def change
    change_table :students do |t|
      t.remove :teacher_id
      

    end
  end
end

class UpdateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone

    end
  end
end

class CreateJoinTableClasses < ActiveRecord::Migration
  def change
    create_join_table :students, :teachers, table_name: :classes
  end
end

                                         # do |t|
      # t.index [:student_id, :teacher_id]
      # t.index [:teacher_id, :student_id]
