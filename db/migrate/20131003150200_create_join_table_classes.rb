require_relative '../config'

class CreateJoinTableClasses < ActiveRecord::Migration
  def change
    change_table :students do |t|
      t.remove :teacher_id
    end

    create_table :classes do |t|
      t.belongs_to :teacher
      t.belongs_to :student
      t.timestamps
    end
  end
end
