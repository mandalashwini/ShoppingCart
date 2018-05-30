class AddMobilenumberColumnToStudent < ActiveRecord::Migration[5.1]
  def change
    add_column :students, :mobilenumber, :string
  end
end
