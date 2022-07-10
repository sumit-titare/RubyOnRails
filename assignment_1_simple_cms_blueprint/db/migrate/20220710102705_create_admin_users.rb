class CreateAdminUsers < ActiveRecord::Migration[6.1]
  def up
    create_table :admin_users do |t|
      t.string "username"
      t.string "first_name"
      t.string "last_name"
      t.timestamps
    end
  end

  def down
    drop_table :admin_users
  end
end
