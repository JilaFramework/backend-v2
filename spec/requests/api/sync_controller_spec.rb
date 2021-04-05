require 'rails_helper'

describe Api::SyncController do
  before do
    @tomorrow = Category.create name: 'tomorrow', position: 2, updated_at: Date.tomorrow
    @yesterday = Category.create name: 'yesterday', position: 1, updated_at: Date.yesterday

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

  it 'returns json' do
    get '/api/sync/all'

    expect(response.status).to eq(200)
    expect(JSON.parse(response.body)).to eq({})
  end
end
