class AddFieldnameToTablename2 < ActiveRecord::Migration
  def change
    change_column :pilots, :end, :datetime
  end
end
