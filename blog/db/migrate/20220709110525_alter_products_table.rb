class AlterProductsTable < ActiveRecord::Migration[6.1]


  def up
    rename_table("products", "ecommerce_products")
    add_column("ecommerce_products", "product_merchant", :string, limit:50)
    change_column("ecommerce_products", "active", :boolean, default: false)
    rename_column("ecommerce_products", "active", "product_status")
    puts "*** Adding INDEX ***"
    add_index("ecommerce_products","product_name")
  end

#Both these methods have to be mirror images of each other

  def down
      puts "*** Removing INDEX ***"
      remove_index("ecommerce_products","product_name")
      rename_column("ecommerce_products", "product_status", "active")
      change_column("ecommerce_products", "active",  :boolean, default: true)
      remove_column("ecommerce_products", "product_merchant")
      rename_table("ecommerce_products","products")
  end
end
