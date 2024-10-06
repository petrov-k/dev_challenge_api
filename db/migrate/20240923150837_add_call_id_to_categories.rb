class AddCallIdToCategories < ActiveRecord::Migration[7.1]
  def change
    add_reference :categories, :call, null: false, foreign_key: true
  end
end
