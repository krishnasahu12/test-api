class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.integer :password
      t.integer :confirm_password

      t.timestamps
    end
  end
end
