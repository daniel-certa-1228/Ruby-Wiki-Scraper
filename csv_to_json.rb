require 'json'
require 'csv'

lines = CSV.read('beatles_songs.csv')
# puts lines
# beatles_json = lines.to_json
# puts beatles_json
File.open('beatles_songs.json', 'w') do |f|
    f.write(lines.to_json)
end