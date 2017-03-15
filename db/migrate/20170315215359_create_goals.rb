class CreateGoals < ActiveRecord::Migration[5.0]
  def change
    create_table :goals do |t|
      t.string :name
      t.string :description
      t.belongs_to :user, index: true
      t.belongs_to :taggable, index: true

      t.timestamps
    end
  end
end
