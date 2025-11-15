class CreateCostCenters < ActiveRecord::Migration[8.0]
  def change
    create_table :cost_centers do |t|
      t.string :name, null: false
      t.text :description
      t.boolean :active, null: false, default: true

      t.timestamps
    end

    add_index :cost_centers, :name, unique: true
  end
end
