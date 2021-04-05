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
    data = JSON.parse(response.body)
    expect(data.keys.sort).to eq(%w[categories entries])
    expect(data['categories']).to(
      eq(
        [
          { 'id' => 1, 'name' => 'cat a' },
          { 'id' => 2, 'name' => 'cat b' }
        ]
      )
    )
    expect(data['entries']).to(
      eq(
        [
          {
            'categories' => [2],
            'description' => nil,
            'entry_word' => 'word 1',
            'example' => nil,
            'example_translation' => nil,
            'id' => 1,
            'meaning' => 'one',
            'pronunciation' => nil,
            'word_type' => 'noun'
          },
          {
            'categories' => [1],
            'description' => nil,
            'entry_word' => 'word 2',
            'example' => nil,
            'example_translation' => nil,
            'id' => 2,
            'meaning' => 'two',
            'pronunciation' => nil,
            'word_type' => 'noun'
          }
        ]
      )
    )
  end
end
