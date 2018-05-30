class CreateStudents < ActiveRecord::Migration[5.1]
  def change
    create_table :students do |t|
      t.string :firstname
      t.string :lastname
      t.string :emailid
      t.date :date_of_birth
      t.string :gender
      t.string :password
      t.string :confirm_password

      t.timestamps
    end
  end
end
