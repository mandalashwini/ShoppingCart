class RemoveEmailIdFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :email_id, :string
  end
end
