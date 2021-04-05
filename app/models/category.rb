class Category < ApplicationRecord
  has_and_belongs_to_many :entries

  validates :name, presence: true

  scope :since, ->(updated_since) { where('updated_at >= ?', updated_since) }
end
