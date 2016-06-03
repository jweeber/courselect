class AddCompletedAndToTake < ActiveRecord::Migration
  def change
    add_column :courses, :completed, :boolean, default: false
    add_column :courses, :to_take, :boolean, default: false
  end
end
