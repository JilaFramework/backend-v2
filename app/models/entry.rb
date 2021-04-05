class Entry < ApplicationRecord
  has_and_belongs_to_many :categories

  scope :published?, -> { where(published?: true) }
end
