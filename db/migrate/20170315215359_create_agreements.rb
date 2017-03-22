class CreateAgreements < ActiveRecord::Migration[5.0]
  def change
    create_table :agreements do |t|
      t.string :name
      t.string :description
      t.belongs_to :report, index: true
      t.belongs_to :taggable, index: true

      t.timestamps
    end
  end
end
