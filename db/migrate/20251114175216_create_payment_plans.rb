class CreatePaymentPlans < ActiveRecord::Migration[8.0]
  def change
    create_table :payment_plans do |t|
      t.references :financial_guardian, null: false, foreign_key: true
      t.references :cost_center, null: false, foreign_key: true

      t.timestamps
    end

    add_index :payment_plans, [ :financial_guardian_id, :cost_center_id ], unique: true, name: "index_payment_plans_on_guardian_and_cost_center"
  end
end
