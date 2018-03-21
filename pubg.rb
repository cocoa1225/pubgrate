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

 if hour == 2 && minut == 14 && second == 0
   sleep(1)
  url = "https://pubgtracker.com/profile/pc/cocoaprpr?region=agg"
  charset = nil
  html = open(url).read do |f|
    charset = f.charset
    f.read
  end


  page = Nokogiri::HTML.parse(html, nil, charset)
rating = page.search('span.value')
  File.open('rating.txt','w') do |f|
    f.puts("#{rating}")
 end

 File::open("rating.txt") do |content|
   @tweetrating = content.readlines[18].gsub(/[^\d]/, "").to_i
 end

 File.open('hikaku.txt',"r") do |hikaku|
   @kinou = hikaku.read
end

File.open('hikaku.txt',"w") do |hikaku2|
  hikaku2.puts("#{@tweetrating}")
end

client = Twitter::REST::Client.new do |config|     #ツイートするアカウントの情報を取得
  config.consumer_key        = "your consumer_key"
  config.consumer_secret     = "your consumer_secret"
  config.access_token        = "your access_token"
  config.access_token_secret = "your access_token_secret"
end

  puts("あなたの名前のPUBG,Squad(TPP)のレートは#{@tweetrating}です。\n昨日までのレートは#{@kinou}")
end
end
