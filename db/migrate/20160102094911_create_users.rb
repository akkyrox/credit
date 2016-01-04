class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :phone
      t.string :email
      t.text :address
      t.string :password_digest

      t.timestamps
    end
  end
end
