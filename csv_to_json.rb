require 'json'
require 'csv'

beatles_songs = []

CSV.foreach('beatles_songs.csv') do |line|
    beatles_songs.push(line[0])
end
beatles_songs.shift
# puts beatles_songs.inspect

File.open('beatles_songs.json', 'w') do |f|
    f.write(beatles_songs.to_json)
end