class CreateAdminUsersPagesJoin < ActiveRecord::Migration[6.1]
  def up
    #Adding this table for MANY-TO-MANY relation: admin_users and pages
    #In many-to-many relation: we have to have 1 table in common which will have foreign_keys for both tables and those columns also need to be indexed.
    # RAILS convention is : JOIN table name should be : "first_table_name + last_table_name" both in plural form.
    create_table :admin_users_pages, id:false do |t|
      t.integer "admin_user_id"
      t.integer "page_id"
    end
    add_index("admin_users_pages",["admin_user_id","page_id"])
  end

  def down
    drop_table :admin_users_pages
  end
end
