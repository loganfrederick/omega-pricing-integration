class InitialSchema < ActiveRecord::Migration
  def change
    create_table :products, primary_key: :product_id do |t|
      t.integer :external_product_id
      t.decimal :price
      t.string :product_name

      t.column :created_at, 'timestamp with time zone'
      t.column :updated_at, 'timestamp with time zone'
    end

    create_table :past_price_records, primary_key: :past_price_record_id do |t|
      t.integer :product_id
      t.decimal :price
      t.decimal :percentage_change

      t.column :created_at, 'timestamp with time zone'
      t.column :updated_at, 'timestamp with time zone'
    end
  end
end
