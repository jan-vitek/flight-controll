class AddFieldnameToTablename3 < ActiveRecord::Migration
  def change
    add_column :tablename3s, :fieldname, :string
  end
end
