json.entries do
  json.array! @entries do |entry|
    json.id entry.id
    json.categories entry.category_ids
  end
end

json.categories do
  json.array! @categories do |category|
    json.id category.id
    json.name category.name
  end
end
