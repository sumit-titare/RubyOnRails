class CreateReviews < ActiveRecord::Migration[6.1]
  def up
    create_table :reviews do |t|
      t.string :title
      t.string :description
      t.integer :score
      t.belongs_to :airline, null: false, foreign_key: true #this will add index as well

      t.timestamps
    end
  end

  def down
    drop_table :reviews
  end
end
