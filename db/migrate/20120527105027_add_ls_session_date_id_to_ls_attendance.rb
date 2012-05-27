class AddLsSessionDateIdToLsAttendance < ActiveRecord::Migration
  def change
    add_column :ls_attendances, :ls_session_date_id, :integer
  end
end
