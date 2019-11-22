sudo_Matthew = dofile("sudo.lua")
https = require("ssl.https")
JSON = dofile("./libs/JSON.lua")
local Matthew_dev = io.open("Matthew_online.lua")
if Matthew_dev then
Matthew_on = {string.match(Matthew_dev:read('*all'), "^(.*)/(%d+)")}
local tsheke_file = io.open("sudo.lua", 'w')
tsheke_file:write("token = '" ..Matthew_on[1].."'\n\nsudo_add = "..Matthew_on[2].."" )
tsheke_file:close()
https.request("https://api.telegram.org/bot"..Matthew_on[1].."/sendMessage?chat_id="..Matthew_on[2].."&text=Bot_Matthew_is_start_new")
os.execute('cd .. && rm -rf .telegram-cli')
os.execute('rm -rf Matthew_online.lua')  
os.execute('./tg -s ./Matthew.lua $@ --bot='..Matthew_on[1])
end
function chack(tokenCk)
local getme = "https://api.telegram.org/bot" ..tokenCk.. '/getme'
local req = https.request(getme)
local data = JSON:decode(req)
if data.ok == true then
print("\27[31m✓ DONE\27[m \27[1;34m»»Now Send Sudo ID««\27[m")
local sudo_send  = io.read()
print("\27[31m✓ DONE\27[m")
local tsheke_file = io.open("sudo.lua", 'w')
tsheke_file:write("token = '" ..tokenCk.."'\n\nsudo_add = "..sudo_send.."" )
tsheke_file:close()
os.execute('cd .. && rm -fr .telegram-cli')
os.execute('cd && rm -fr .telegram-cli')
os.execute('./tg -s ./Matthew.lua $@ --bot='..tokenCk)
else
print("\27[31m»»This TOKEN Incorrect , Send Right TOKEN««\27[m")
local token_send = io.read()
chack(token_send)
end
end
os.execute('cd .. && rm -rf .telegram-cli')
if token and token == "TOKEN" then 
print("\27[1;34m»»Send Your Bot TOKEN««\27[m")
local token_send = io.read()
chack(token_send)
else 
os.execute('cd .. && rm -fr .telegram-cli')
os.execute('cd && rm -fr .telegram-cli')
sudo_Matthew = dofile("sudo.lua")
local getme = "https://api.telegram.org/bot" ..token.. '/getme'
local req = https.request(getme)
local data = JSON:decode(req)
if data.ok == true then
os.execute('rm -rf Matthew.lua')
os.execute('wget https://raw.githubusercontent.com/Matthewabas/Matthew/master/Matthew.lua')
dofile('./Matthew.lua')  
os.execute('./tg -s ./Matthew.lua $@ --bot='..token)
else
print("\27[31mTOKEN Incorrect , Send Right TOKEN««\27[m")
local token_send = io.read()
chack(token_send)
end
end
