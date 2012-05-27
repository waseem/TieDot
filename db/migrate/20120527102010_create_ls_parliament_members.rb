class CreateLsParliamentMembers < ActiveRecord::Migration
  def change
    create_table :ls_parliament_members do |t|
      t.integer :ls_parliament_id
      t.integer :division_id
      t.string  :state
      t.string :name

      t.timestamps
    end
  end
end
