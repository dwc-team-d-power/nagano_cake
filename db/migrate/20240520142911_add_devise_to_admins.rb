class AddDeviseToAdmins < ActiveRecord::Migration[6.1]
  def up
    change_table :admins do |t|
      # t.string :email,              null: false, default: "" # 既に存在するためコメントアウト
      # t.string :encrypted_password, null: false, default: "" # 既に存在するためコメントアウト

      # t.string   :reset_password_token
      # t.datetime :reset_password_sent_at
      # t.datetime :remember_created_at
      # t.integer  :sign_in_count, default: 0, null: false
      # t.datetime :current_sign_in_at
      # t.datetime :last_sign_in_at
      # t.string   :current_sign_in_ip
      # t.string   :last_sign_in_ip

      # t.timestamps null: false
    end

    # add_index :admins, :email,                unique: true
    # add_index :admins, :reset_password_token, unique: true
  end

  def down
    change_table :admins do |t|
      # t.remove :encrypted_password # 既に存在するためコメントアウト
      # t.remove :reset_password_token, :reset_password_sent_at, :remember_created_at,
      #          :sign_in_count, :current_sign_in_at, :last_sign_in_at, :current_sign_in_ip, :last_sign_in_ip
    end
  end
end