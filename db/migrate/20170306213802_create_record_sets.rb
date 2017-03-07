class CreateRecordSets < ActiveRecord::Migration[5.0]
  def change
    create_table :record_sets do |t|
      t.belongs_to :user
      t.belongs_to :record_set
      
      t.timestamps
    end
  end
end
