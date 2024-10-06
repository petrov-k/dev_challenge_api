class AllowCallIdToBeNullOnCategories < ActiveRecord::Migration[7.1]
  def change
    change_column_null :categories, :call_id, true
  end
end
