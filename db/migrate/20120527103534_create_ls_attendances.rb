class CreateLsAttendances < ActiveRecord::Migration
  def change
    create_table :ls_attendances do |t|
      t.string :ls_parliament_member_id
      t.boolean :status

      t.timestamps
    end
  end
end
