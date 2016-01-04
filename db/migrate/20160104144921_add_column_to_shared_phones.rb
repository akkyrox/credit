class AddColumnToSharedPhones < ActiveRecord::Migration
  def change
    add_column :shared_phones, :status, :boolean
    add_column :shared_phones, :credit_given, :integer
  end
end
