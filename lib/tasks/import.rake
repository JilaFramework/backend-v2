desc 'import from specified JSON_PATH'
task import: :environment do
  require 'fileutils'
  json_path = ENV.fetch('JSON_PATH')
  data = JSON.parse(File.read(json_path))
  categories = data['categories']
  entries = data['entries']
  puts 'Importing:'
  puts "  #{categories.count} categories"
  puts "  #{entries.count} entries"

  categories.each do |category|
    Category.find_or_create_by(
      id: category['id']
    ) do |record|
      record.update!(
        name: category['name']
      )
    end
  end

  download = lambda do |url, folder, name, ext|
    FileUtils.mkdir_p folder
    path = "#{folder}/#{name}.#{ext}"
    return if File.exist?(path)

    puts "Downloading #{url} to #{path}"
    `wget "#{url}" -O #{path} -q`
  end

  entries.each do |entry|
    audio_url = entry['audio']
    download.call(audio_url, 'tmp/audio', entry['id'], 'm4a') if audio_url
    thumbnail_url = entry['images']['thumbnail']
    download.call(thumbnail_url, 'tmp/images_thumbnail', entry['id'], 'jpg') if thumbnail_url
    image_url = entry['images']['normal']
    download.call(image_url, 'tmp/images_normal', entry['id'], 'jpg') if image_url
    Entry.find_or_create_by(
      id: entry['id']
    ) do |record|
      record.update!(
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
end
