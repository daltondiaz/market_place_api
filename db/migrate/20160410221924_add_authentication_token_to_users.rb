class AddAuthenticationTokenToUsers < ActiveRecord::Migration
  def change
    add_column :users, :auth_token, :string, default: ""
    # add unique key condition
    add_index :users, :auth_token, unique: true
  end
end
