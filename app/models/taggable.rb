class Taggable < ApplicationRecord
  belongs_to :parent, polymorphic: true, optional: true
  belongs_to :tag
end
