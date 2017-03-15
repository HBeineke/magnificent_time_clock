class Taggable < ApplicationRecord
  belongs_to :parent, polymorphic: true
  belongs_to :tag
end
