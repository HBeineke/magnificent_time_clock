class CreateRecords < ActiveRecord::Migration[5.0]
  def change
    create_table :records do |t|
      t.datetime :work_start
      t.datetime :work_end
      t.datetime :break_start
      t.datetime :break_end
      t.belongs_to :record_set

      t.timestamps
    end
  end
end
