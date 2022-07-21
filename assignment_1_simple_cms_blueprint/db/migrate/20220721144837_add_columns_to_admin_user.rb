class AddColumnsToAdminUser < ActiveRecord::Migration[6.1]
#Password is stored in "password_digest" column by default by : bcrypt gem => (has_secure_password)
  def up
    add_column "admin_users", "password_digest", :string
  end

  def down
    remove_column "admin_users", "password_digest"
  end
end
