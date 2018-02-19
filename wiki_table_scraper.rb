require 'Nokogiri'
require 'open-uri'
require 'csv'

url = "https://en.wikipedia.org/wiki/List_of_songs_recorded_by_the_Beatles"
# puts url

html = Nokogiri::HTML(open(url))
# puts html

csv = CSV.open("beatles_songs.csv", "w", {:col_sep => ",", :quote_char => '\'', :force_quotes => true})
# puts csv.inspect

html.xpath('//table[4]//tr').each do |row|
    song_array = []
    row.xpath('th','td').each do |cell|
        song_array << cell.text.gsub(/\n/, " | ")
        # puts song_array
    end
    csv << song_array
end

csv.close