class CreateCalls < ActiveRecord::Migration[7.1]
  def change
    create_table :calls do |t|
      t.string :name
      t.string :location
      t.string :emotional_tone
      t.text :text

      t.timestamps
    end
  end
end
