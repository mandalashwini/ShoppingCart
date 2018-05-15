class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :mobile_number
      t.string :email_id
      t.string :password

      t.timestamps null: false
    end
  end
end
