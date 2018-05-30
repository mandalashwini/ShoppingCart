class RemoveUserReferencesToOrder < ActiveRecord::Migration
  def change
    remove_column :orders, :user, :string
  end
end
