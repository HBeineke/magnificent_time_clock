class CreateReports < ActiveRecord::Migration[5.0]
  def change
    create_table :reports do |t|
      t.belongs_to :user, index: true
      t.belongs_to :report, index: true
      t.string :type
      t.datetime :started_at
      t.datetime :ended_at

      t.timestamps
    end
  end
end
