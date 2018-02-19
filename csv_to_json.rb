require 'json'
require 'csv'

# json 1, clean array of song tiles
beatles_songs = []

CSV.foreach('beatles_songs.csv') do |line|
    beatles_songs.push(line[0])
end
beatles_songs.shift

File.open('beatles_songs.json', 'w') do |f|
    f.write(beatles_songs.to_json)
end

#json 2, has more data
beatles_songs_2 = []
lines = CSV.read('beatles_songs.csv')
lines.each do |song, album, songwriter, lead_vocal, year, notes, ref|
    song_hash = Hash.new
    song_hash[:song_title] = song
    song_hash[:album] = album
    song_hash[:songwriters] = songwriter
    song_hash[:lead_vocals] = lead_vocal
    song_hash[:year] = year
    
    beatles_songs_2.push(song_hash)
end
beatles_songs_2.shift
beatles_song_hash = Hash.new
beatles_song_hash[:beatle_songs] = beatles_songs_2
# puts beatles_song_hash.inspect
File.open('beatles_songs_2.json', 'w') do |f|
    f.write(beatles_song_hash.to_json)
end

