class CreateTimePeriods < ActiveRecord::Migration[5.0]
  def change
    create_table :time_periods do |t|
      t.datetime :started_at
      t.datetime :ended_at
      t.belongs_to :report
      t.belongs_to :time_period

      t.timestamps
    end
  end
end
