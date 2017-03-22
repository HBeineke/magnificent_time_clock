class CreateAgreementInterrupts < ActiveRecord::Migration[5.0]
  def change
    create_table :agreement_interrupts do |t|
      t.belongs_to :agreement, index: true
      t.belongs_to :tag, index: true

      t.timestamps
    end
  end
end
