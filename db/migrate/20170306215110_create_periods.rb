class CreatePeriods < ActiveRecord::Migration[5.0]
  def change
    create_table :periods do |t|
      t.datetime :started_at
      t.datetime :ended_at
      t.references :parent, polymorphic: true, index: true
      t.belongs_to :period

      t.timestamps
    end
  end
end
