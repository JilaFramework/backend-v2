require 'rails_helper'

RSpec.describe Entry, type: :model do
  describe :published? do
    it 'should only return published records' do
      published_tomorrow = Entry.create(
        entry_word: 'published',
        word_type: 'noun',
        meaning: 'published',
        published?: true,
        updated_at: DateTime.tomorrow
      )
      unpublished_yesterday = Entry.create(
        entry_word: 'unpublished',
        word_type: 'noun',
        meaning: 'unpublished',
        published?: false,
        updated_at: DateTime.yesterday
      )
      entries = Entry.published?

      expect(entries).to_not include(unpublished_yesterday)
      expect(entries).to include(published_tomorrow)
    end
  end
end
