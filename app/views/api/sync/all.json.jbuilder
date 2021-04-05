json.entries do
  json.array! @entries do |entry|
    json.id entry.id
    json.entry_word entry.entry_word
    json.pronunciation entry.pronunciation
    json.word_type entry.word_type
    json.meaning entry.meaning
    json.example entry.example
    json.example_translation entry.example_translation
    json.description entry.description
    json.categories entry.category_ids
  end
end

json.categories do
  json.array! @categories do |category|
    json.id category.id
    json.name category.name
  end
end
