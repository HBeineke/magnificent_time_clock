class RecordSet < ApplicationRecord
  has_many :records
  belongs_to :user, optional: true
  has_many :record_sets
  belongs_to :record_set, optional: true
end
