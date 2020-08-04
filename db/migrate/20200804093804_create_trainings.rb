class CreateTrainings < ActiveRecord::Migration[6.0]
  def change
    create_table :trainings do |t|
      t.string :sport
      t.float :distance
      t.string :time
      t.integer :ascending_elevation
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
