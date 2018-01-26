json.array! @entries.each do |entry|
  json.id entry.id
  json.full_name entry.friendly_full_name
  json.middle_name entry.middle_name
  json.first_name entry.fn
  json.last_name entry.ln
  json.email entry.email
  json.p_num entry.japanese_numbers
  json.created_at entry.friendly_created_at
  json.updated_at entry.friendly_updated_at
end