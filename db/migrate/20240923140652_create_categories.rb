class CreateCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :categories do |t|
      t.string :title, null: false
      t.string :points, array: true, default: [], null: false

      t.timestamps
    end
  end
end
