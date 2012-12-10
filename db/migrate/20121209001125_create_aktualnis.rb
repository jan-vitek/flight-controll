class CreateAktualnis < ActiveRecord::Migration
  def change
    create_table :aktualnis do |t|
      t.datetime :begin
      t.string :pilot

      t.timestamps
    end
  end
end
