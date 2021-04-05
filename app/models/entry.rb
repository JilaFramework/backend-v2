class Entry < ActiveRecord::Base
  scope :published?, -> { where(published?: true) }
end
