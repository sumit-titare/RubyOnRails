class CreateAirlines < ActiveRecord::Migration[6.1]
  def up
    create_table :airlines do |t|
      t.string :name
      t.string :image_url
      t.string :slug

      t.timestamps
    end
  end

  def down
    drop_table :airlines
  end
end
