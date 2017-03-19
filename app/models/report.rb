class Report < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :report, optional: true
  has_many :reports
  accepts_nested_attributes_for :reports
  has_many :periods, as: :parent
  accepts_nested_attributes_for :periods
end
