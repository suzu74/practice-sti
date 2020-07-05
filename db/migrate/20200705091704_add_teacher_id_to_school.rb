class AddTeacherIdToSchool < ActiveRecord::Migration[5.2]
  def change
    add_reference :schools, :student, foreign_key: true
    add_reference :schools, :teacher, foreign_key: true
  end
end
