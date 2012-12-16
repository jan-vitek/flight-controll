class ChangeEndToDatetime < ActiveRecord::Migration
  def change
     change_column :pilots, :end, :datetime
  end
end
