require 'date'
require 'twitter'
require 'open-uri'
require 'nokogiri'

puts "実行中！"
loop do
  d = DateTime.now
 hour = d.hour
 minut = d.min
 second = d.sec
 if hour == 0 && minut == 0 && second == 0
   sleep(1)
  url = "https://dak.gg/profile/cocoaprpr"
  charset = nil
  html = open(url).read do |f|
    charset = f.charset
    f.read
  end
  page = Nokogiri::HTML.parse(html, nil, charset)
rating = page.search('div.rating')

  File.open('rating.txt','w') do |f|
    f.puts("#{rating}")
 end

 File::open("rating.txt") do |content|
   @tweetrating = content.readlines[1].gsub(/[^\d]/, "").to_i
 end

 File::open("rating.txt") do |content2|
   @squad = content2.readlines[14].gsub(/[^\d]/, "").to_i
 end

 File.open('hikaku.txt',"r") do |hikaku|
   @kinou = hikaku.read.to_i
end

File.open('squad.txt',"r") do |squad2|
  @squad2 = squad2.read.to_i
end

File.open('hikaku.txt',"w") do |hikaku2|
  hikaku2.puts("#{@tweetrating}")
end

File.open('squad.txt','w') do |squad|
  squad.puts("#{@squad}")
end
client = Twitter::REST::Client.new do |config|     #ツイートするアカウントの情報を取得
  config.consumer_key        = "K4R6MNRZzLkYU73QOtoT8yqct"
  config.consumer_secret     = "8H9TT23mPuuhQ16olm1TwO05wSpkHIqIW2BtfVah6QRW3JiztL"
  config.access_token        = "3501608173-wbOHmiIPi0orTcYWSDIUvTvWk0Yw43kA1lJIxoC"
  config.access_token_secret = "rJ7Fa8yk6jhYBwwPFZpxndo6Ar4prP5kJnK01uOiTXx2i"
end

c = @tweetrating-@kinou

d = @squad-@squad2
  client.update("cocoaprprのPUBG,JPサーバー\nSolo(TPP)のレートは(#{@tweetrating})です。昨日(#{@kinou})±(#{c})。\nDuo(TPP)のレートは存在しません\nSquad(TPP)のレートは(#{@squad})です。昨日(#{@squad2})±(#{d})")
end
end
