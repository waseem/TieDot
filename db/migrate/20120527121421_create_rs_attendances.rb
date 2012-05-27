class CreateRsAttendances < ActiveRecord::Migration
  def change
    create_table :rs_attendances do |t|
      t.integer :rs_session_id
      t.integer :rs_member_id
      t.timestamps
    end
  end
end
