json.current do |json|
  json.pilot @aktualnis.pilot
  json.begin @aktualnis.begin.to_i
  json.id @aktualnis.id
end

json.pilots @pilots do |json, pilt|
  json.pilot pilt.pilot
  json.begin pilt.begin.to_i
  json.end pilt.end.to_i
  json.note pilt.note
  json.id pilt.id
end
