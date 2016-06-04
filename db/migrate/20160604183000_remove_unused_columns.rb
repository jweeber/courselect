class RemoveUnusedColumns < ActiveRecord::Migration
  def change
    remove_column :courses, :completed, :boolean
    remove_column :courses, :to_take, :boolean
  end
end
