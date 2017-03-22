class CreateAgreementReplacements < ActiveRecord::Migration[5.0]
  def change
    create_table :agreement_replacements do |t|
      t.belongs_to :agreement, index: true
      t.belongs_to :tag, index: true
      t.string :report_type

      t.timestamps
    end
  end
end
