class AgreementReplacement < ApplicationRecord
  belongs_to :agreement
  belongs_to :tag
  has_one :period, as: :parent
end
