class CreateTaggables < ActiveRecord::Migration[5.0]
  def change
    create_table :taggables do |t|
      t.references :parent, polymorphic: true, index: true
      t.belongs_to :tag, index: true

      t.timestamps
    end
  end
end
