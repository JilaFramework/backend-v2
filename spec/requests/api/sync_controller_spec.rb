require 'rails_helper'

describe Api::SyncController do
  before do
    @cat_b = Category.create(
      id: 2,
      name: 'cat b',
      position: 2
    )
    @cat_a = Category.create(
      id: 1,
      name: 'cat a',
      position: 1
    )

    @entry_a = Entry.create(
      id: 1,
      entry_word: 'word 1',
      word_type: 'noun',
      meaning: 'one',
      categories: [@cat_b]
    )
    @entry_b = Entry.create(
      id: 2,
      entry_word: 'word 2',
      word_type: 'noun',
      meaning: 'two',
      categories: [@cat_a]
    )
  end

  it 'returns json' do
    get '/api/sync/all'

    expect(response.status).to eq(200)
    expect(JSON.parse(response.body)).to(
      eq(
        'categories' => [
          { 'id' => 1, 'name' => 'cat a' },
          { 'id' => 2, 'name' => 'cat b' }
        ],
        'entries' => [
          { 'categories' => [2], 'id' => 1 },
          { 'categories' => [1], 'id' => 2 }
        ]
      )
    )
  end
end
