class AddRoleToUser < ActiveRecord::Migration[4.2]
  def change
    add_column(:users, :role, :integer, null: false, default: 0)
  end
end
