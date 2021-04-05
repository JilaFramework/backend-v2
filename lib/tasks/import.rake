desc 'import from specified JSON_PATH'
task import: :environment do
  json_path = ENV.fetch('JSON_PATH')
  data = JSON.parse(File.read(json_path))
  categories = data['categories']
  entries = data['entries']
  puts 'Importing:'
  puts "  #{categories.count} categories"
  puts "  #{entries.count} entries"

  categories.each do |category|
    next if Category.find_by(id: category['id'])

    Category.create(
      id: category['id'],
      name: category['name']
    )
  end

  entries.each do |entry|
    next if Entry.find_by(id: entry['id'])

    Entry.create(
      id: entry['id'],
      entry_word: entry['entry_word'],
      pronunciation: entry['pronunciation'],
      word_type: entry['word_type'],
      meaning: entry['meaning'],
      example: entry['example'],
      example_translation: entry['example_translation'],
      description: entry['description'],
      category_ids: entry['categories']
    )
  end
end
