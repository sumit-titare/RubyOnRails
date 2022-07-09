class CreateProducts < ActiveRecord::Migration[6.1]


#RAILS by default generate this migration for you:
#change() method is a short hand version on up() and down(). That means rails will auto generate the counter part of migration.
#For ex: if we are adding products table, it will automatically have down() part of it.
  # def change
  #   create_table :products do |t|
  #
  #     t.timestamps
  #   end
  # end


  def up
    create_table :products do |t|
    t.column "product_name", :string, limit: 50 #This is one way to define column

    t.string "product_description" #This is a short hand versions
    #We can also add column options to this:
    # limit: size ,
    # precision: number,
    # defualt: value ,
    # null: true/false
    # scale: number

    t.float "product_price", default: 0.0 , null: false
    t.boolean "active", default: true

    t.timestamps #This is handled by RAILS (created_at, updated_at)
    end
  end

  def down
    drop_table :products
  end
end


###############################################################################
# SOME RAILS COMMABND FOR DB MIGRATION:
#
# rails db:migrate
# rails db:migrate:status  => Shows status of all migrations
# rails db:migrate VERSION=0 => Runs down() migration in reverse order
