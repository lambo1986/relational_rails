class CreateSynthesizer < ActiveRecord::Migration[7.0]
  def change
    create_table :synthesizers do |t|
      t.integer :musician_id
      t.string :brand
      t.string :name
      t.integer :year
      t.string :engine
      t.integer :value
      t.integer :voice_count
      t.boolean :vintage

      t.timestamps
    end
  end
end
