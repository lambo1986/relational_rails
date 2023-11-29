class Musician < ActiveRecord::Migration[7.0]
  def change
    create_table :musicians do |m|
      m.string :name
      m.integer :age
      m.string :genre
      m.boolean :active

      m.timestamps
    end
  end
end
