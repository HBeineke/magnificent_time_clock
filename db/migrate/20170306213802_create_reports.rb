class CreateReports < ActiveRecord::Migration[5.0]
  def change
    create_table :reports do |t|
      t.belongs_to :user
      t.belongs_to :report

      t.timestamps
    end
  end
end
