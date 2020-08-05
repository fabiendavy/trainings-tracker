class AddDateToTrainings < ActiveRecord::Migration[6.0]
  def change
    add_column :trainings, :date, :date
  end
end
