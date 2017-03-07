class Report < ApplicationRecord
  has_many :time_cards
  belongs_to :user, optional: true
  has_many :reports
  belongs_to :report, optional: true
end
