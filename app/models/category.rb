class Category < ActiveRecord::Base
  validates :name, presence: true

  scope :since, ->(updated_since) { where('updated_at >= ?', updated_since) }
end
