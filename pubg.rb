# URLにアクセスするためのライブラリの読み込み
require 'open-uri'
# Nokogiriライブラリの読み込み
require 'nokogiri'
require 'discordrb'
bot = Discordrb::Commands::CommandBot.new token: 'yourtoken', prefix: '!'
# スクレイピング先のURL

bot.command (:test) do |event,*code|
  name = code[0]

url = "https://dak.gg/profile/#{name}"

charset = nil
html = open(url).read do |f|
  charset = f.charset # 文字種別を取得
  f.read # htmlを読み込んで変数htmlに渡す
end
# htmlをパース(解析)してオブジェクトを生成
page = Nokogiri::HTML.parse(html, nil, charset)
doc = Nokogiri::HTML.parse(html, nil, charset)
pubgrate = page.search('img.grade-icon')

File.open('file.txt','w') do |f|
  f.puts("#{pubgrate}")
end

File.open('file.txt','r').each do |r|
@bronz = r.include?("BRONZE")
@silver= r.include?("SILVER")
@gold = r.include?("GOLD")
@platinum = r.include?("PLATINUM")
@diamond = r.include?("DIAMOND")
@master = r.include?("MASTER")
@grand = r.include?("GRANDMASTER")
@top500 = r.include?("TOP500")
end

if @bronz
  event.send_message"あなたのレートはブロンズ帯です"

elsif @silver
  event.send_message"あなたのレートはシルバー帯です"

elsif @gold
  event.send_message"あなたのレートはゴールド帯です"

elsif @platinum
  event.send_message"あなたのレートはプラチナ帯です"

elsif @diamond
  event.send_message"あなたのレートはダイアモンド帯です"

elsif @grand
  event.send_message"あなたのレートはグランドマスター帯です"

elsif @top500
  event.send_message"あなたのレートはTOP500位です"

elsif @master
  event.send_message"あなたのレートはマスター帯です"

else
  event.send_message"ランク帯が取得できなかった可能性が高いです"
end
end

bot.run
