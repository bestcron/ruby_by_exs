require 'httparty'
require 'json'

def outp(t, b)
	puts "#{t}: #{b}"
end

response = HTTParty.get('https://api.vk.com/method/wall.get?owner_id=125646')
response = HTTParty.get('https://api.vk.com/method/users.get?user_ids=15553360&fields=city,nickname,online,timezone')

response = HTTParty.get('https://api.vk.com/method/groups.getBanned?group_id=37273781&count=20&access_token=75afb43543589c98534b')
response = HTTParty.get('https://api.vk.com/method/groups.getBanned?group_id=37273781&count=20&access_token=75afb43543dsdfsaf4b')

puts "f wef wef'"
body = response.body
outp 'code', response.code
outp 'msg', response.message
outp 'headers', response.headers.inspect
outp 'body', body[0..1189]
