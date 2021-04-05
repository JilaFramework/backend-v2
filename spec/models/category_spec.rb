require 'rails_helper'

describe Category do
  describe 'scopes' do
    before do
      @tomorrow = described_class.create name: 'tomorrow', position: 2, updated_at: Date.tomorrow
      @yesterday = described_class.create name: 'yesterday', position: 1, updated_at: Date.yesterday

      @published = Entry.create(
        entry_word: 'published',
        word_type: 'noun',
        meaning: 'published',
        published?: true,
        categories: [@yesterday]
      )
      @unpublished = Entry.create(
        entry_word: 'unpublished',
        word_type: 'noun',
        meaning: 'unpublished',
        published?: false,
        categories: [@tomorrow]
      )
    end

    describe '#since' do
      it 'filters categories modified before provided date' do
        categories = described_class.since Time.zone.today.to_s

        expect(categories).not_to include(@yesterday)
        expect(categories).to include(@tomorrow)
      end
    end
  end
end
