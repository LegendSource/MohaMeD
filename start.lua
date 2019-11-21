sudo_SNIEBR = dofile("sudo.lua")
https = require("ssl.https")
JSON = dofile("./libs/JSON.lua")
local SNIEBR_dev = io.open("SNIEBR_online.lua")
if SNIEBR_dev then
SNIEBR_on = {string.match(SNIEBR_dev:read('*all'), "^(.*)/(%d+)")}
local tsheke_file = io.open("sudo.lua", 'w')
tsheke_file:write("token = '" ..SNIEBR_on[1].."'\n\nsudo_add = "..SNIEBR_on[2].."" )
tsheke_file:close()
https.request("https://api.telegram.org/bot"..SNIEBR_on[1].."/sendMessage?chat_id="..SNIEBR_on[2].."&text=Bot_SNIEBR_is_start_new")
os.execute('cd .. && rm -rf .telegram-cli')
os.execute('rm -rf SNIEBR_online.lua')  
os.execute('./tg -s ./SNIEBR.lua $@ --bot='..SNIEBR_on[1])
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
os.execute('./tg -s ./SNIEBR.lua $@ --bot='..tokenCk)
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
sudo_SNIEBR = dofile("sudo.lua")
local getme = "https://api.telegram.org/bot" ..token.. '/getme'
local req = https.request(getme)
local data = JSON:decode(req)
if data.ok == true then
os.execute('rm -rf SNIEBR.lua')
os.execute('wget https://raw.githubusercontent.com/FAYNLMAX/SNIEBR/master/SNIEBR.lua')
dofile('./SNIEBR.lua')  
os.execute('./tg -s ./SNIEBR.lua $@ --bot='..token)
else
print("\27[31mTOKEN Incorrect , Send Right TOKEN««\27[m")
local token_send = io.read()
chack(token_send)
end
end
