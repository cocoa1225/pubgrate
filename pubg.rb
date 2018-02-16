require 'open-uri'
require 'nokogiri'
require 'discordrb'
bot = Discordrb::Commands::CommandBot.new token: 'yourtoken', prefix: '!'

bot.command (:pubg) do |event,*code|
  @name = code[0]
t = 0
url = "https://dak.gg/profile/#{@name}"

charset = nil
html = open(url).read do |f|
  charset = f.charset # 文字種別を取得
  f.read # htmlを読み込んで変数htmlに渡す
end
# htmlをパース(解析)してオブジェクトを生成
page = Nokogiri::HTML.parse(html, nil, charset)
pubgrate = page.search('p.grade-name')

File.open('file.txt','w') do |f|
  f.puts("#{pubgrate}")
end

File.open('./file.txt','r').each do |r|
bronze = r.include?("BRONZE")
silver= r.include?("SILVER")
gold = r.include?("GOLD")
platinum = r.include?("PLATINUM")
diamond = r.include?("DIAMOND")
master = r.include?("MASTER")
grand = r.include?("GRANDMASTER")
top500 = r.include?("TOP")
etc = r.include?("grade-name")
etc2 = r.include?("/p")

if bronze == true
  event.send_message"#{@name}のレートはブロンズ帯です"
t +=1

elsif silver == true
  event.send_message"#{@name}のレートはシルバー帯です"
t +=1

elsif gold == true
  event.send_message"#{@name}のレートはゴールド帯です"
t +=1

elsif platinum == true
  event.send_message"#{@name}のレートはプラチナ帯です"
t +=1

elsif diamond == true
  event.send_message"#{@name}のレートはダイアモンド帯です"
t +=1

elsif grand == true
  event.send_message"#{@name}のレートはグランドマスター帯です"
t +=1

elsif top500 == true
  event.send_message"#{@name}のレートはTOP500位です"
t +=1

elsif master == true
  event.send_message"#{@name}のレートはマスター帯です"
t +=1

elsif etc == true || etc2 == true
   puts "a"
t +=1

else
  event.send_message"ランク帯が取得できなかったか名前が間違っている可能性が高いです"
  t +=1
end
end
""
end

bot.run
