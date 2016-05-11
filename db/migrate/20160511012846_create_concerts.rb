class CreateConcerts < ActiveRecord::Migration
  def change
    create_table :concerts do |t|
      t.string :artist
      t.string :genre
      t.date :concert_date
      t.string :city
      t.string :state

      t.timestamps null: true
    end
  end
end
