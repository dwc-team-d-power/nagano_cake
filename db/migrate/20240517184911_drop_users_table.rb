class DropUsersTable < ActiveRecord::Migration[6.1]
 def up
    drop_table :users
 end

 def down
    create_table :users do |t|
      t.string :email, null: false
      t.string :encrypted_password, null: false
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :first_name_kana, null: false
      t.string :last_name_kana, null: false
      t.string :postal_code, null: false
      t.text :address, null: false
      t.string :phone_number, null: false
      t.boolean :is_deleted, default: false, null: false
      t.string :reset_password_token
      t.datetime :reset_password_sent_at
      t.datetime :remember_created_at
      t.datetime :created_at, precision: 6, null: false
      t.datetime :updated_at, precision: 6, null: false
    end
 end
end