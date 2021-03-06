class CreateTransactions < ActiveRecord::Migration[5.1]
  def change
    create_table :transactions do |t|
      t.references :invoice, foreign_key: true
      t.bigint :credit_card_number
      t.string :result
      t.datetime :created_at
      t.datetime :updated_at

      t.timestamps
    end
  end
end
