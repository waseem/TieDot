class CreateRsMembers < ActiveRecord::Migration
  def change
    create_table :rs_members do |t|
      t.string :division_number
      t.string :name
      t.string :state
      t.timestamps
    end
  end
end
