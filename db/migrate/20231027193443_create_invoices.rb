class CreateInvoices < ActiveRecord::Migration[7.0]
  def change
    create_table :invoices do |t|
      t.references :patient, foreign_key: { on_delete: :nullify }
      t.string :description
      t.float :total_amount
      t.float :copayment

      t.timestamps
    end
  end
end
