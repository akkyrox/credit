class CreateSharedPhones < ActiveRecord::Migration
  def change
    create_table :shared_phones do |t|
      t.integer :user_id
      t.string :phone
      t.timestamps
    end
  end
end
