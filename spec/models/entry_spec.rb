require 'rails_helper'

describe Entry do
  describe '#published?' do
    before do
      @published_tomorrow = described_class.create(
        entry_word: 'published',
        word_type: 'noun',
        meaning: 'published',
        published?: true,
        updated_at: DateTime.tomorrow
      )
      @unpublished_yesterday = described_class.create(
        entry_word: 'unpublished',
        word_type: 'noun',
        meaning: 'unpublished',
        published?: false,
        updated_at: DateTime.yesterday
      )
    end

    it 'onlies return published records' do
      entries = described_class.published?

      expect(entries).not_to include(@unpublished_yesterday)
      expect(entries).to include(@published_tomorrow)
    end
  end
end
