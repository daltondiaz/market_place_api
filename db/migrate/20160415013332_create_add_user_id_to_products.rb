class CreateAddUserIdToProducts < ActiveRecord::Migration
  def change
    create_table :add_user_id_to_products do |t|
      t.integer :user_id

      t.timestamps
    end
    add_index :add_user_id_to_products, :user_id
  end
end
