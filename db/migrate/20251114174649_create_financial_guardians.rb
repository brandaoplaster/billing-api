class CreateFinancialGuardians < ActiveRecord::Migration[8.0]
  def change
    create_table :financial_guardians do |t|
      t.string :name, null: false
      t.string :cpf, null: false

      t.timestamps
    end

    add_index :financial_guardians, :cpf, unique: true
  end
end
