class CreatePilots < ActiveRecord::Migration
  def change
    create_table :pilots do |t|
      t.datetime :begin
      t.datetime :end
      t.string :pilot
      t.string :note

      t.timestamps
    end
  end
end
