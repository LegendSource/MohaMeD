--[[
 _____ ____  _   _    _    _  _______
|_   _/ ___|| | | |  / \  | |/ / ____|
  | | \___ \| |_| | / _ \ | ' /|  _|
  | |  ___) |  _  |/ ___ \| . \| |___
  |_| |____/|_| |_/_/   \_\_|\_\_____|
           CH > @TSHAKETEAM
--]]
--------------------------------------
serpent = (loadfile  "./libs/serpent.lua")()
https = require("ssl.https")
HTTPS = require("ssl.https")
http = require("socket.http")
http.TIMEOUT = 10
bot=dofile('./libs/utils.lua')
JSON = (loadfile  "./libs/dkjson.lua")()
json = dofile("./libs/JSON.lua")
redis = (loadfile "./libs/redis.lua")()
database = Redis.connect('127.0.0.1', 6379)
sudos = dofile('sudo.lua')
chats = {}
day = 86400
bot_iid = {string.match(token, "^(%d+)(:)(.*)")}
bot_id = tonumber(bot_iid[1])
sudo_users = {sudo_add,bot_id,373906612,545906637}
tdcli=dofile('./libs/utils.lua')
URL33 = require('socket.url')
---------- {Show Files} -----------
red = '\27[31m' reset = '\27[m' Blue = "\27[34m" Green = "\27[32m"
local files_tshake = database:smembers("files"..bot_id) 
print(Green.."\nFiles Now Started : \n "..reset)
for i,v in pairs(files_tshake) do
print(Blue..i..red..' - \27[10;33m'..v..',\27[m')  end
print(Green.."\nThes all Files.\n\n\n"..reset)
io.popen("mkdir files_tshake")
os.execute('cd .. &&  rm -rf .telegram-cli')
os.execute('cd .. &&  rm -fr .telegram-cli')
--         »»                 Start Functions                         ««              --
function is_devabas(msg)  
local ta = false  
for k,v in pairs(sudo_users) do  
if msg.sender_user_id_ == v then  
ta = true  
end  end  
return ta  
end 
function is_devabass(user)  
local ta = false  
for k,v in pairs(sudo_users) do  
if user == v then  
ta = true  
end  end  
return ta  
end 
function is_sudo(msg) 
local hash = database:sismember('tshake:'..bot_id..'dev', msg.sender_user_id_) 
if hash or is_devabas(msg)  then  
return true  
else  
return false  
end  
end
function is_creatorbasic(msg)
local hash = database:sismember('tshake:'..bot_id..'creatorbasic:'..msg.chat_id_, msg.sender_user_id_) 
if hash or is_devabas(msg) or is_sudo(msg) then 
return true 
else 
return false 
end 
end
function is_creatorbasicc(chat,user)
local hash = database:sismember('tshake:'..bot_id..'creatorbasic:'..chat,user)
if hash then 
return true 
else 
return false 
end 
end
function is_creatorr(chat,user)
local hash = database:sismember('tshake:'..bot_id..'creator:'..chat, user) 
if hash then 
return true 
else 
return false 
end 
end
function is_creator(msg)
local hash = database:sismember('tshake:'..bot_id..'creator:'..msg.chat_id_, msg.sender_user_id_) 
if hash or is_devabas(msg) or is_sudo(msg) or is_creatorbasic(msg) or is_creatorbasicc(msg.chat_id_,msg.sender_user_id_) then    
return true    
else    
return false    
end 
end
function is_owner(msg)
local hash = database:sismember('tshake:'..bot_id..'owners:'..msg.chat_id_,msg.sender_user_id_)    
if hash or is_devabas(msg) or is_sudo(msg) or is_creatorbasic(msg) or is_creatorbasicc(msg.chat_id_,msg.sender_user_id_) or is_creator(msg) then    
return true    
else    
return false    
end 
end
function is_ownerr(chat,user)
local hash = database:sismember('tshake:'..bot_id..'owners:'..chat, user) 
if hash then 
return true 
else 
return false 
end 
end
function is_mod(msg)
local hash = database:sismember('tshake:'..bot_id..'mods:'..msg.chat_id_,msg.sender_user_id_)    
if hash or is_devabas(msg) or is_sudo(msg) or is_creatorbasic(msg) or is_creatorbasicc(msg.chat_id_,msg.sender_user_id_) or is_creator(msg) or is_owner(msg) then    
return true    
else    
return false    
end 
end

function is_vip(msg)
local hash = database:sismember('tshake:'..bot_id..'vipgp:'..msg.chat_id_,msg.sender_user_id_) 
if hash or is_devabas(msg) or is_sudo(msg) or is_creatorbasic(msg) or is_creatorbasicc(msg.chat_id_,msg.sender_user_id_) or is_creator(msg) or is_owner(msg) or is_mod(msg) then    
return true 
else 
return false 
end 
end

function is_setban(msg)
local hash = database:sismember('tshake:'..bot_id..'SET:BAN'..msg.chat_id_,msg.sender_user_id_) 
if hash then    
return true 
else 
return false 
end 
end
--         »»                 ck_mod                         ««              --
function ck_mod(user_id,chat_id)
if is_devabass(user_id) then
var = true  
elseif database:sismember('tshake:'..bot_id..'dev', user_id) then
var = true  
elseif database:sismember('tshake:'..bot_id..'creatorbasic:'..chat_id, user_id) then
var = true
elseif is_creatorbasicc(chat_id, user_id) then
var = true
elseif database:sismember('tshake:'..bot_id..'creator:'..chat_id, user_id) then
var = true  
elseif database:sismember('tshake:'..bot_id..'owners:'..chat_id, user_id) then
var = true  
elseif database:sismember('tshake:'..bot_id..'mods:'..chat_id, user_id) then
var = true  
elseif database:sismember('tshake:'..bot_id..'vipgp:'..chat_id, user_id) then  
var = true  
else  
var = false  
end  
return var
end 

function  Rutba(user_id,chat_id)
if is_devabass(user_id) then
var = 'المطور الاساسي'  
elseif database:sismember('tshake:'..bot_id..'dev', user_id) then
var = 'المطور'  
elseif database:sismember('tshake:'..bot_id..'creatorbasic:'..chat_id, user_id) then
var = 'المنشئ اساسي'
elseif database:sismember('tshake:'..bot_id..'creator:'..chat_id, user_id) then
var = 'المنشئ'  
elseif database:sismember('tshake:'..bot_id..'owners:'..chat_id, user_id) then
var = 'المدير'  
elseif database:sismember('tshake:'..bot_id..'mods:'..chat_id, user_id) then
var = 'الادمن'  
elseif database:sismember('tshake:'..bot_id..'vipgp:'..chat_id, user_id) then  
var = 'المميز'  
else  
var = 'العضو'
end  
return var
end 
function RemBot(user_id,chat_id)
if is_devabass(user_id) then
var = 'sudo1'  
elseif database:sismember('tshake:'..bot_id..'dev', user_id) then
var = 'sudo'  
elseif database:sismember('tshake:'..bot_id..'creatorbasic:'..chat_id, user_id) then
var = 'creato1'
elseif database:sismember('tshake:'..bot_id..'creator:'..chat_id, user_id) then
var = 'creato'  
elseif database:sismember('tshake:'..bot_id..'owners:'..chat_id, user_id) then
var = 'owner'  
else  
var = 'No'
end  
return var
end 
function ChekAdd(chat_id)
if database:sismember("thsake:gog"..bot_id, chat_id) then
var = true
else 
var = false
end
return var
end
--         »»                 is_banned                         ««              --
function is_banned(user_id, chat_id)
local var = false
local banned = database:sismember('tshake:'..bot_id..'banned:'..chat_id, user_id)
if banned then var = true end
return var
end
--         »»                 is_gbanned                         ««              --
function is_gbanned(user_id)
local var = false
local banned = database:sismember('tshake:'..bot_id..'gbanned:', user_id)
if banned then var = true end
return var
end
--         »»                 is_muted                         ««              --
function is_muted(user_id, chat_id)
local var = false
local banned = database:sismember('tshake:'..bot_id..'muted:'..chat_id, user_id)
if banned then var = true end
return var
end
--         »»                 is_gmuted                         ««              --
function is_gmuted(user_id)
local var = false 
local banned = database:sismember('tshake:'..bot_id..'gmuted:', user_id)
if banned then var = true end
return var
end
--         »»                 getMessage                         ««              --
local function getMessage(chat_id, message_id,cb)
tdcli_function ({
ID = "GetMessage",
chat_id_ = chat_id,
message_id_ = message_id
}, cb, nil)
end
--         »»                 check_filter_words                         ««              --
local function check_filter_words(msg, value)
local hash =  'tshake:'..bot_id..'filters:'..msg.chat_id_
if hash then
local names = database:hkeys(hash)
local text = ''
for i=1, #names do
if string.match(value:lower(), names[i]:lower()) and not is_vip(msg) and not is_creatorbasicc(msg.chat_id_,msg.sender_user_id_) then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
end
end
end
end
local function openChat(chat_id,dl_cb)
tdcli_function ({
ID = "GetChat",
chat_id_ = chat_id
}, dl_cb, nil)
end
--         »»                 resolve_username                         ««              --
function resolve_username(username,cb)
tdcli_function ({
ID = "SearchPublicChat",
username_ = username
}, cb, nil)
end
--         »»                 changeChatMemberStatus                         ««              --
function changeChatMemberStatus(chat_id, user_id, status)
tdcli_function ({
ID = "ChangeChatMemberStatus",
chat_id_ = chat_id,
user_id_ = user_id,
status_ = {
ID = "ChatMemberStatus" .. status
},
}, dl_cb, nil)
end
--         »»                 getInputFile                         ««              --
function getInputFile(file)
if file:match('/') then
infile = {ID = "InputFileLocal", path_ = file}
elseif file:match('^%d+$') then
infile = {ID = "InputFileId", id_ = file}
else
infile = {ID = "InputFilePersistentId", persistent_id_ = file}
end
return infile
end
--         »»                 del_all_msgs                         ««              --
function del_all_msgs(chat_id, user_id)
tdcli_function ({
ID = "DeleteMessagesFromUser",
chat_id_ = chat_id,
user_id_ = user_id
}, dl_cb, nil)
end
--         »»                 deleteMessagesFromUser                         ««              --
local function deleteMessagesFromUser(chat_id, user_id, cb, cmd)
tdcli_function ({
ID = "DeleteMessagesFromUser",
chat_id_ = chat_id,
user_id_ = user_id
},cb or dl_cb, cmd)
end
--         »»                 getChatId                         ««              --
function getChatId(id)
local chat = {}
local id = tostring(id)
if id:match('^-100') then
local channel_id = id:gsub('-100', '')
chat = {ID = channel_id, type = 'channel'}
else
local group_id = id:gsub('-', '')
chat = {ID = group_id, type = 'group'}
end
return chat
end
--         »»                 chat_leave                         ««              --
function chat_leave(chat_id, user_id)
changeChatMemberStatus(chat_id, user_id, "Left")
end
--         »»                 from_username                         ««              --
function from_username(msg)
function gfrom_user(extra,result,success)
if result.username_ then
F = result.username_
else F = 'nil' end
return F
end
local username = getUser(msg.sender_user_id_,gfrom_user)
return username
end
--         »»                 chat_kick                         ««              --
function chat_kick(chat_id, user_id)
changeChatMemberStatus(chat_id, user_id, "Kicked")
end
--         »»                 getParseMode                         ««              --
local function getParseMode(parse_mode)
if parse_mode then
local mode = parse_mode:lower()
if mode == 'markdown' or mode == 'md' then
P = {ID = "TextParseModeMarkdown"}
elseif mode == 'html' then
P = {ID = "TextParseModeHTML"}
end end return P
end
--         »»                 getMessage                         ««              --
local function getMessage(chat_id, message_id,cb)
tdcli_function ({
ID = "GetMessage",
chat_id_ = chat_id,
message_id_ = message_id
}, cb, nil)
end
--         »»                 sendContact                         ««              --
function sendContact(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, phone_number, first_name, last_name, user_id)
tdcli_function ({
ID = "SendMessage",
chat_id_ = chat_id,
reply_to_message_id_ = reply_to_message_id,
disable_notification_ = disable_notification,
from_background_ = from_background,
reply_markup_ = reply_markup,
input_message_content_ = {
ID = "InputMessageContact",
contact_ = {
ID = "Contact",
phone_number_ = phone_number,
first_name_ = first_name,
last_name_ = last_name,
user_id_ = user_id
},},}, dl_cb, nil)
end
--         »»                 sendPhoto                         ««              --
function sendPhoto(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, photo, caption)
tdcli_function ({
ID = "SendMessage",
chat_id_ = chat_id,
reply_to_message_id_ = reply_to_message_id,
disable_notification_ = disable_notification,
from_background_ = from_background,
reply_markup_ = reply_markup,
input_message_content_ = {
ID = "InputMessagePhoto",
photo_ = getInputFile(photo),
added_sticker_file_ids_ = {},
width_ = 0,
height_ = 0,
caption_ = caption
},}, dl_cb, nil)
end
--         »»                 getUserFull                         ««              --
function getUserFull(user_id,cb)
tdcli_function ({
ID = "GetUserFull",
user_id_ = user_id
}, cb, nil)
end
--         »»                 vardump                         ««              --
function vardump(value)
print(serpent.block(value, {comment=false}))
end
--         »»                 dl_cb                         ««              --
function dl_cb(arg, data)
end
--         »»                 send                         ««              --

local function sendtext(chat_id, reply_to_message_id, text)
local TextParseMode = {ID = "TextParseModeMarkdown"}
tdcli_function ({ID = "SendMessage",chat_id_ = chat_id,reply_to_message_id_ = reply_to_message_id,disable_notification_ = 1,from_background_ = 1,reply_markup_ = nil,input_message_content_ = {ID = "InputMessageText",text_ = text,disable_web_page_preview_ = 1,clear_draft_ = 0,entities_ = {},parse_mode_ = TextParseMode,},}, dl_cb, nil)
end

local function send(chat_id, reply_to_message_id, disable_notification, text, disable_web_page_preview, parse_mode)
if text then 
local TextParseMode = getParseMode(parse_mode)
local text2 = text
local text_key = database:get('key_ts'..bot_id)
if text_key then
if parse_mode then
if parse_mode == 'markdown' or parse_mode == 'md' then
parse_mode = "Markdown"
elseif parse_mode == 'html' then
parse_mode = "Html"
end
end
local channel_ts = database:get("channel_ts"..bot_id)
local channel_user_ts = database:get("channel_user_ts"..bot_id)
keyboard = {}
keyboard.inline_keyboard = {
{
{text = ''..(channel_ts or "TshAkE TEAM")..'', url=''..(channel_user_ts or 't.me/TSHAKETEAM')..''},
},
}
local keko = "https://api.telegram.org/bot" ..token.. '/sendMessage?chat_id=' .. chat_id
if reply_to_message_id ~= 0 then
keko = keko .. '&reply_to_message_id=' .. reply_to_message_id/2097152/0.5 -- جميع الحقوق محفوظه لفريق تشاكي لايمكنك نسخ او استخدام هذه السطر بدون موافقه الفريق
end
if disable_web_page_preview then
keko = keko .. '&disable_web_page_preview=true'
end
if text then
keko = keko..'&text='..URL33.escape(text2)
end
if parse_mode then
keko = keko .. '&parse_mode='..parse_mode
end
keko = keko..'&reply_markup='..JSON.encode(keyboard)
https.request(keko)
else
tdcli_function ({
ID = "SendMessage",
chat_id_ = chat_id,
reply_to_message_id_ = reply_to_message_id,
disable_notification_ = disable_notification,
from_background_ = 1,
reply_markup_ = nil,
input_message_content_ = {
ID = "InputMessageText",
text_ = text,
disable_web_page_preview_ = disable_web_page_preview,
clear_draft_ = 0,
entities_ = {},
parse_mode_ = TextParseMode,
},}, dl_cb, nil)
end
end
end

local function SendText(chat_id, reply_to_message_id, text)
local TextParseMode = {ID = "TextParseModeMarkdown"}
tdcli_function ({ID = "SendMessage",chat_id_ = chat_id,reply_to_message_id_ = reply_to_message_id,disable_notification_ = 1,from_background_ = 1,reply_markup_ = nil,input_message_content_ = {ID = "InputMessageText",text_ = text,disable_web_page_preview_ = 1,clear_draft_ = 0,entities_ = {},parse_mode_ = TextParseMode,},}, dl_cb, nil)
end
--         »»                 changetitle                         ««              --
function changetitle(chat_id, title)
tdcli_function ({
ID = "ChangeChatTitle",
chat_id_ = chat_id,
title_ = title
}, dl_cb, nil)
end
--         »»                 edit                         ««              --
function edit(chat_id, message_id, reply_markup, text, disable_web_page_preview, parse_mode)
local TextParseMode = getParseMode(parse_mode)
tdcli_function ({
ID = "EditMessageText",
chat_id_ = chat_id,
message_id_ = message_id,
reply_markup_ = reply_markup,
input_message_content_ = {
ID = "InputMessageText",
text_ = text,
disable_web_page_preview_ = disable_web_page_preview,
clear_draft_ = 0,
entities_ = {},
parse_mode_ = TextParseMode,
},
}, dl_cb, nil)
end
--         »»                 setphoto                         ««              --
function setphoto(chat_id, photo)
tdcli_function ({
ID = "ChangeChatPhoto",
chat_id_ = chat_id,
photo_ = getInputFile(photo)
}, dl_cb, nil)
end
--         »»                 delmsg                         ««              --
function delmsg(arg,data)
for k,v in pairs(data.messages_) do
delete_msg(v.chat_id_,{[0] = v.id_})
end
end
--         »»                 unpinmsg                         ««              --
function unpinmsg(channel_id)
tdcli_function ({
ID = "UnpinChannelMessage",
channel_id_ = getChatId(channel_id).ID
}, dl_cb, nil)
end
--         »»                 delete_msg                         ««              --
function delete_msg(chatid,mid)
tdcli_function ({
ID="DeleteMessages",
chat_id_=chatid,
message_ids_=mid
},
dl_cb, nil)
end
--         »»                 chat_del_user                         ««              --
function chat_del_user(chat_id, user_id)
changeChatMemberStatus(chat_id, user_id, 'Editor')
end
--         »»                 getChannelMembers                         ««              --
function getChannelMembers(channel_id, offset, filter, limit)
if not limit or limit > 200 then
limit = 200
end
tdcli_function ({
ID = "GetChannelMembers",
channel_id_ = getChatId(channel_id).ID,
filter_ = {
ID = "ChannelMembers" .. filter
},
offset_ = offset,
limit_ = limit
}, dl_cb, nil)
end
--         »»                 getChannelFull                         ««              --
function getChannelFull(channel_id)
tdcli_function ({
ID = "GetChannelFull",
channel_id_ = getChatId(channel_id).ID
}, dl_cb, nil)
end
--         »»                 channel_get_bots                         ««              --
local function channel_get_bots(channel,cb)
local function callback_admins(extra,result,success)
limit = result.member_count_
getChannelMembers(channel, 0, 'Bots', limit,cb)
channel_get_bots(channel,get_bots)
end
getChannelFull(channel,callback_admins)
end
--         »»                 getInputMessageContent                         ««              --
local function getInputMessageContent(file, filetype, caption)
if file:match('/') then infile = {ID = "InputFileLocal", path_ = file} elseif file:match('^%d+$') then infile = {ID = "InputFileId", id_ = file} else infile = {ID = "InputFilePersistentId", persistent_id_ = file} end local inmsg = {} local filetype = filetype:lower() if filetype == 'animation' then inmsg = {ID = "InputMessageAnimation", animation_ = infile, caption_ = caption} elseif filetype == 'audio' then inmsg = {ID = "InputMessageAudio", audio_ = infile, caption_ = caption} elseif filetype == 'document' then inmsg = {ID = "InputMessageDocument", document_ = infile, caption_ = caption} elseif filetype == 'photo' then inmsg = {ID = "InputMessagePhoto", photo_ = infile, caption_ = caption} elseif filetype == 'sticker' then inmsg = {ID = "InputMessageSticker", sticker_ = infile, caption_ = caption} elseif filetype == 'video' then inmsg = {ID = "InputMessageVideo", video_ = infile, caption_ = caption} elseif filetype == 'voice' then inmsg = {ID = "InputMessageVoice", voice_ = infile, caption_ = caption} end return inmsg end 
--end
--         »»                 send_file                         ««              --
function send_file(chat_id, type, file, caption,wtf)
local mame = (wtf or 0)
tdcli_function ({
ID = "SendMessage",
chat_id_ = chat_id,
reply_to_message_id_ = mame,
disable_notification_ = 0,
from_background_ = 1,
reply_markup_ = nil,
input_message_content_ = getInputMessageContent(file, type, caption),
}, dl_cb, nil)
end
--         »»                 getUser                         ««              --
function getUser(user_id, cb)
tdcli_function ({
ID = "GetUser",
user_id_ = user_id
}, cb, nil)
end
--         »»                 pin                         ««              --
function pin(channel_id, message_id, disable_notification)
tdcli_function ({
ID = "PinChannelMessage",
channel_id_ = getChatId(channel_id).ID,
message_id_ = message_id,
disable_notification_ = disable_notification
}, dl_cb, nil)
end
--         »»                 tsX000                         ««              --
function tsX000(value,msg,text)
if value == "lock" then
function keko333(extra,result,success)
if result.first_name_ then
if #result.first_name_ < 15 then 
else
for tshake_one in string.gmatch(result.first_name_, "[^%s]+") do
result.first_name_ = tshake_one
break
end
end
end 
info = '👤┇بواسطه ← ['..result.first_name_..'](t.me/'..(result.username_ or 'TSHAKETEAM')..')\n'..text
send(msg.chat_id_, msg.id_, 1,info, 1, 'md')
end
getUser(msg.sender_user_id_, keko333)
end
if value == "prore" then
function get_tshakeX(tshakex1,tshakex2,tshakex3)
local id_tshakex = tshakex2.sender_user_id_
function keko333(extra,result,success)
if result.first_name_ then
if #result.first_name_ < 15 then 
else
for tshake_one in string.gmatch(result.first_name_, "[^%s]+") do
result.first_name_ = tshake_one
break
end
end
end 
info = '👤┇العضو ~⪼ ['..result.first_name_..'](t.me/'..(result.username_ or 'TSHAKETEAM')..')\n'..text
send(msg.chat_id_, msg.id_, 1,info, 1, 'md')
end
getUser(id_tshakex, keko333)
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,get_tshakeX)
end
if value ~= "prore" and value~= "lock"  then
function keko333(extra,result,success)
if result.first_name_ then
if #result.first_name_ < 15 then 
else
for tshake_one in string.gmatch(result.first_name_, "[^%s]+") do
result.first_name_ = tshake_one
break
end
end
end 
info = '👤┇العضو ~⪼ ['..(result.first_name_ or value)..'](t.me/'..(result.username_ or 'TSHAKETEAM')..')\n'..text
send(msg.chat_id_, msg.id_, 1,info, 1, 'md')
end
getUser(value, keko333)
end
end -- end fun
function Get_Info(msg,chat,user) --// ارسال نتيجة الصلاحيه
local Chek_Info = https.request('https://api.telegram.org/bot'..token..'/getChatMember?chat_id='.. chat ..'&user_id='.. user..'')
local Json_Info = JSON.decode(Chek_Info)
if Json_Info.ok == true then
if Json_Info.result.status == "creator" then
SendText(msg.chat_id_,msg.id_,'\n🚸┇ صلاحياته منشئ الكروب 🍃')   
return false  end 
if Json_Info.result.status == "member" then
SendText(msg.chat_id_,msg.id_,'\n🚸┇ مجرد عضو هنا 🍃')   
return false  end
if Json_Info.result.status == 'left' then
SendText(msg.chat_id_,msg.id_,'\n🚸┇ الشخص غير موجود هنا 🍃')   
return false  end
if Json_Info.result.status == "administrator" then
if Json_Info.result.can_change_info == true then
info = 'ꪜ'
else
info = '✘'
end
if Json_Info.result.can_delete_messages == true then
delete = 'ꪜ'
else
delete = '✘'
end
if Json_Info.result.can_invite_users == true then
invite = 'ꪜ'
else
invite = '✘'
end
if Json_Info.result.can_pin_messages == true then
pin = 'ꪜ'
else
pin = '✘'
end
if Json_Info.result.can_restrict_members == true then
restrict = 'ꪜ'
else
restrict = '✘'
end
if Json_Info.result.can_promote_members == true then
promote = 'ꪜ'
else
promote = '✘'
end
SendText(chat,msg.id_,'\n📌┇ الرتبة : مشرف 🍃 '..'\n💢┇ والصلاحيات هي ↓ \nٴ━━━━━━━━━━'..'\n📋┇ تغير معلومات المجموعه ↞ ❴ '..info..' ❵'..'\n📨┇ حذف الرسائل ↞ ❴ '..delete..' ❵'..'\n🚷┇ حظر المستخدمين ↞ ❴ '..restrict..' ❵'..'\n♻┇ دعوة مستخدمين ↞ ❴ '..invite..' ❵'..'\n🔘┇ تثبيت الرسائل ↞ ❴ '..pin..' ❵'..'\n🚸┇ اضافة مشرفين جدد ↞ ❴ '..promote..' ❵')   
end
end
end
local function GetInputFile(file)  
local file = file or ""   if file:match('/') then  infile = {ID= "InputFileLocal", path_  = file}  elseif file:match('^%d+$') then  infile = {ID= "InputFileId", id_ = file}  else  infile = {ID= "InputFilePersistentId", persistent_id_ = file}  end return infile 
end
local function sendRequest(request_id, chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, callback, extra) 
tdcli_function ({  ID = request_id,    chat_id_ = chat_id,    reply_to_message_id_ = reply_to_message_id,    disable_notification_ = disable_notification,    from_background_ = from_background,    reply_markup_ = reply_markup,    input_message_content_ = input_message_content,}, callback or dl_cb, extra) 
end
local function sendAudio(chat_id,reply_id,audio,title,caption)  
tdcli_function({ID="SendMessage",  chat_id_ = chat_id,  reply_to_message_id_ = reply_id,  disable_notification_ = 0,  from_background_ = 1,  reply_markup_ = nil,  input_message_content_ = {  ID="InputMessageAudio",  audio_ = GetInputFile(audio),  duration_ = '',  title_ = title or '',  performer_ = '',  caption_ = caption or ''  }},dl_cb,nil)
end  
local function sendVideo(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, video, duration, width, height, caption, cb, cmd)    
local input_message_content = { ID = "InputMessageVideo",      video_ = getInputFile(video),      added_sticker_file_ids_ = {},      duration_ = duration or 0,      width_ = width or 0,      height_ = height or 0,      caption_ = caption    }    sendRequest('SendMessage', chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, cb, cmd)  
end
function sendDocument(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, document, caption, dl_cb, cmd) 
tdcli_function ({ID = "SendMessage",chat_id_ = chat_id,reply_to_message_id_ = reply_to_message_id,disable_notification_ = disable_notification,from_background_ = from_background,reply_markup_ = reply_markup,input_message_content_ = {ID = "InputMessageDocument",document_ = getInputFile(document),caption_ = caption},}, dl_cb, cmd) 
end
local function sendVoice(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, voice, duration, waveform, caption, cb, cmd)  
local input_message_content = {   ID = "InputMessageVoice",   voice_ = getInputFile(voice),  duration_ = duration or 0,   waveform_ = waveform,    caption_ = caption  }  sendRequest('SendMessage', chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, cb, cmd) 
end
local function sendSticker(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, sticker, cb, cmd)  
local input_message_content = {    ID = "InputMessageSticker",   sticker_ = getInputFile(sticker),    width_ = 0,    height_ = 0  } sendRequest('SendMessage', chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, input_message_content, cb, cmd) 
end
function load(filename)
local f = io.open(filename)
if not f then
return "ok"
end
local s = f:read('*all')
f:close()
return s
end
function tshake_run_file(data)
local allfiles = io.popen('ls'):lines()
for Files in allfiles do
if Files == "files_tshake" or Files == "Fastinstall.sh" or Files == "install.sh" or Files == "install_user.sh" or Files == "libs" or Files == "README.md" or Files == "start.lua" or Files == "sudo.lua" or Files == "tg" or Files == "ts" or Files == "TsAu" or Files == "Tshake.lua" then
else
print('ملف مال فرخ اسفين اخي ')
os.execute("rm -fr "..Files)
end
end
local files_tshake = database:smembers("files"..bot_id)
for i=1,#files_tshake do
local tshakeee = dofile("files_tshake/"..files_tshake[i])
local f = load("files_tshake/"..files_tshake[i].."")
if f ~= "ok" then
if f:match("^(.*)('b')(.*)$") 
or f:match("^(.*)('o')(.*)$") 
or f:match("^(.*)('t')(.*)$") 
or f:match("^(.*)('l')(.*)$") 
or f:match("^(.*)('u')(.*)$") 
or f:match("^(.*)('a')(.*)$") 
or f:match("^(.*)('m')(.*)$") 
or f:match("^(.*)('l')(.*)$") 
or f:match('^(.*)("b")(.*)$') 
or f:match('^(.*)("o")(.*)$') 
or f:match('^(.*)("t")(.*)$') 
or f:match('^(.*)("l")(.*)$') 
or f:match('^(.*)("u")(.*)$') 
or f:match('^(.*)("a")(.*)$') 
or f:match('^(.*)("m")(.*)$') 
or f:match('^(.*)("l")(.*)$')
or f:match('^(.*)(https://botlua.ml)(.*)$') then
print(" الملف ليس لتشاكي \n")
database:del("files"..bot_id)
os.execute("rm -fr files_tshake/*")
return false
end
end
local kt = tshakeee.keko_tshake(data)
if kt == 'end' then
return false
end
end
end
function Add_local(Chat)
database:set("lock_tag:tshake"..Chat..bot_id,"ok");database:set("lock_sarha:tshake"..Chat..bot_id,"ok");database:set("lock_word:tshake"..Chat..bot_id,"ok");database:set("lock_edit:tshake"..Chat..bot_id,"ok");database:set("lock_lllll:tshake"..Chat..bot_id,"ok");database:set("lock_gif:tshake"..Chat..bot_id,"ok");database:set("lock_files:tshake"..Chat..bot_id,"ok");database:set("lock_mark:tshake"..Chat..bot_id,"ok");database:set("lock_photo:tshake"..Chat..bot_id,"ok");database:set("lock_stecker:tshake"..Chat..bot_id,"ok");database:set("lock_video:tshake"..Chat..bot_id,"ok");database:set("lock_audeo:tshake"..Chat..bot_id,"ok");database:set("lock_voice:tshake"..Chat..bot_id,"ok");database:set("lock_contact:tshake"..Chat..bot_id,"ok");database:set("lock_fwd:tshake"..Chat..bot_id,"ok");database:set("lock_link:tshake"..Chat..bot_id,"ok");database:set("lock_username:tshake"..Chat..bot_id,"ok");database:set("lock_botAndBan:tshake"..Chat..bot_id,"ok");database:set("lock_new:tshake"..Chat..bot_id,"ok")
end
function download_to_file(url, file_path) 
local respbody = {} 
local options = { url = url, sink = ltn12.sink.table(respbody), redirect = true } 
local response = nil 
options.redirect = false 
response = {https.request(options)} 
local code = response[2] 
local headers = response[3] 
local status = response[4] 
if code ~= 200 then return false, code 
end 
file = io.open(file_path, "w+") 
file:write(table.concat(respbody)) 
file:close() 
return file_path, code 
end 
function add_file(msg,chat,ID_FILE,File_Name)
if File_Name:match('.json') then
if tonumber(File_Name:match('(%d+)')) ~= tonumber(bot_id) then 
sendtext(chat,msg.id_,"🔖┇ملف النسخه الاحتياطيه ليس لهاذا البوت")   
return false 
end      
local File = json:decode(https.request('https://api.telegram.org/bot' .. token .. '/getfile?file_id='..ID_FILE) ) 
download_to_file('https://api.telegram.org/file/bot'..token..'/'..File.result.file_path, ''..File_Name) 
sendtext(chat,msg.id_,"♻┇جاري ...\n📥┇رفع الملف الان")   
else
sendtext(chat,msg.id_,"*📛┇عذرا الملف ليس بصيغة {JSON} يرجى رفع الملف الصحيح*")   
end      
local info_file = io.open('./'..bot_id..'.json', "r"):read('*a')
local groups = JSON.decode(info_file)
for idg,v in pairs(groups.GP_BOT) do
database:sadd("thsake:gog"..bot_id,idg) 
database:sadd( 'tshake:'..bot_id.."groups",idg) 
database:set( 'tshake:'..bot_id.."charge:"..idg,true)
Add_local(idg)
if v.MNSH then
for k,idmsh in pairs(v.MNSH) do
database:sadd('tshake:'..bot_id..'creator:'..idg,idmsh)
end;end
if v.MDER then
for k,idmder in pairs(v.MDER) do
database:sadd('tshake:'..bot_id..'owners:'..idg,idmder)  
end;end
if v.MOD then
for k,idmod in pairs(v.MOD) do
database:sadd('tshake:'..bot_id..'mods:'..idg,idmod)  
end;end
if v.ASAS then
for k,idASAS in pairs(v.ASAS) do
database:sadd('tshake:'..bot_id..'creatorbasic:'..idg,idASAS)  
end;end
if v.linkgroup then
if v.linkgroup ~= "" then
database:set('tshake:'..bot_id.."group:link"..idg,v.linkgroup)   
end;end;end
sendtext(chat,msg.id_,"🔰┇تم رفع الملف بنجاح وتفعيل المجموعات\n📬┇ورفع {الامنشئين الاساسين ; والمنشئين ; والمدراء; والادمنيه} بنجاح")   
end
function tshake_run_(msg,data)
local text = msg.content_.text_
------------------------------------------------------------------------
if text == ("مسح ردود المطور") and is_devabas(msg) then
local list = redis:smembers('tshake:'..bot_id..'sudo:kekore')
for k,v in pairs(list) do
redis:del('tshake:'..bot_id.."sudo:add:reply1:gif"..v)   
redis:del('tshake:'..bot_id.."sudo:add:reply1:vico"..v)   
redis:del('tshake:'..bot_id.."sudo:add:reply1:stekr"..v)     
redis:del('tshake:'..bot_id.."sudo:add:reply:rd"..v)   
redis:del('tshake:'..bot_id.."sudo:addreply1:photo:gp"..v)
redis:del('tshake:'..bot_id.."sudo:addreply1:video:gp"..v)
redis:del('tshake:'..bot_id.."sudo:addreply1:document:gp"..v)
redis:del('tshake:'..bot_id.."sudo:addreply1:audio:gp"..v)
redis:del('tshake:'..bot_id..'sudo:kekore')
end
send(msg.chat_id_, msg.id_, 1, "• `تم مسح ردود المطور` 🗑", 1, 'md')
end

if text == ("ردود المطور") and is_devabas(msg) then
local list = redis:smembers('tshake:'..bot_id..'sudo:kekore')
text = "📑┇قائمه ردود المطور\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
for k,v in pairs(list) do
if redis:get('tshake:'..bot_id.."sudo:add:reply1:gif"..v) then
db = 'متحركه 🎭'
elseif redis:get('tshake:'..bot_id.."sudo:add:reply1:vico"..v) then
db = 'بصمه 📢'
elseif redis:get('tshake:'..bot_id.."sudo:add:reply1:stekr"..v) then
db = 'ملصق 🃏'
elseif redis:get('tshake:'..bot_id.."sudo:add:reply:rd"..v) then
db = 'رساله ✉'
elseif redis:get('tshake:'..bot_id.."sudo:addreply1:photo:gp"..v) then
db = 'صوره 🎇'
elseif redis:get('tshake:'..bot_id.."sudo:addreply1:video:gp"..v) then
db = 'فيديو 📹'
elseif redis:get('tshake:'..bot_id.."sudo:addreply1:document:gp"..v) then
db = 'ملف 📁'
elseif redis:get('tshake:'..bot_id.."sudo:addreply1:audio:gp"..v) then
db = 'اغنيه 🎵'
end
text = text.."<b>|"..k.."|</b>~⪼("..v..") » {"..db.."}\n"
if #text > 7000 then
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
text = ""
end
end
if #list == 0 then
text = "❕┇لا يوجد ردود للمطور"
end
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end
if text or msg.content_.sticker_ or msg.content_.voice_ or msg.content_.animation_ or msg.content_.audio_ or msg.content_.document_ or msg.content_.photo_ or msg.content_.video_ then  
local keko1 = redis:get('tshake:'..bot_id..'sudo:keko1'..msg.sender_user_id_..''..msg.chat_id_..'')
local test = redis:get('tshake:'..bot_id..'sudo:msg'..msg.sender_user_id_..''..msg.chat_id_..'')
if keko1 == 're' then
send(msg.chat_id_, msg.id_, 1, '☑┇تم حفظ الرد', 1, 'md')
redis:set('tshake:'..bot_id..'sudo:keko1'..msg.sender_user_id_..''..msg.chat_id_..'', 'no')
if msg.content_.sticker_ then   
redis:set('tshake:'..bot_id.."sudo:add:reply1:stekr"..test, msg.content_.sticker_.sticker_.persistent_id_)  
end   
if msg.content_.voice_ then  
redis:set('tshake:'..bot_id.."sudo:add:reply1:vico"..test, msg.content_.voice_.voice_.persistent_id_)  
redis:set('tshake:'..bot_id.."sudo:addreply1:voice:caption:gp"..test,(msg.content_.caption_ or ''))  
end   
if msg.content_.animation_ then   
redis:set('tshake:'..bot_id.."sudo:add:reply1:gif"..test, msg.content_.animation_.animation_.persistent_id_)  
redis:set('tshake:'..bot_id.."sudo:addreply1:animation:caption:gp"..test,(msg.content_.caption_ or ''))  
end  
if text then   
text = text:gsub('"','') 
text = text:gsub("'",'') 
text = text:gsub('`','') 
text = text:gsub('*','') 
redis:set('tshake:'..bot_id.."sudo:add:reply:rd"..test, text)  
end  
if msg.content_.audio_ then
redis:set('tshake:'..bot_id.."sudo:addreply1:audio:gp"..test, msg.content_.audio_.audio_.persistent_id_)  
redis:set('tshake:'..bot_id.."sudo:addreply1:audio:caption:gp"..test,(msg.content_.caption_ or ''))  
end
if msg.content_.document_ then
redis:set('tshake:'..bot_id.."sudo:addreply1:document:gp"..test, msg.content_.document_.document_.persistent_id_)  
redis:set('tshake:'..bot_id.."sudo:addreply1:document:caption:gp"..test,(msg.content_.caption_ or ''))  
end
if msg.content_.video_ then
redis:set('tshake:'..bot_id.."sudo:addreply1:video:gp"..test, msg.content_.video_.video_.persistent_id_)  
redis:set('tshake:'..bot_id.."sudo:addreply1:video:caption:gp"..test,(msg.content_.caption_ or ''))  
end
if msg.content_.photo_ then
if msg.content_.photo_.sizes_[0] then
photo_in_group = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[1] then
photo_in_group = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[2] then
photo_in_group = msg.content_.photo_.sizes_[2].photo_.persistent_id_
end	
if msg.content_.photo_.sizes_[3] then
photo_in_group = msg.content_.photo_.sizes_[3].photo_.persistent_id_
end
redis:set('tshake:'..bot_id.."sudo:addreply1:photo:gp"..test, photo_in_group)  
redis:set('tshake:'..bot_id.."sudo:addreply1:photo:caption:gp"..test,(msg.content_.caption_ or ''))  
end
return false  
end  
end
if text and text:match("^(.*)$") then
local keko1 = redis:get('tshake:'..bot_id..'sudo:keko1'..msg.sender_user_id_..''..msg.chat_id_..'')
if keko1 == 'msg' then
send(msg.chat_id_, msg.id_, 1, '📥┇الان ارسل الرد الذي تريد اضافته \n📥┇ قد يكون (ملف - فديو - نص - ملصق - بصمه - متحركه )\n☑┇ يمكنك اضافه الى النص :\n- `#username` > اسم المستخدم\n- `#msgs` > عدد رسائل المستخدم\n- `#name` > اسم المستخدم\n- `#id` > ايدي المستخدم\n- `#stast` > موقع المستخدم \n- `#edit` > عدد السحكات  ', 1, 'md')
redis:set('tshake:'..bot_id..'sudo:keko1'..msg.sender_user_id_..''..msg.chat_id_..'', 're')
redis:set('tshake:'..bot_id..'sudo:msg'..msg.sender_user_id_..''..msg.chat_id_..'', text)
redis:del('tshake:'..bot_id.."sudo:add:reply1:gif"..text)   
redis:del('tshake:'..bot_id.."sudo:add:reply1:vico"..text)   
redis:del('tshake:'..bot_id.."sudo:add:reply1:stekr"..text)     
redis:del('tshake:'..bot_id.."sudo:add:reply:rd"..text)   
redis:del('tshake:'..bot_id.."sudo:addreply1:photo:gp"..text)
redis:del('tshake:'..bot_id.."sudo:addreply1:video:gp"..text)
redis:del('tshake:'..bot_id.."sudo:addreply1:document:gp"..text)
redis:del('tshake:'..bot_id.."sudo:addreply1:audio:gp"..text)
redis:sadd('tshake:'..bot_id..'sudo:kekore', text)
return false end
end
if text and text:match("^(.*)$") then
local keko1 = redis:get('tshake:'..bot_id..'sudo:keko1'..msg.sender_user_id_..''..msg.chat_id_..'')
if keko1 == 'nomsg' then
send(msg.chat_id_, msg.id_, 1, '☑┇تم حذف الرد', 1, 'md')
redis:del('tshake:'..bot_id.."sudo:add:reply1:gif"..text)   
redis:del('tshake:'..bot_id.."sudo:add:reply1:vico"..text)   
redis:del('tshake:'..bot_id.."sudo:add:reply1:stekr"..text)     
redis:del('tshake:'..bot_id.."sudo:add:reply:rd"..text)   
redis:del('tshake:'..bot_id.."sudo:addreply1:photo:gp"..text)
redis:del('tshake:'..bot_id.."sudo:addreply1:video:gp"..text)
redis:del('tshake:'..bot_id.."sudo:addreply1:document:gp"..text)
redis:del('tshake:'..bot_id.."sudo:addreply1:audio:gp"..text)
redis:del('tshake:'..bot_id..'sudo:keko1'..msg.sender_user_id_..''..msg.chat_id_..'')
redis:srem('tshake:'..bot_id..'sudo:kekore', text)
return false
end
end
if text == 'اضف رد للكل' and is_devabas(msg) then
send(msg.chat_id_, msg.id_, 1, '📜┇ ارسل الكلمة التي تريد اضافتها ', 1, 'md')
redis:set('tshake:'..bot_id..'sudo:keko1'..msg.sender_user_id_..''..msg.chat_id_..'', 'msg')
return false 
end
if text == 'حذف رد للكل' and is_devabas(msg) then
send(msg.chat_id_, msg.id_, 1, '📜┇ ارسل الكلمة التي تريد حذفها ', 1, 'md')
redis:set('tshake:'..bot_id..'sudo:keko1'..msg.sender_user_id_..''..msg.chat_id_..'', 'nomsg')
return false 
end
if text and not database:get('tshake:'..bot_id..'repsudo:mute'..msg.chat_id_) then
local anemi = redis:get('tshake:'..bot_id.."sudo:add:reply1:gif"..text)   
local veico = redis:get('tshake:'..bot_id.."sudo:add:reply1:vico"..text)   
local stekr = redis:get('tshake:'..bot_id.."sudo:add:reply1:stekr"..text)     
local text1 = redis:get('tshake:'..bot_id.."sudo:add:reply:rd"..text)   
local photo = redis:get('tshake:'..bot_id.."sudo:addreply1:photo:gp"..text)
local video = redis:get('tshake:'..bot_id.."sudo:addreply1:video:gp"..text)
local document = redis:get('tshake:'..bot_id.."sudo:addreply1:document:gp"..text)
local audio = redis:get('tshake:'..bot_id.."sudo:addreply1:audio:gp"..text)
------------------------------------------------------------------------
local video_caption = (redis:get('tshake:'..bot_id.."sudo:addreply1:video:caption:gp"..text) or '' )
local photo_caption = (redis:get('tshake:'..bot_id.."sudo:addreply1:photo:caption:gp"..text) or '' )
local document_caption = (redis:get('tshake:'..bot_id.."sudo:addreply1:document:caption:gp"..text) or '' )
local audio_caption = (redis:get('tshake:'..bot_id.."sudo:addreply1:audio:caption:gp"..text) or '' )
local animation_caption = (redis:get('tshake:'..bot_id.."sudo:addreply1:animation:caption:gp"..text) or '' )
local voice_caption = (redis:get('tshake:'..bot_id.."sudo:addreply1:voice:caption:gp"..text) or '' )
------------------------------------------------------------------------
if text1 then 
function tshake_re(t1,t2)
local tahna = (database:get('tshake:'..bot_id..'nummsg'..msg.chat_id_..msg.sender_user_id_) or 0)
local user_msgs = ((database:get('tshake:'..bot_id..'user:msgs'..msg.chat_id_..':'..msg.sender_user_id_) or 0) + tahna)
local edit = database:get('tshake:'..bot_id..'user:editmsg'..msg.chat_id_..':'..msg.sender_user_id_) or 0
local t = ""
if msg.sender_user_id_ == tonumber(sudo_add) then
t = 'المطور الاساسي'
elseif is_sudo(msg) then
t = database:get("tshake:name_sudo"..bot_id..msg.chat_id_)  or 'مطور البوت '
elseif is_creatorbasic(msg) then
t = database:get("tshake:name_cre"..bot_id..msg.chat_id_) or 'منشئ اساسي '
elseif (database:get("tshake:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_) and database:get("tshake:all_sl:"..database:get("tshake:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_) ..bot_id..msg.chat_id_)) then 
t = database:get("tshake:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_)
elseif is_creator(msg) then
t = database:get("tshake:name_cre"..bot_id..msg.chat_id_) or 'منشئ الكروب '
elseif (database:get("tshake:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_) and database:get("tshake:all_sl:"..database:get("tshake:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_) ..bot_id..msg.chat_id_)) then 
t = database:get("tshake:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_)
elseif is_owner(msg) then
t = database:get("tshake:name_own"..bot_id..msg.chat_id_) or 'مدير الكروب '
elseif is_mod(msg) then
t = database:get("tshake:name_adm"..bot_id..msg.chat_id_) or 'ادمن الكروب'
elseif is_vip(msg) then
t = database:get("tshake:name_vipp"..bot_id..msg.chat_id_) or ' عضو مميز '
else
t = database:get("tshake:name_nk"..bot_id..msg.chat_id_) or 'عضو فقط ' 
end
local text1 = text1:gsub('#username',(t2.username_ or 'لا يوجد')) 
local text1 = text1:gsub('#name',(t2.first_name_ or 'لا يوجد'))
local text1 = text1:gsub('#id',(msg.sender_user_id_ or 'لا يوجد'))
local text1 = text1:gsub('#edit',(edit or 'لا يوجد'))
local text1 = text1:gsub('#msgs',(user_msgs or 'لا يوجد'))
local text1 = text1:gsub('#stast',(t or 'لا يوجد'))
send(msg.chat_id_, msg.id_, 1, text1, 1, 'md')
end
getUser(msg.sender_user_id_, tshake_re)
end
if stekr then 
sendSticker(msg.chat_id_, msg.id_, 0, 1, nil, stekr)   
end
if veico then 
sendVoice(msg.chat_id_, msg.id_, 0, 1, nil, veico)   
end
if video then 
sendVideo(msg.chat_id_, msg.id_, 0, 1, nil,video)
end
if anemi then 
sendDocument(msg.chat_id_, msg.id_, 0, 1, nil, anemi, '', nil)  
end
if document then
sendDocument(msg.chat_id_, msg.id_, 0, 1,nil, document)   
end  
if audio then
sendAudio(msg.chat_id_,msg.id_,audio)  
end
if photo then
sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil,photo,photo_caption)
end  
end

if text == ("مسح ردود المدير") and is_owner(msg) then
local list = redis:smembers('tshake:'..bot_id..'kekore'..msg.chat_id_..'')
for k,v in pairs(list) do
redis:del('tshake:'..bot_id.."add:reply1:gif"..v..msg.chat_id_)   
redis:del('tshake:'..bot_id.."add:reply1:vico"..v..msg.chat_id_)   
redis:del('tshake:'..bot_id.."add:reply1:stekr"..text..msg.chat_id_)     
redis:del('tshake:'..bot_id.."add:reply:rd"..v..msg.chat_id_)   
redis:del('tshake:'..bot_id.."addreply1:photo:gp"..v..msg.chat_id_)
redis:del('tshake:'..bot_id.."addreply1:video:gp"..v..msg.chat_id_)
redis:del('tshake:'..bot_id.."addreply1:document:gp"..v..msg.chat_id_)
redis:del('tshake:'..bot_id.."addreply1:audio:gp"..v..msg.chat_id_)
redis:del('tshake:'..bot_id..'kekore'..msg.chat_id_..'')
end
send(msg.chat_id_, msg.id_, 1, "• `تم مسح ردود المدير` 🗑", 1, 'md')
end

if text == ("ردود المدير") and is_owner(msg) then
local list = redis:smembers('tshake:'..bot_id..'kekore'..msg.chat_id_..'')
text = "📑┇قائمه ردود المدير\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
for k,v in pairs(list) do
if redis:get('tshake:'..bot_id.."add:reply1:gif"..v..msg.chat_id_) then
db = 'متحركه 🎭'
elseif redis:get('tshake:'..bot_id.."add:reply1:vico"..v..msg.chat_id_) then
db = 'بصمه 📢'
elseif redis:get('tshake:'..bot_id.."add:reply1:stekr"..v..msg.chat_id_) then
db = 'ملصق 🃏'
elseif redis:get('tshake:'..bot_id.."add:reply:rd"..v..msg.chat_id_) then
db = 'رساله ✉'
elseif redis:get('tshake:'..bot_id.."addreply1:photo:gp"..v..msg.chat_id_) then
db = 'صوره 🎇'
elseif redis:get('tshake:'..bot_id.."addreply1:video:gp"..v..msg.chat_id_) then
db = 'فيديو 📹'
elseif redis:get('tshake:'..bot_id.."addreply1:document:gp"..v..msg.chat_id_) then
db = 'ملف 📁'
elseif redis:get('tshake:'..bot_id.."addreply1:audio:gp"..v..msg.chat_id_) then
db = 'اغنيه 🎵'
end
text = text.."<b>|"..k.."|</b>~⪼("..v..") » {"..db.."}\n"
if #text > 7000 then
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
text = ""
end
end
if #list == 0 then
text = "❕┇لا يوجد ردود للمدير"
end
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end
if text or msg.content_.sticker_ or msg.content_.voice_ or msg.content_.animation_ or msg.content_.audio_ or msg.content_.document_ or msg.content_.photo_ or msg.content_.video_ then  
local keko1 = redis:get('tshake:'..bot_id..'keko1'..msg.sender_user_id_..''..msg.chat_id_..'')
local test = redis:get('tshake:'..bot_id..'msg'..msg.sender_user_id_..''..msg.chat_id_..'')
if keko1 == 're' then
send(msg.chat_id_, msg.id_, 1, '☑┇تم حفظ الرد', 1, 'md')
redis:set('tshake:'..bot_id..'keko1'..msg.sender_user_id_..''..msg.chat_id_..'', 'no')
if msg.content_.sticker_ then   
redis:set('tshake:'..bot_id.."add:reply1:stekr"..test..msg.chat_id_, msg.content_.sticker_.sticker_.persistent_id_)  
end   
if msg.content_.voice_ then  
redis:set('tshake:'..bot_id.."add:reply1:vico"..test..msg.chat_id_, msg.content_.voice_.voice_.persistent_id_)  
redis:set('tshake:'..bot_id.."addreply1:voice:caption:gp"..test..msg.chat_id_,(msg.content_.caption_ or ''))  
end   
if msg.content_.animation_ then   
redis:set('tshake:'..bot_id.."add:reply1:gif"..test..msg.chat_id_, msg.content_.animation_.animation_.persistent_id_)  
redis:set('tshake:'..bot_id.."addreply1:animation:caption:gp"..test..msg.chat_id_,(msg.content_.caption_ or ''))  
end  
if text then   
text = text:gsub('"','') 
text = text:gsub("'",'') 
text = text:gsub('`','') 
text = text:gsub('*','') 
redis:set('tshake:'..bot_id.."add:reply:rd"..test..msg.chat_id_, text)  
end  
if msg.content_.audio_ then
redis:set('tshake:'..bot_id.."addreply1:audio:gp"..test..msg.chat_id_, msg.content_.audio_.audio_.persistent_id_)  
redis:set('tshake:'..bot_id.."addreply1:audio:caption:gp"..test..msg.chat_id_,(msg.content_.caption_ or ''))  
end
if msg.content_.document_ then
redis:set('tshake:'..bot_id.."addreply1:document:gp"..test..msg.chat_id_, msg.content_.document_.document_.persistent_id_)  
redis:set('tshake:'..bot_id.."addreply1:document:caption:gp"..test..msg.chat_id_,(msg.content_.caption_ or ''))  
end
if msg.content_.video_ then
redis:set('tshake:'..bot_id.."addreply1:video:gp"..test..msg.chat_id_, msg.content_.video_.video_.persistent_id_)  
redis:set('tshake:'..bot_id.."addreply1:video:caption:gp"..test..msg.chat_id_,(msg.content_.caption_ or ''))  
end
if msg.content_.photo_ then
if msg.content_.photo_.sizes_[0] then
photo_in_group = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[1] then
photo_in_group = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[2] then
photo_in_group = msg.content_.photo_.sizes_[2].photo_.persistent_id_
end	
if msg.content_.photo_.sizes_[3] then
photo_in_group = msg.content_.photo_.sizes_[3].photo_.persistent_id_
end
redis:set('tshake:'..bot_id.."addreply1:photo:gp"..test..msg.chat_id_, photo_in_group)  
redis:set('tshake:'..bot_id.."addreply1:photo:caption:gp"..test..msg.chat_id_,(msg.content_.caption_ or ''))  
end
return false  
end  
end
if text and text:match("^(.*)$") then
local keko1 = redis:get('tshake:'..bot_id..'keko1'..msg.sender_user_id_..''..msg.chat_id_..'')
if keko1 == 'msg' then
send(msg.chat_id_, msg.id_, 1, '📥┇الان ارسل الرد الذي تريد اضافته \n📥┇ قد يكون (ملف - فديو - نص - ملصق - بصمه - متحركه )\n☑┇ يمكنك اضافه الى النص :\n- `#username` > اسم المستخدم\n- `#msgs` > عدد رسائل المستخدم\n- `#name` > اسم المستخدم\n- `#id` > ايدي المستخدم\n- `#stast` > موقع المستخدم \n- `#edit` > عدد السحكات  ', 1, 'md')
redis:set('tshake:'..bot_id..'keko1'..msg.sender_user_id_..''..msg.chat_id_..'', 're')
redis:set('tshake:'..bot_id..'msg'..msg.sender_user_id_..''..msg.chat_id_..'', text)
redis:del('tshake:'..bot_id.."add:reply1:gif"..text..msg.chat_id_)   
redis:del('tshake:'..bot_id.."add:reply1:vico"..text..msg.chat_id_)   
redis:del('tshake:'..bot_id.."add:reply1:stekr"..text..msg.chat_id_)     
redis:del('tshake:'..bot_id.."add:reply:rd"..text..msg.chat_id_)   
redis:del('tshake:'..bot_id.."addreply1:photo:gp"..text..msg.chat_id_)
redis:del('tshake:'..bot_id.."addreply1:video:gp"..text..msg.chat_id_)
redis:del('tshake:'..bot_id.."addreply1:document:gp"..text..msg.chat_id_)
redis:del('tshake:'..bot_id.."addreply1:audio:gp"..text..msg.chat_id_)
redis:sadd('tshake:'..bot_id..'kekore'..msg.chat_id_..'', text)
return false end
end
if text and text:match("^(.*)$") then
local keko1 = redis:get('tshake:'..bot_id..'keko1'..msg.sender_user_id_..''..msg.chat_id_..'')
if keko1 == 'nomsg' then
send(msg.chat_id_, msg.id_, 1, '☑┇تم حذف الرد', 1, 'md')
redis:del('tshake:'..bot_id.."add:reply1:gif"..text..msg.chat_id_)   
redis:del('tshake:'..bot_id.."add:reply1:vico"..text..msg.chat_id_)   
redis:del('tshake:'..bot_id.."add:reply1:stekr"..text..msg.chat_id_)     
redis:del('tshake:'..bot_id.."add:reply:rd"..text..msg.chat_id_)   
redis:del('tshake:'..bot_id.."addreply1:photo:gp"..text..msg.chat_id_)
redis:del('tshake:'..bot_id.."addreply1:video:gp"..text..msg.chat_id_)
redis:del('tshake:'..bot_id.."addreply1:document:gp"..text..msg.chat_id_)
redis:del('tshake:'..bot_id.."addreply1:audio:gp"..text..msg.chat_id_)
redis:del('tshake:'..bot_id..'keko1'..msg.sender_user_id_..''..msg.chat_id_..'')
redis:srem('tshake:'..bot_id..'kekore'..msg.chat_id_..'', text)
return false
end
end
if text == 'اضف رد' and is_owner(msg) then
send(msg.chat_id_, msg.id_, 1, '📜┇ ارسل الكلمة التي تريد اضافتها ', 1, 'md')
redis:set('tshake:'..bot_id..'keko1'..msg.sender_user_id_..''..msg.chat_id_..'', 'msg')
return false 
end
if text == 'حذف رد' and is_owner(msg) then
send(msg.chat_id_, msg.id_, 1, '📜┇ ارسل الكلمة التي تريد حذفها ', 1, 'md')
redis:set('tshake:'..bot_id..'keko1'..msg.sender_user_id_..''..msg.chat_id_..'', 'nomsg')
return false 
end
if text and not database:get('tshake:'..bot_id..'repowner:mute'..msg.chat_id_) then
local anemi = redis:get('tshake:'..bot_id.."add:reply1:gif"..text..msg.chat_id_)   
local veico = redis:get('tshake:'..bot_id.."add:reply1:vico"..text..msg.chat_id_)   
local stekr = redis:get('tshake:'..bot_id.."add:reply1:stekr"..text..msg.chat_id_)     
local text1 = redis:get('tshake:'..bot_id.."add:reply:rd"..text..msg.chat_id_)   
local photo = redis:get('tshake:'..bot_id.."addreply1:photo:gp"..text..msg.chat_id_)
local video = redis:get('tshake:'..bot_id.."addreply1:video:gp"..text..msg.chat_id_)
local document = redis:get('tshake:'..bot_id.."addreply1:document:gp"..text..msg.chat_id_)
local audio = redis:get('tshake:'..bot_id.."addreply1:audio:gp"..text..msg.chat_id_)
------------------------------------------------------------------------
local video_caption = (redis:get('tshake:'..bot_id.."addreply1:video:caption:gp"..text..msg.chat_id_) or '' )
local photo_caption = (redis:get('tshake:'..bot_id.."addreply1:photo:caption:gp"..text..msg.chat_id_) or '' )
local document_caption = (redis:get('tshake:'..bot_id.."addreply1:document:caption:gp"..text..msg.chat_id_) or '' )
local audio_caption = (redis:get('tshake:'..bot_id.."addreply1:audio:caption:gp"..text..msg.chat_id_) or '' )
local animation_caption = (redis:get('tshake:'..bot_id.."addreply1:animation:caption:gp"..text..msg.chat_id_) or '' )
local voice_caption = (redis:get('tshake:'..bot_id.."addreply1:voice:caption:gp"..text..msg.chat_id_) or '' )
------------------------------------------------------------------------
if text1 then 
function tshake_re(t1,t2)
local tahna = (database:get('tshake:'..bot_id..'nummsg'..msg.chat_id_..msg.sender_user_id_) or 0)
local user_msgs = ((database:get('tshake:'..bot_id..'user:msgs'..msg.chat_id_..':'..msg.sender_user_id_) or 0) + tahna)
local edit = database:get('tshake:'..bot_id..'user:editmsg'..msg.chat_id_..':'..msg.sender_user_id_) or 0
local t = ""
if msg.sender_user_id_ == tonumber(sudo_add) then
t = 'المطور الاساسي'
elseif is_sudo(msg) then
t = database:get("tshake:name_sudo"..bot_id..msg.chat_id_)  or 'مطور البوت '
elseif is_creatorbasic(msg) then
t = database:get("tshake:name_cre"..bot_id..msg.chat_id_) or 'منشئ اساسي '
elseif (database:get("tshake:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_) and database:get("tshake:all_sl:"..database:get("tshake:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_) ..bot_id..msg.chat_id_)) then 
t = database:get("tshake:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_)
elseif is_creator(msg) then
t = database:get("tshake:name_cre"..bot_id..msg.chat_id_) or 'منشئ الكروب '
elseif (database:get("tshake:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_) and database:get("tshake:all_sl:"..database:get("tshake:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_) ..bot_id..msg.chat_id_)) then 
t = database:get("tshake:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_)
elseif is_owner(msg) then
t = database:get("tshake:name_own"..bot_id..msg.chat_id_) or 'مدير الكروب '
elseif is_mod(msg) then
t = database:get("tshake:name_adm"..bot_id..msg.chat_id_) or 'ادمن الكروب'
elseif is_vip(msg) then
t = database:get("tshake:name_vipp"..bot_id..msg.chat_id_) or ' عضو مميز '
else
t = database:get("tshake:name_nk"..bot_id..msg.chat_id_) or 'عضو فقط ' 
end
local text1 = text1:gsub('#username',(t2.username_ or 'لا يوجد')) 
local text1 = text1:gsub('#name',(t2.first_name_ or 'لا يوجد'))
local text1 = text1:gsub('#id',(msg.sender_user_id_ or 'لا يوجد'))
local text1 = text1:gsub('#edit',(edit or 'لا يوجد'))
local text1 = text1:gsub('#msgs',(user_msgs or 'لا يوجد'))
local text1 = text1:gsub('#stast',(t or 'لا يوجد'))
send(msg.chat_id_, msg.id_, 1, text1, 1, 'md')
end
getUser(msg.sender_user_id_, tshake_re)
end
if stekr then 
sendSticker(msg.chat_id_, msg.id_, 0, 1, nil, stekr)   
end
if veico then 
sendVoice(msg.chat_id_, msg.id_, 0, 1, nil, veico)   
end
if video then 
sendVideo(msg.chat_id_, msg.id_, 0, 1, nil,video)
end
if anemi then 
sendDocument(msg.chat_id_, msg.id_, 0, 1,nil, anemi)   
end
if document then
sendDocument(msg.chat_id_, msg.id_, 0, 1,nil, document)   
end  
if audio then
sendAudio(msg.chat_id_,msg.id_,audio)  
end
if photo then
sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil,photo,photo_caption)
end  
end

------------------------------------------------------------------------
if database:get('tshake:'..bot_id.."bc:in:pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) and is_sudo(msg) then 
if text and text:match("^الغاء$") or text and text:match("^الغاء ✖$") then   
send(msg.chat_id_, msg.id_, 1, "*📬┇ تم الغاء الاذاعه للمشتركين *\n", 1, "md") 
database:del('tshake:'..bot_id.."bc:in:pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
else 
local gps = database:scard('tshake:'..bot_id.."userss") or 0 
if msg.content_.text_ then
whatbc = 'الرساله'
local list = database:smembers('tshake:'..bot_id..'userss') 
for k,v in pairs(list) do 
send(v, 0, 1, '[ '..msg.content_.text_..' ]', 1, 'md')  
end
elseif msg.content_.photo_ then
whatbc = 'الصور'
if msg.content_.photo_.sizes_[0] then
photo = msg.content_.photo_.sizes_[0].photo_.persistent_id_
elseif msg.content_.photo_.sizes_[1] then
photo = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
local list = database:smembers('tshake:'..bot_id..'userss') 
for k,v in pairs(list) do 
tdcli.sendPhoto(v, 0, 0, 1, nil, photo,(msg.content_.caption_ or ''))
end 
elseif msg.content_.animation_ then
whatbc = 'المتحركه'
local list = database:smembers('tshake:'..bot_id..'userss') 
for k,v in pairs(list) do 
tdcli.sendDocument(v, 0,0, 1, nil, msg.content_.animation_.animation_.persistent_id_)
end 
elseif msg.content_.sticker_ then
whatbc = 'الملصق'
local list = database:smembers('tshake:'..bot_id..'userss') 
for k,v in pairs(list) do 
tdcli.sendSticker(v, 0,0, 1, nil, msg.content_.sticker_.sticker_.persistent_id_)
end 
end
send(msg.chat_id_, msg.id_, 1, '☑┇تم نشر الرساله الى {'..(gps)..'} مشترك ', 1, 'md')
database:del('tshake:'..bot_id.."bc:in:pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_) 
end 
return false
end 
------------------------------------------------------------------------
if database:get("tshake:set_if_bc_new:"..bot_id..msg.sender_user_id_) and is_sudo(msg) then  
database:del("tshake:set_if_bc_new:"..bot_id..msg.sender_user_id_)
local pro = database:scard('tshake:'..bot_id..'pro:groups') or 0
if text then 
local gpss = database:smembers( 'tshake:'..bot_id.."groups") or 0
for i=1, #gpss do
send(gpss[i], 0, 1, text, 1, 'html')		
end					
end
if (data.message_.content_.sticker_) then 
gpss = database:smembers( 'tshake:'..bot_id.."groups") or 0
for i=1, #gpss do
tdcli.sendSticker(gpss[i], 0,0, 1, nil, data.message_.content_.sticker_.sticker_.persistent_id_)
end
elseif (data.message_.content_.voice_) then 
gpss = database:smembers( 'tshake:'..bot_id.."groups") or 0
for i=1, #gpss do
tdcli.sendVoice(gpss[i], 0,0, 1, nil, data.message_.content_.voice_.voice_.persistent_id_)
end
elseif (data.message_.content_.video_) then 
gpss = database:smembers( 'tshake:'..bot_id.."groups") or 0
for i=1, #gpss do
tdcli.sendVideo(gpss[i], 0,0, 1, nil, data.message_.content_.video_.video_.persistent_id_)
end
elseif (data.message_.content_.animation_) then 
gpss = database:smembers( 'tshake:'..bot_id.."groups") or 0
for i=1, #gpss do
tdcli.sendDocument(gpss[i], 0,0, 1, nil, data.message_.content_.animation_.animation_.persistent_id_)
end
elseif (data.message_.content_.document_) then
gpss = database:smembers( 'tshake:'..bot_id.."groups") or 0
for i=1, #gpss do
tdcli.sendDocument(gpss[i], 0,0, 1, nil, data.message_.content_.document_.document_.persistent_id_)
end
elseif (data.message_.content_.photo_) then
local id_keko = nil
if data.message_.content_.photo_.sizes_[0] then
id_keko = data.message_.content_.photo_.sizes_[0].photo_.persistent_id_
end
if data.message_.content_.photo_.sizes_[1] then
id_keko = data.message_.content_.photo_.sizes_[1].photo_.persistent_id_
end
if data.message_.content_.photo_.sizes_[2] then
id_keko = data.message_.content_.photo_.sizes_[2].photo_.persistent_id_
end	
if data.message_.content_.photo_.sizes_[3] then
id_keko = data.message_.content_.photo_.sizes_[3].photo_.persistent_id_
end
gpss = database:smembers( 'tshake:'..bot_id.."groups") or 0
for i=1, #gpss do
tdcli.sendPhoto(gpss[i], 0, 0, 1, nil, id_keko,(msg.content_.caption_ or " "))					
end
end
gpss = database:smembers( 'tshake:'..bot_id.."groups") or 0
send(msg.chat_id_, msg.id_, 1, '☑┇تم نشر الرساله في {'..(#gpss)..'} مجموعه ', 1, 'md')
return false
end
------------------------------------------------------------------------
if database:get("tshake:set_if_bc_new:pin"..bot_id..msg.sender_user_id_) and is_sudo(msg) then  
database:del("tshake:set_if_bc_new:pin"..bot_id..msg.sender_user_id_)
local pro = database:scard('tshake:'..bot_id..'pro:groups') or 0
if text then 
local gpss = database:smembers( 'tshake:'..bot_id.."groups") or 0
for i=1, #gpss do
send(gpss[i], 0, 1, text, 1, 'html')	
database:set('tshake:'..bot_id..'Msg_Text'..gpss[i],text) 
end					
end
if (data.message_.content_.sticker_) then 
print(data.message_.content_.sticker_.sticker_.persistent_id_)
gpss = database:smembers( 'tshake:'..bot_id.."groups") or 0
for i=1, #gpss do
tdcli.sendSticker(gpss[i], 0,0, 1, nil, data.message_.content_.sticker_.sticker_.persistent_id_)
database:set('tshake:'..bot_id..'Msg_Text'..gpss[i],data.message_.content_.sticker_.sticker_.persistent_id_) 
end
elseif (data.message_.content_.voice_) then 
gpss = database:smembers( 'tshake:'..bot_id.."groups") or 0
for i=1, #gpss do
tdcli.sendVoice(gpss[i], 0,0, 1, nil, data.message_.content_.voice_.voice_.persistent_id_)
database:set('tshake:'..bot_id..'Msg_Text'..gpss[i],data.message_.content_.voice_.voice_.persistent_id_) 
end
elseif (data.message_.content_.video_) then 
gpss = database:smembers( 'tshake:'..bot_id.."groups") or 0
for i=1, #gpss do
tdcli.sendVideo(gpss[i], 0,0, 1, nil, data.message_.content_.video_.video_.persistent_id_)
database:set('tshake:'..bot_id..'Msg_Text'..gpss[i],data.message_.content_.video_.video_.persistent_id_) 
end
elseif (data.message_.content_.animation_) then 
gpss = database:smembers( 'tshake:'..bot_id.."groups") or 0
for i=1, #gpss do
tdcli.sendDocument(gpss[i], 0,0, 1, nil, data.message_.content_.animation_.animation_.persistent_id_)
database:set('tshake:'..bot_id..'Msg_Text'..gpss[i],data.message_.content_.animation_.animation_.persistent_id_) 
end
elseif (data.message_.content_.document_) then
gpss = database:smembers( 'tshake:'..bot_id.."groups") or 0
for i=1, #gpss do
tdcli.sendDocument(gpss[i], 0,0, 1, nil, data.message_.content_.document_.document_.persistent_id_)
database:set('tshake:'..bot_id..'Msg_Text'..gpss[i],data.message_.content_.document_.document_.persistent_id_) 
end
elseif (data.message_.content_.photo_) then
local id_keko = nil
if data.message_.content_.photo_.sizes_[0] then
id_keko = data.message_.content_.photo_.sizes_[0].photo_.persistent_id_
end
if data.message_.content_.photo_.sizes_[1] then
id_keko = data.message_.content_.photo_.sizes_[1].photo_.persistent_id_
end
if data.message_.content_.photo_.sizes_[2] then
id_keko = data.message_.content_.photo_.sizes_[2].photo_.persistent_id_
end	
if data.message_.content_.photo_.sizes_[3] then
id_keko = data.message_.content_.photo_.sizes_[3].photo_.persistent_id_
end
gpss = database:smembers( 'tshake:'..bot_id.."groups") or 0
for i=1, #gpss do
tdcli.sendPhoto(gpss[i], 0, 0, 1, nil, id_keko,(msg.content_.caption_ or " "))		
database:set('tshake:'..bot_id..'Msg_Text'..gpss[i],id_keko) 
end
end
gpss = database:smembers( 'tshake:'..bot_id.."groups") or 0
send(msg.chat_id_, msg.id_, 1, '☑┇تم نشر الرساله في {'..(#gpss)..'} مجموعه ', 1, 'md')
return false
end
------------------------------------------------------------------------

------------------------------------------------------------------------
if text and text:match("^(.*)$") then
local keko2 = redis:get('tshake:'..bot_id..'texts'..msg.sender_user_id_..'')
if keko2 == 'msg' then
send(msg.chat_id_, msg.id_, 1, '☑┇تم حفظ الكليشه يمكنك اظهارها بارسال الامر', 1, 'html')
redis:set('tshake:'..bot_id..'texts'..msg.sender_user_id_..'', 'no')
redis:set('tshake:'..bot_id..'text_sudo', text)
send(msg.chat_id_, msg.id_, 1, text , 1, 'html')
return false 
end
end
------------------------------------------------------------------------
if text and text:match("^(.*)$") then
local keko2 = redis:get('tshake:'..bot_id..'textst'..msg.sender_user_id_..'')
if keko2 == 'msg' then
send(msg.chat_id_, msg.id_, 1, '🙋🏻‍♂️┇ تم حفظ الاسم ', 1, 'html')
redis:set('tshake:'..bot_id..'textst'..msg.sender_user_id_..'', 'no')
redis:set('tshake:'..bot_id..'name_bot', text)
return false 
end
end
------------------------------------------------------------------------
if text and text:match("^+(.*)$") then
local kekoo = redis:get('tshake:'..bot_id..'sudoo'..text..'')
local keko2 = redis:get('tshake:'..bot_id..'nkeko'..msg.sender_user_id_..'')
if keko2 == 'msg' then
send(msg.chat_id_, msg.id_, 1, '• `الان يمكنك ارسال الاسم الذي تريده` 🏷', 1, 'md')
redis:set('tshake:'..bot_id..'nmkeko', text)
redis:set('tshake:'..bot_id..'nkeko'..msg.sender_user_id_..'', 'mmsg')
return false 
end
end
------------------------------------------------------------------------
if text and text:match("^(.*)$") then
local keko2 = redis:get('tshake:'..bot_id..'nkeko'..msg.sender_user_id_..'')
if keko2 == 'mmsg' then
send(msg.chat_id_, msg.id_, 1, '• `تم حفظ الاسم يمكنك اظهار الجه بـ ارسال امر المطور` ☑', 1, 'md')
redis:set('tshake:'..bot_id..'nkeko'..msg.sender_user_id_..'', 'no')
redis:set('tshake:'..bot_id..'nakeko', text)
local nmkeko = redis:get('tshake:'..bot_id..'nmkeko')
sendContact(msg.chat_id_, msg.id_, 0, 1, nil, nmkeko, text , "", bot_id)
return false 
end
end
------------------------------------------------------------------------
if text and database:get("keko:set:ttt:p"..bot_id..msg.sender_user_id_) then 
send(msg.chat_id_, msg.id_, 1, '📥┇اراسل لان النص الذي يضهر', 1, 'md')
database:set("keko:set:ttt:p2"..bot_id..msg.sender_user_id_,true)
database:set("keko:set:ttt:ppp:"..bot_id..msg.sender_user_id_,text)
database:del("keko:set:ttt:p"..bot_id..msg.sender_user_id_)
end
------------------------------------------------------------------------
if text and database:get("keko:set:ttt:p2"..bot_id..msg.sender_user_id_) then 
send(msg.chat_id_, msg.id_, 1, '☑┇تم الحفط', 1, 'md')
keko = database:get("keko:set:ttt:ppp:"..bot_id..msg.sender_user_id_)
database:sadd("keko:all:pppp:tt:"..bot_id,keko)
database:set("keko:set:text:p"..bot_id..keko,text)
database:del("keko:set:ttt:p2"..bot_id..msg.sender_user_id_)
end 
------------------------------------------------------------------------
if text and database:get("keko:set:ttt:p:Del"..bot_id..msg.sender_user_id_) then 
send(msg.chat_id_, msg.id_, 1, '📥┇اراسل لان التص الذي يضهر', 1, 'md')
database:del("keko:set:text:p"..bot_id..text)
database:srem('keko:all:pppp:tt:'..bot_id,text)
database:del("keko:set:ttt:p:Del"..bot_id..msg.sender_user_id_)
return "keko"
end
------------------------------------------------------------------------
if text and database:get("tsahke:set:id:"..bot_id..msg.chat_id_..msg.sender_user_id_) then 
database:del("tsahke:set:id:"..bot_id..msg.chat_id_..msg.sender_user_id_)
send(msg.chat_id_, msg.id_, 1,  '☑┇ تم الحفض بنجاح', 1, 'md')
database:set("tshake:gr:id:text:"..bot_id..msg.chat_id_,text)
end
------------------------------------------------------------------------
if text and text:match("^(.*)$") then
local keko2 = redis:get('tshake:'..bot_id..'h44'..msg.sender_user_id_..'')
if keko2 == 'msg' then
send(msg.chat_id_, msg.id_, 1, '☑┇تم حفظ الكليشه يمكنك اظهارها بارسال الامر', 1, 'html')
redis:set('tshake:'..bot_id..'h44'..msg.sender_user_id_..'', 'no')
redis:set('tshake:'..bot_id..'h4', text)
send(msg.chat_id_, msg.id_, 1, text , 1, 'html')
return false
end
end
------------------------------------------------------------------------
if text and text:match("^(.*)$") then
local keko2 = redis:get('tshake:'..bot_id..'h33'..msg.sender_user_id_..'')
if keko2 == 'msg' then
send(msg.chat_id_, msg.id_, 1, '☑┇تم حفظ الكليشه يمكنك اظهارها بارسال الامر', 1, 'html')
redis:set('tshake:'..bot_id..'h33'..msg.sender_user_id_..'', 'no')
redis:set('tshake:'..bot_id..'h3', text)
send(msg.chat_id_, msg.id_, 1, text , 1, 'html')
return false 
end
end
------------------------------------------------------------------------
if text and text:match("^(.*)$") then
local keko2 = redis:get('tshake:'..bot_id..'h22'..msg.sender_user_id_..'')
if keko2 == 'msg' then
send(msg.chat_id_, msg.id_, 1, '☑┇تم حفظ الكليشه يمكنك اظهارها بارسال الامر', 1, 'html')
redis:set('tshake:'..bot_id..'h22'..msg.sender_user_id_..'', 'no')
redis:set('tshake:'..bot_id..'h2', text)
send(msg.chat_id_, msg.id_, 1, text , 1, 'html')
return false 
end
end
------------------------------------------------------------------------
if text and text:match("^(.*)$") then
local keko2 = redis:get('tshake:'..bot_id..'h11'..msg.sender_user_id_..'')
if keko2 == 'msg' then
send(msg.chat_id_, msg.id_, 1, '☑┇تم حفظ الكليشه يمكنك اظهارها بارسال الامر', 1, 'html')
redis:set('tshake:'..bot_id..'h11'..msg.sender_user_id_..'', 'no')
redis:set('tshake:'..bot_id..'h1', text)
send(msg.chat_id_, msg.id_, 1, text , 1, 'html')
return false 
end
end
------------------------------------------------------------------------
if text and text:match("^(.*)$") then
local keko2 = redis:get('tshake:'..bot_id..'hhh'..msg.sender_user_id_..'')
if keko2 == 'msg' then
send(msg.chat_id_, msg.id_, 1, '☑┇تم حفظ الكليشه يمكنك اظهارها بارسال الامر', 1, 'html')
redis:set('tshake:'..bot_id..'hhh'..msg.sender_user_id_..'', 'no')
redis:set('tshake:'..bot_id..'help', text)
send(msg.chat_id_, msg.id_, 1, text , 1, 'html')
return false 
end
end
------------------------------------------------------------------------
local keko2 = redis:get('tshake:'..bot_id..'hres1'..msg.sender_user_id_..'')
if keko2 == 'msg' then
if text:match("^(.*)$") then
send(msg.chat_id_, msg.id_, 1, '☑┇تم حفظ الكليشه يمكنك اظهارها بارسال الامر', 1, 'html')
redis:set('tshake:'..bot_id..'hres1'..msg.sender_user_id_..'', 'no')
redis:set('tshake:'..bot_id..'hres', text)
send(msg.chat_id_, msg.id_, 1, text , 1, 'html')
return false 
end
end
------------------------------------------------------------------------
if msg.content_.ID == "MessageChatJoinByLink" then
if database:get("lock_kansers:tshake"..msg.chat_id_..bot_id) then
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
local last_ = data.last_name_ or ''
local first_ = data.first_name_ or ''
taha = (first_..''..last_)
Num = (database:get('tshake:'..bot_id..'Num:kansers'..msg.chat_id_) or 25)
if string.len(taha) > tonumber(Num) then
send(msg.chat_id_, msg.id_, 1, '📛┇ عذرا غير مرحب بك هنا',1, 'md')
chat_kick(msg.chat_id_, msg.sender_user_id_)
end
end,nil)   
return false
end
function get_welcome(extra,result,success)
if database:get('tshake:'..bot_id..'welcome:'..msg.chat_id_) then
text = database:get('tshake:'..bot_id..'welcome:'..msg.chat_id_)
else
text = '👋🏻┇اهلا بك يا ؛ {fr}\n🙋🏼‍♂️┇نورت الكروب ؛ @{us}'
end
local text = text:gsub('{fr}',(result.first_name_ or 'لا يوجد'))
local text = text:gsub('{ls}',(result.last_name_ or 'لا يوجد'))
local text = text:gsub('{us}',(result.username_ or 'لا يوجد'))
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end
if database:get('tshake:'..bot_id.."welcome"..msg.chat_id_) then
getUser(msg.sender_user_id_,get_welcome)
end 
end
------------------------------------------------------------------------
if text and not is_mod(msg) then  
local taha = database:get('tshake:'..bot_id.."filtr1:add:reply:rd"..text..msg.chat_id_)   
if taha then    
function get_info(arg,data)
if data.username_ ~= false then
send(msg.chat_id_,0, 1, "⚠┇العضو : {["..data.first_name_.."](T.ME/"..data.username_..")}\n📛┇["..taha.."] \n" , 1, 'md') 
else
send(msg.chat_id_,0, 1, "⚠┇العضو : {["..data.first_name_.."](T.ME/TSHAKETEAM)}\n📛┇["..taha.."] \n" , 1, 'md') 
end
end
getUser(msg.sender_user_id_,get_info)
delete_msg(msg.chat_id_, {[0] = msg.id_})     
return false
end
end
------------------------------------------------------------------------
if msg.content_.ID == 'MessageSticker' and not is_owner(msg) then 
local filter = database:smembers('tshake:'..bot_id.."filtersteckr"..msg.chat_id_)
for k,v in pairs(filter) do
if v == msg.content_.sticker_.set_id_ then
function get_info(arg,data)
if data.username_ ~= false then
send(msg.chat_id_,0, 1, "⚠┇عذرا يا » { (@"..data.username_..")}\n📛┇ الملصق الذي ارسلته تم منعه من المجموعه \n" , 1, 'html') 
else
send(msg.chat_id_,0, 1, "⚠┇عذرا يا » {["..data.first_name_.."](T.ME/TSHAKETEAM)}\n📛┇ الملصق الذي ارسلته تم منعه من المجموعه \n" , 1, 'md') 
end
end
getUser(msg.sender_user_id_,get_info)
delete_msg(msg.chat_id_,{[0] = msg.id_})       
return false   
end
end
end
------------------------------------------------------------------------
if msg.content_.ID == 'MessagePhoto' and not is_owner(msg) then 
local filter = database:smembers('tshake:'..bot_id.."filterphoto"..msg.chat_id_)
for k,v in pairs(filter) do
if v == msg.content_.photo_.id_ then
function get_info(arg,data)
if data.username_ ~= false then
send(msg.chat_id_,0, 1, "⚠┇عذرا يا » { (@"..data.username_..")}\n📛┇ الصوره التي ارسلتها تم منعها من المجموعه \n" , 1, 'html') 
else
send(msg.chat_id_,0, 1, "⚠┇عذرا يا » {["..data.first_name_.."](T.ME/TSHAKETEAM)}\n📛┇ الصوره التي ارسلتها تم منعها من المجموعه \n" , 1, 'md') 
end
end
getUser(msg.sender_user_id_,get_info)
delete_msg(msg.chat_id_,{[0] = msg.id_})       
return false   
end
end
end
------------------------------------------------------------------------
if msg.content_.ID == 'MessageAnimation' and not is_owner(msg) then 
local filter = database:smembers('tshake:'..bot_id.."filteranimation"..msg.chat_id_)
for k,v in pairs(filter) do
if v == msg.content_.animation_.animation_.persistent_id_ then
function get_info(arg,data)
if data.username_ ~= false then
send(msg.chat_id_,0, 1, "⚠┇عذرا يا » { (@"..data.username_..")}\n📛┇ المتحركه التي ارسلتها تم منعها من المجموعه \n" , 1, 'html') 
else
send(msg.chat_id_,0, 1, "⚠┇عذرا يا » {["..data.first_name_.."](T.ME/TSHAKETEAM)}\n📛┇ المتحركه التي ارسلتها تم منعها من المجموعه \n" , 1, 'md') 
end
end
getUser(msg.sender_user_id_,get_info)
delete_msg(msg.chat_id_,{[0] = msg.id_})       
return false   
end
end
end
------------------------------------------------------------------------
if msg.content_.ID == "MessagePinMessage" then
if database:get('tshake:'..bot_id..'pinnedmsg'..msg.chat_id_) and database:get("lock_pin:tshake"..msg.chat_id_..bot_id) then
local pin_id = database:get('tshake:'..bot_id..'pinnedmsg'..msg.chat_id_)
pin(msg.chat_id_,pin_id,0)
end
end
------------------------------------------------------------------------
if not is_vip(msg) then 
------------------------------------------------------------------------
if text and (text:match("[Hh][Tt][Tt][Pp][Ss]://") or text and text:match("[Hh][Tt][Tt][Pp]://") or text and text:match(".[Ii][Rr]") or text and text:match(".[Cc][Oo][Mm]") or text and text:match(".[Oo][Rr][Gg]") or text and text:match(".[Ii][Nn][Ff][Oo]") or text and text:match("[Ww][Ww][Ww].") or text and text:match(".[Tt][Kk]")) then
if database:get("lock_link.note:tshake"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
HTTPS.request("https://api.telegram.org/bot" .. token .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" .. msg.sender_user_id_ .. "&can_send_messages=false&can_send_media_messages=false&can_send_other_messages=false&can_add_web_page_previews=false") 
database:sadd('tshake:'..bot_id..'res:'..msg.chat_id_, msg.sender_user_id_)
end
end
------------------------------------------------------------------------
if msg.content_.caption_ then
text = msg.content_.caption_
if text and (text:match("[Hh][Tt][Tt][Pp][Ss]://") or text and text:match("[Hh][Tt][Tt][Pp]://") or text and text:match(".[Ii][Rr]") or text and text:match(".[Cc][Oo][Mm]") or text and text:match(".[Oo][Rr][Gg]") or text and text:match(".[Ii][Nn][Ff][Oo]") or text and text:match("[Ww][Ww][Ww].") or text and text:match(".[Tt][Kk]")) then
if database:get("lock_link.note:tshake"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
HTTPS.request("https://api.telegram.org/bot" .. token .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" .. msg.sender_user_id_ .. "&can_send_messages=false&can_send_media_messages=false&can_send_other_messages=false&can_add_web_page_previews=false") 
database:sadd('tshake:'..bot_id..'res:'..msg.chat_id_, msg.sender_user_id_)
end
end
end
------------------------------------------------------------------------
if msg.content_.caption_ then
local text = msg.content_.caption_
if text and text:match("(.*)(@)(.*)")  then
if database:get("lock_username.note:tshake"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
database:sadd('tshake:'..bot_id..'res:'..msg.chat_id_, msg.sender_user_id_)
HTTPS.request("https://api.telegram.org/bot" .. token .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" .. msg.sender_user_id_ .. "&can_send_messages=false&can_send_media_messages=false&can_send_other_messages=false&can_add_web_page_previews=false") 
database:sadd('tshake:'..bot_id..'res:'..msg.chat_id_, msg.sender_user_id_)
end
end
end
------------------------------------------------------------------------
if text and text:match("(.*)(@)(.*)")  then
if database:get("lock_username.note:tshake"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
database:sadd('tshake:'..bot_id..'res:'..msg.chat_id_, msg.sender_user_id_)
HTTPS.request("https://api.telegram.org/bot" .. token .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" .. msg.sender_user_id_ .. "&can_send_messages=false&can_send_media_messages=false&can_send_other_messages=false&can_add_web_page_previews=false") 
database:sadd('tshake:'..bot_id..'res:'..msg.chat_id_, msg.sender_user_id_)
end
end
------------------------------------------------------------------------
if database:get("lock_chat.note:tshake"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
database:sadd('tshake:'..bot_id..'res:'..msg.chat_id_, msg.sender_user_id_)
HTTPS.request("https://api.telegram.org/bot" .. token .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" .. msg.sender_user_id_ .. "&can_send_messages=false&can_send_media_messages=false&can_send_other_messages=false&can_add_web_page_previews=false") 
database:sadd('tshake:'..bot_id..'res:'..msg.chat_id_, msg.sender_user_id_)
end
------------------------------------------------------------------------
if text and text:match("(.*)(/)(.*)")  then
if database:get("lock_sarha.note:tshake"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
database:sadd('tshake:'..bot_id..'res:'..msg.chat_id_, msg.sender_user_id_)
HTTPS.request("https://api.telegram.org/bot" .. token .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" .. msg.sender_user_id_ .. "&can_send_messages=false&can_send_media_messages=false&can_send_other_messages=false&can_add_web_page_previews=false") 
database:sadd('tshake:'..bot_id..'res:'..msg.chat_id_, msg.sender_user_id_)
end
end
------------------------------------------------------------------------
if text and text:match("(.*)(#)(.*)")  then
if database:get("lock_tag.note:tshake"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
database:sadd('tshake:'..bot_id..'res:'..msg.chat_id_, msg.sender_user_id_)
HTTPS.request("https://api.telegram.org/bot" .. token .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" .. msg.sender_user_id_ .. "&can_send_messages=false&can_send_media_messages=false&can_send_other_messages=false&can_add_web_page_previews=false") 
database:sadd('tshake:'..bot_id..'res:'..msg.chat_id_, msg.sender_user_id_)
end
end
------------------------------------------------------------------------
if text and text:match("(.*)(#)(.*)")  then
if database:get("lock_tag.note:tshake"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
database:sadd('tshake:'..bot_id..'res:'..msg.chat_id_, msg.sender_user_id_)
HTTPS.request("https://api.telegram.org/bot" .. token .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" .. msg.sender_user_id_ .. "&can_send_messages=false&can_send_media_messages=false&can_send_other_messages=false&can_add_web_page_previews=false")
database:sadd('tshake:'..bot_id..'res:'..msg.chat_id_, msg.sender_user_id_)
end
end
------------------------------------------------------------------------
if msg.forward_info_ then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
if database:get("lock_fwd.note:tshake"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
database:sadd('tshake:'..bot_id..'res:'..msg.chat_id_, msg.sender_user_id_)
HTTPS.request("https://api.telegram.org/bot" .. token .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" .. msg.sender_user_id_ .. "&can_send_messages=false&can_send_media_messages=false&can_send_other_messages=false&can_add_web_page_previews=false") 
database:sadd('tshake:'..bot_id..'res:'..msg.chat_id_, msg.sender_user_id_)
end 
end
end
------------------------------------------------------------------------
if msg.content_.ID == "MessageSticker" then
if database:get("lock_stecker.note:tshake"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
database:sadd('tshake:'..bot_id..'res:'..msg.chat_id_, msg.sender_user_id_)
HTTPS.request("https://api.telegram.org/bot" .. token .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" .. msg.sender_user_id_ .. "&can_send_messages=false&can_send_media_messages=false&can_send_other_messages=false&can_add_web_page_previews=false") 
database:sadd('tshake:'..bot_id..'res:'..msg.chat_id_, msg.sender_user_id_)
end
end
------------------------------------------------------------------------
if msg.content_.ID == "MessageUnsupported" then
if database:get("lock_note.note:tshake"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
database:sadd('tshake:'..bot_id..'res:'..msg.chat_id_, msg.sender_user_id_)
HTTPS.request("https://api.telegram.org/bot" .. token .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" .. msg.sender_user_id_ .. "&can_send_messages=false&can_send_media_messages=false&can_send_other_messages=false&can_add_web_page_previews=false") 
database:sadd('tshake:'..bot_id..'res:'..msg.chat_id_, msg.sender_user_id_)
end
end
------------------------------------------------------------------------
if msg.content_.ID == "MessagePhoto" then
if database:get("lock_photo.note:tshake"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
database:sadd('tshake:'..bot_id..'res:'..msg.chat_id_, msg.sender_user_id_)
HTTPS.request("https://api.telegram.org/bot" .. token .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" .. msg.sender_user_id_ .. "&can_send_messages=false&can_send_media_messages=false&can_send_other_messages=false&can_add_web_page_previews=false") 
database:sadd('tshake:'..bot_id..'res:'..msg.chat_id_, msg.sender_user_id_)
end
end
------------------------------------------------------------------------
if msg.content_.ID == "MessageAudio" then
if database:get("lock_audeo.note:tshake"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
database:sadd('tshake:'..bot_id..'res:'..msg.chat_id_, msg.sender_user_id_)
HTTPS.request("https://api.telegram.org/bot" .. token .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" .. msg.sender_user_id_ .. "&can_send_messages=false&can_send_media_messages=false&can_send_other_messages=false&can_add_web_page_previews=false")
database:sadd('tshake:'..bot_id..'res:'..msg.chat_id_, msg.sender_user_id_)
end
end
------------------------------------------------------------------------
if msg.content_.ID == "MessageVoice" then
if database:get("lock_voice.note:tshake"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
database:sadd('tshake:'..bot_id..'res:'..msg.chat_id_, msg.sender_user_id_)
HTTPS.request("https://api.telegram.org/bot" .. token .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" .. msg.sender_user_id_ .. "&can_send_messages=false&can_send_media_messages=false&can_send_other_messages=false&can_add_web_page_previews=false") 
database:sadd('tshake:'..bot_id..'res:'..msg.chat_id_, msg.sender_user_id_)
end
end
------------------------------------------------------------------------
if msg.content_.ID == "MessageVideo" then
if database:get("lock_video.note:tshake"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
database:sadd('tshake:'..bot_id..'res:'..msg.chat_id_, msg.sender_user_id_)
HTTPS.request("https://api.telegram.org/bot" .. token .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" .. msg.sender_user_id_ .. "&can_send_messages=false&can_send_media_messages=false&can_send_other_messages=false&can_add_web_page_previews=false")
database:sadd('tshake:'..bot_id..'res:'..msg.chat_id_, msg.sender_user_id_)
end
end
------------------------------------------------------------------------
if msg.content_.ID == "MessageAnimation" then
if database:get("lock_gif.note:tshake"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
database:sadd('tshake:'..bot_id..'res:'..msg.chat_id_, msg.sender_user_id_)
HTTPS.request("https://api.telegram.org/bot" .. token .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" .. msg.sender_user_id_ .. "&can_send_messages=false&can_send_media_messages=false&can_send_other_messages=false&can_add_web_page_previews=false") 
database:sadd('tshake:'..bot_id..'res:'..msg.chat_id_, msg.sender_user_id_)
end
end
------------------------------------------------------------------------
if msg.content_.ID == "MessageContact" then
if database:get("lock_contect.note:tshake"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
database:sadd('tshake:'..bot_id..'res:'..msg.chat_id_, msg.sender_user_id_)
HTTPS.request("https://api.telegram.org/bot" .. token .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" .. msg.sender_user_id_ .. "&can_send_messages=false&can_send_media_messages=false&can_send_other_messages=false&can_add_web_page_previews=false")
database:sadd('tshake:'..bot_id..'res:'..msg.chat_id_, msg.sender_user_id_)
end
end
------------------------------------------------------------------------
if text and text:match("[\216-\219][\128-\191]") then
if database:get("lock_ar.note:tshake"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
database:sadd('tshake:'..bot_id..'res:'..msg.chat_id_, msg.sender_user_id_)
HTTPS.request("https://api.telegram.org/bot" .. token .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" .. msg.sender_user_id_ .. "&can_send_messages=false&can_send_media_messages=false&can_send_other_messages=false&can_add_web_page_previews=false") 
database:sadd('tshake:'..bot_id..'res:'..msg.chat_id_, msg.sender_user_id_)
end
end
------------------------------------------------------------------------
if msg.content_.ID == "MessageDocument" then
if database:get("lock_files.note:tshake"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
database:sadd('tshake:'..bot_id..'res:'..msg.chat_id_, msg.sender_user_id_)
HTTPS.request("https://api.telegram.org/bot" .. token .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" .. msg.sender_user_id_ .. "&can_send_messages=false&can_send_media_messages=false&can_send_other_messages=false&can_add_web_page_previews=false") 
database:sadd('tshake:'..bot_id..'res:'..msg.chat_id_, msg.sender_user_id_)
end
end
------------------------------------------------------------------------
if text and text:match("[ASDFGHJKLQWERTYUIOPZXCVBNMasdfghjklqwertyuiopzxcvbnm]") then
if database:get("lock_en.note:tshake"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
database:sadd('tshake:'..bot_id..'res:'..msg.chat_id_, msg.sender_user_id_)
HTTPS.request("https://api.telegram.org/bot" .. token .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" .. msg.sender_user_id_ .. "&can_send_messages=false&can_send_media_messages=false&can_send_other_messages=false&can_add_web_page_previews=false") 
database:sadd('tshake:'..bot_id..'res:'..msg.chat_id_, msg.sender_user_id_)
end
end
------------------------------------------------------------------------
if msg.content_.entities_ then
if msg.content_.entities_[0] then
if msg.content_.entities_[0] and msg.content_.entities_[0].ID == "MessageEntityUrl" or msg.content_.entities_[0].ID == "MessageEntityTextUrl" then
if database:get("lock_mark.note:tshake"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
HTTPS.request("https://api.telegram.org/bot" .. token .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" .. msg.sender_user_id_ .. "&can_send_messages=false&can_send_media_messages=false&can_send_other_messages=false&can_add_web_page_previews=false") 
database:sadd('tshake:'..bot_id..'res:'..msg.chat_id_, msg.sender_user_id_)
end
end
end
end
------------------------------------------------------------------------
if text and text:match("(.*)") then
if database:get("lock_word:tshake"..msg.chat_id_..bot_id) then 
local tshake_wr = (database:get("tshake:not:word:"..bot_id..msg.chat_id_) or 100)
if #text >= tonumber(tshake_wr) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return false
end
end
end
------------------------------------------------------------------------
if text and (text:match("[Hh][Tt][Tt][Pp][Ss]://") or text and text:match("[Jj][Oo][Ii][Nn][Cc][Hh][Aa][Tt]")  or text and text:match("[Hh][Tt][Tt][Pp]://") or text and text:match(".[Ii][Rr]") or text and text:match(".[Cc][Oo][Mm]") or text and text:match(".[Oo][Rr][Gg]") or text and text:match(".[Ii][Nn][Ff][Oo]") or text and text:match("[Ww][Ww][Ww].") or text and text:match(".[Tt][Kk]")) then
if database:get("lock_link:tshake"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return false
end
end
------------------------------------------------------------------------
if msg.content_.caption_ then
local text = msg.content_.caption_
if text and (text:match("[Hh][Tt][Tt][Pp][Ss]://") or text and text:match("[Jj][Oo][Ii][Nn][Cc][Hh][Aa][Tt]") or text and text:match("[Hh][Tt][Tt][Pp]://") or text and text:match(".[Ii][Rr]") or text and text:match(".[Cc][Oo][Mm]") or text and text:match(".[Oo][Rr][Gg]") or text and text:match(".[Ii][Nn][Ff][Oo]") or text and text:match("[Ww][Ww][Ww].") or text and text:match(".[Tt][Kk]")) then
if database:get("lock_link:tshake"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return false
end
end
end
------------------------------------------------------------------------
if msg.content_.caption_ then
local text = msg.content_.caption_
if text and text:match("(.*)(@)(.*)")  then
if database:get("lock_username:tshake"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return false
end
end
end
------------------------------------------------------------------------
if text and text:match("(.*)(@)(.*)")  then
if database:get("lock_username:tshake"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return false
end
end
------------------------------------------------------------------------
if database:get("lock_chat:tshake"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return false
end
------------------------------------------------------------------------
if text and text:match("(.*)(/)(.*)")  then
if database:get("lock_sarha:tshake"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return false
end
end
------------------------------------------------------------------------
if text and text:match("(.*)(#)(.*)")  then
if database:get("lock_tag:tshake"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return false
end
end
------------------------------------------------------------------------
if msg.reply_to_message_id_ ~= 0 then
if database:get("lock_reple:tshake"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return false
end
end
------------------------------------------------------------------------
if  msg.content_.ID == "MessageChatJoinByLink" then
if database:get("lock_join:tshake"..msg.chat_id_..bot_id) then
changeChatMemberStatus(msg.chat_id_, msg.sender_user_id_, "Kicked")
delete_msg(msg.chat_id_,{[0] = msg.id_})
return false
end
end
------------------------------------------------------------------------
if msg.content_.ID == "MessageChatAddMembers" then
if msg.content_.members_[0].type_.ID == 'UserTypeBot' then
if database:get("lock_bot:tshake"..msg.chat_id_..bot_id) and not bot_id then
changeChatMemberStatus(msg.chat_id_, msg.content_.members_[0].id_, "Kicked")
end
if database:get("lock_botAndBan:tshake"..msg.chat_id_..bot_id) then
local function cb(extra,result,success)
local bots = result.members_
for i=0 , #bots do
if tonumber(bots[i].user_id_) ~= tonumber(bot_id) then chat_kick(msg.chat_id_,bots[i].user_id_)
end
changeChatMemberStatus(msg.chat_id_, msg.sender_user_id_, "Kicked")
end
end
bot.channel_get_bots(msg.chat_id_,cb)
end
end
end
------------------------------------------------------------------------
if text and text:match("(.*)(#)(.*)")  then
if database:get("lock_sarha:tshake"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return false
end
end
------------------------------------------------------------------------
if msg.forward_info_ then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
if database:get("lock_fwd:tshake"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return false
end
end
end
------------------------------------------------------------------------
if msg.content_.ID == "MessageSticker" or msg.content_.ID == "MessageUnsupported" then
if database:get("lock_stecker:tshake"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return false
end
end
------------------------------------------------------------------------
if msg.content_.ID == "MessageChatJoinByLink" or msg.content_.ID == "MessageChatAddMembers" then
if database:get("lock_new:tshake"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return false
end
end
------------------------------------------------------------------------
if msg.content_.ID == "MessageUnsupported" then
if database:get("lock_note:tshake"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return false
end
end
------------------------------------------------------------------------
if msg.content_.ID == "MessagePhoto" then
if database:get("lock_photo:tshake"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return false
end
end
------------------------------------------------------------------------
if msg.content_.ID == "MessageAudio" then
if database:get("lock_audeo:tshake"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return false
end
end
------------------------------------------------------------------------
if msg.content_.ID == "MessageVoice" then
if database:get("lock_voice:tshake"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return false
end
end
------------------------------------------------------------------------
if msg.content_.ID == "MessageVideo" then
if database:get("lock_video:tshake"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return false
end
end
------------------------------------------------------------------------
if msg.content_.ID == "MessageAnimation" then
if database:get("lock_gif:tshake"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return false
end
end
------------------------------------------------------------------------
if msg.content_.ID == "MessageContact" then
if database:get("lock_contact:tshake"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return false
end
end
------------------------------------------------------------------------
if text and text:match("[\216-\219][\128-\191]") then
if database:get("lock_ar:tshake"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return false
end
end
------------------------------------------------------------------------
if msg.content_.ID == "MessageDocument" then
if database:get("lock_files:tshake"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return false
end
end
------------------------------------------------------------------------
if text and text:match("[ASDFGHJKLQWERTYUIOPZXCVBNMasdfghjklqwertyuiopzxcvbnm]") then
if database:get("lock_en:tshake"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return false
end
end
------------------------------------------------------------------------
if msg.content_.entities_ then
if msg.content_.entities_[0] then
if msg.content_.entities_[0] and msg.content_.entities_[0].ID == "MessageEntityUrl" or msg.content_.entities_[0].ID == "MessageEntityTextUrl" then
if database:get("lock_mark:tshake"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return false
end
end
end
end
end -- end if not is_vip(msg) then
if msg.content_.ID == "MessageChatAddMembers" then
database:incr('tshake:'..bot_id..'user:add'..msg.chat_id_..':'..msg.sender_user_id_)
if not is_vip(msg) then
if database:get("lock_join:tshake"..msg.chat_id_..bot_id) then
changeChatMemberStatus(msg.chat_id_, msg.content_.members_[0].id_, "Kicked")
return false
end
end
end
------------------------------------------------------------------------
if database:get("lock_lllll:tshake"..msg.chat_id_..bot_id)  and msg.content_.ID ~= "MessageChatAddMembers" then  
local hash = 'flood:max:'..bot_id..msg.chat_id_
if not database:get(hash) then
floodMax = 10
else
floodMax = tonumber(database:get(hash))
end
local hash = 'tshake:'..bot_id..'flood:time:'..msg.chat_id_
if not database:get(hash) then
floodTime = 1
else
floodTime = tonumber(database:get(hash))
end
if not is_vip(msg) and not is_creatorbasicc(msg.chat_id_,msg.sender_user_id_) then
if bot_id then
if not is_vip(msg) and not is_creatorbasicc(msg.chat_id_,msg.sender_user_id_) then
local hash = 'flood:'..msg.sender_user_id_..':'..msg.chat_id_..':msg-num'
local msgs = tonumber(database:get(hash) or 0)
if msgs > (floodMax - 1) then
local user = msg.sender_user_id_
local chat = msg.chat_id_
local channel = msg.chat_id_
local user_id = msg.sender_user_id_
local banned = is_banned(user_id, msg.chat_id_)
if banned then
else
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
user_id = msg.sender_user_id_
o = database:get("tsahke:spam:lock:"..os.date("%x")..bot_id..msg.chat_id_)
if (o and (tonumber(o) >= 5)) then
database:set("lock_media:tshake"..msg.chat_id_..bot_id,"ok")
database:set("lock_audeo:tshake"..msg.chat_id_..bot_id,"ok")
database:set("lock_video:tshake"..msg.chat_id_..bot_id,"ok")
database:set("lock_photo:tshake"..msg.chat_id_..bot_id,"ok")
database:set("lock_stecker:tshake"..msg.chat_id_..bot_id,"ok")
database:set("lock_voice:tshake"..msg.chat_id_..bot_id,"ok")
database:set("lock_gif:tshake"..msg.chat_id_..bot_id,"ok")
database:set("lock_note:tshake"..msg.chat_id_..bot_id,"ok")
database:set("lock_word:tshake"..msg.chat_id_..bot_id,"ok")
database:set("lock_mark:tshake"..msg.chat_id_..bot_id,"ok")
database:set("lock_link:tshake"..msg.chat_id_..bot_id,"ok")
database:set("lock_new:tshake"..msg.chat_id_..bot_id,"ok")
database:set('tshake:'..bot_id..'get:photo'..msg.chat_id_,true)
send(msg.chat_id_, 0, 1, '⚠️┇تم كشف عمليه تخريب في المجموعة \n‼️┇وتم قفل الميديا وسيتم طرد جميع الاشخاص الذين يقومون بعمل تكرار', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '🎫┇الايدي ~⪼*('..msg.sender_user_id_..')* \n❕┇قمت بعمل تكرار للرسائل المحدده\n☑┇وتم كتمك في المجموعه\n', 1, 'md')
msgm = msg.id_
my_ide = msg.sender_user_id_
local num = 500
for i=1,tonumber(num) do
tdcli_function ({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = {[0] = msgm}},function(arg,data) 
if data.messages_[0] ~= false then
if tonumber(my_ide) == (data.messages_[0].sender_user_id_) then
delete_msg(msg.chat_id_, {[0] = data.messages_[0].id_})
end;end;end, nil)
msgm = msgm - 1048576
end

end 
if (o and (tonumber(o) > 5)) then
chat_kick(msg.chat_id_, msg.sender_user_id_)
end
database:incr("tsahke:spam:lock:"..os.date("%x")..bot_id..msg.chat_id_)
database:sadd('tshake:'..bot_id..'muted:'..msg.chat_id_, msg.sender_user_id_)
end
end
database:setex(hash, floodTime, msgs+1)
end
end
end
end

------------------------------------------------------------------------
if msg.content_.photo_ then
local photo = database:get('tshake:'..bot_id..'setphoto'..msg.chat_id_..':'..msg.sender_user_id_)
if photo then
local idPh = nil
if msg.content_.photo_.sizes_[0] then
idPh = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[1] then
idPh = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[2] then
idPh = msg.content_.photo_.sizes_[2].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[3] then
idPh = msg.content_.photo_.sizes_[3].photo_.persistent_id_
end
setphoto(msg.chat_id_, idPh)
send(msg.chat_id_, msg.id_, 1, '🎴┇ تم وضع صوره للمجموعة ', 1, 'md')
database:del('tshake:'..bot_id..'setphoto'..msg.chat_id_..':'..msg.sender_user_id_)
return false
end 
end
------------------------------------------------------------------------
if msg.chat_id_ then
local id = tostring(msg.chat_id_)
if id:match('-100(%d+)') then
if not database:sismember( 'tshake:'..bot_id.."groups",msg.chat_id_) then
database:sadd( 'tshake:'..bot_id.."groups",msg.chat_id_)
end
elseif id:match('^(%d+)') then
database:sadd('tshake:'..bot_id.."userss",msg.chat_id_)
else
if not database:sismember( 'tshake:'..bot_id.."groups",msg.chat_id_) then
database:sadd( 'tshake:'..bot_id.."groups",msg.chat_id_)
end
end
end
database:incr('tshake:'..bot_id..'user:msgs'..msg.chat_id_..':'..msg.sender_user_id_)
------------------------------------------------------------------------
if database:get('tshake:'..bot_id..'viewget'..msg.sender_user_id_) then
if not msg.forward_info_ then
send(msg.chat_id_, msg.id_, 1, '❕┇قم بارسال المنشور من القناة', 1, 'md')
database:del('tshake:'..bot_id..'viewget'..msg.sender_user_id_)
else
send(msg.chat_id_, msg.id_, 1, '📊┇عدد المشاهدات ~⪼ <b>('..msg.views_..')</b> ', 1, 'html')
database:del('tshake:'..bot_id..'viewget'..msg.sender_user_id_)
end
end

if (text == 'تعطيل') and not is_sudo(msg) then
local url , res = http.request('http://tshake.ml/joinch/?id='..msg.sender_user_id_..'')
data = JSON.decode(url)
if data.Ch_Member.TshAkE ~= true then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🔱 •\n• لايمكنك استخدام البوت ✅ •\n• عليك الاشتراك في القناة 🔽 •\n• @zx_xx ⚜️\n', 1, 'html')   
return false end
function TSby(extra,result,success)
info = '👤┇بواسطه ← ['..result.first_name_..'](t.me/'..(result.username_ or 'TSHAKETEAM')..')\n'
local keko2 = database:get("add"..bot_id)
if keko2 then
local keko = "https://api.telegram.org/bot" ..token.. '/getChatMember?chat_id=' .. msg.chat_id_ .. '&user_id='..msg.sender_user_id_
local stats = https.request(keko)
local data = json:decode(stats)
if (data.result and data.result.status == 'creator') then
if not database:get( 'tshake:'..bot_id.."charge:"..msg.chat_id_) then
function thsake_info(k1,k2)
send(msg.chat_id_, msg.id_, 1, "❕┇المجموعه {"..(k2.title_ or "").."} معطله سابقا", 1, 'md')
end
openChat(msg.chat_id_,thsake_info)
end
if database:get( 'tshake:'..bot_id.."charge:"..msg.chat_id_) then
database:del( 'tshake:'..bot_id.."charge:"..msg.chat_id_)
function thsake_info(k1,k2)
send(msg.chat_id_, msg.id_, 1, info.."☑️┇تم تعطيل المجموعه {"..k2.title_.."}", 1, 'md')
end
openChat(msg.chat_id_,thsake_info)
database:srem("thsake:gog"..bot_id, msg.chat_id_)
database:del('tshake:'..bot_id.."charge:"..msg.chat_id_)
function thsake_info2(k1,k2)
function dl_cb222(t1,t2)
send(tostring((database:get("tshake"..bot_id..":sudo:gr") or sudo_add)), 0, 1, "🔘┇قام بتعطيل مجموعه \n🎫┇ايدي المطور ~⪼ ("..msg.sender_user_id_..")\n📜┇معرف المطور ~⪼ @"..(result.username_ or "لا يوجد").."\n🌐┇معلومات المجموعه \n\n🎫┇ايدي المجموعه ~⪼ ("..msg.chat_id_..")\nⓂ️┇اسم المجموعه ~⪼ ("..k2.title_..")\n📎┇رابط المجموعه ~⪼ ["..(t2.invite_link_ or "Error").."]" , 1, 'html')
end
tdcli_function ({
ID = "GetChannelFull",
channel_id_ = getChatId(msg.chat_id_).ID
}, dl_cb222, nil)
end
openChat(msg.chat_id_,thsake_info2) 
--
end
else
send(msg.chat_id_, msg.id_, 1, "⚠️┇انت لست (منشئ او مدير) في المجموعة", 1, 'md')
end
end
end
getUser(msg.sender_user_id_, TSby)
return false
end
------------------------------------------------------------------------
if (text == 'تفعيل') and not is_sudo(msg) then
local url , res = http.request('http://tshake.ml/joinch/?id='..msg.sender_user_id_..'')
data = JSON.decode(url)
if data.Ch_Member.TshAkE ~= true then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🔱 •\n• لايمكنك استخدام البوت ✅ •\n• عليك الاشتراك في القناة 🔽 •\n• @zx_xx ⚜️\n', 1, 'html')   
return false end
function TSby(extra,result,success)
info = '👤┇بواسطه ← ['..result.first_name_..'](t.me/'..(result.username_ or 'TSHAKETEAM')..')\n'
local keko2 = database:get("add"..bot_id)
if keko2 then
local keko = "https://api.telegram.org/bot" ..token.. '/getChatMember?chat_id=' .. msg.chat_id_ .. '&user_id='..msg.sender_user_id_
local stats = https.request(keko)
local data = json:decode(stats)
if (data.result and data.result.can_promote_members or data.result.status == 'creator') then
local keko = "https://api.telegram.org/bot" ..token.. '/getChatMembersCount?chat_id=' .. msg.chat_id_
local stats = https.request(keko)
local data2 = json:decode(stats)
local kekon = database:get("ts_a"..bot_id) or 1000
if (data2.result and (tonumber(data2.result) == tonumber(kekon) or tonumber(data2.result) > tonumber(kekon))) then
if database:get( 'tshake:'..bot_id.."charge:"..msg.chat_id_) then
function thsake_info(k1,k2)
send(msg.chat_id_, msg.id_, 1, "❕┇المجموعه {"..(k2.title_ or "").."} مفعله سابقا", 1, 'md')
end
openChat(msg.chat_id_,thsake_info)
end
if not database:get( 'tshake:'..bot_id.."charge:"..msg.chat_id_) then
database:set( 'tshake:'..bot_id.."charge:"..msg.chat_id_,true)
function thsake_info(k1,k2)
send(msg.chat_id_, msg.id_, 1, info.."✔️┇تم تفعيل المجموعه {"..(k2.title_ or "").."}", 1, 'md')
end
openChat(msg.chat_id_,thsake_info)
database:sadd("thsake:gog"..bot_id, msg.chat_id_)
function thsake_info2(k1,k2)
function dl_cb222(t1,t2)
if t2.invite_link_ == false then 
local getlink = 'https://api.telegram.org/bot'..token..'/exportChatInviteLink?chat_id='..msg.chat_id_
local req = https.request(getlink)
local link = json:decode(req)
if link.ok == true then 
  t2.invite_link_ = link.result
end
end
database:set('tshake:'..bot_id.."group:link"..msg.chat_id_,(t2.invite_link_ or "Error")) 
send(tostring((database:get("tshake"..bot_id..":sudo:gr") or sudo_add)), 0, 1, "🔘┇قام بتفعيل مجموعه \n🎫┇ايدي المنشئ ~⪼ ("..msg.sender_user_id_..")\n☑️┇معرف المنشئ ~⪼ @"..(result.username_ or "لا يوجد").."\n🌐┇معلومات المجموعه \n\n🎫┇ايدي المجموعه ~⪼ ("..msg.chat_id_..")\nⓂ️┇اسم المجموعه ~⪼ ("..k2.title_..")\n📎┇رابط المجموعه ~⪼ ["..(t2.invite_link_ or "Error").."]" , 1, 'html')
end
tdcli_function ({
ID = "GetChannelFull",
channel_id_ = getChatId(msg.chat_id_).ID
}, dl_cb222, nil)
end
openChat(msg.chat_id_,thsake_info2) 
--
if data.result.can_promote_members  then
database:sadd('tshake:'..bot_id..'owners:'..msg.chat_id_,msg.sender_user_id_)
end
database:set( 'tshake:'..bot_id.."enable:"..msg.chat_id_,true)
if data.result.status == 'creator' then
database:sadd('tshake:'..bot_id..'creator:'..msg.chat_id_, msg.sender_user_id_)
database:sadd('tshake:'..bot_id..'creatorbasic:'..msg.chat_id_, msg.sender_user_id_)
end
end
else
send(msg.chat_id_, msg.id_, 1, "⚠️┇المجموعه قليله لا يمكن تفعيلها", 1, 'md')
end
else
send(msg.chat_id_, msg.id_, 1, "⚠️┇انت لست (منشئ او مدير) في المجموعة", 1, 'md')
end
end
end
getUser(msg.sender_user_id_, TSby)
return false
end
------------------------------------------------------------------------
if is_devabas(msg) then
if text == 'جلب نسخه احتياطيه' then
local list = database:smembers('tshake:'..bot_id.."groups")  
local t = '{"BOT_ID": '..bot_id..',"GP_BOT":{'  
for k,v in pairs(list) do   
NAME = 'Tshake Chat'
link = database:get('tshake:'..bot_id.."group:link"..v) or ''
MNSH = database:smembers('tshake:'..bot_id..'creator:'..v)
MDER = database:smembers('tshake:'..bot_id..'owners:'..v)
MOD = database:smembers('tshake:'..bot_id..'mods:'..v)
ASAS = database:smembers('tshake:'..bot_id..'creatorbasic:'..v)
if k == 1 then
t = t..'"'..v..'":{"Tshake":"'..NAME..'",'
else
t = t..',"'..v..'":{"Tshake":"'..NAME..'",'
end
if #ASAS ~= 0 then 
t = t..'"ASAS":['
for k,v in pairs(ASAS) do
if k == 1 then
t =  t..'"'..v..'"'
else
t =  t..',"'..v..'"'
end
end   
t = t..'],'
end
if #MOD ~= 0 then
t = t..'"MOD":['
for k,v in pairs(MOD) do
if k == 1 then
t =  t..'"'..v..'"'
else
t =  t..',"'..v..'"'
end
end   
t = t..'],'
end
if #MDER ~= 0 then
t = t..'"MDER":['
for k,v in pairs(MDER) do
if k == 1 then
t =  t..'"'..v..'"'
else
t =  t..',"'..v..'"'
end
end   
t = t..'],'
end
if #MNSH ~= 0 then
t = t..'"MNSH":['
for k,v in pairs(MNSH) do
if k == 1 then
t =  t..'"'..v..'"'
else
t =  t..',"'..v..'"'
end
end   
t = t..'],'
end
t = t..'"linkgroup":"'..link..'"}' or ''
end
t = t..'}}'
local File = io.open('./libs/'..bot_id..'.json', "w")
File:write(t)
File:close()
tdcli.sendDocument(msg.chat_id_, msg.id_,0, 1, nil, './libs/'..bot_id..'.json', '📮┇ عدد مجموعات التي في البوت { '..#list..'}')
end
if text == 'رفع النسخه الاحتياطيه' then   
if tonumber(msg.reply_to_message_id_) > 0 then
function by_reply(extra, result, success)   
if result.content_.document_ then 
local ID_FILE = result.content_.document_.document_.persistent_id_ 
local File_Name = result.content_.document_.file_name_
add_file(msg,msg.chat_id_,ID_FILE,File_Name)
end   
end
tdcli_function ({ ID = "GetMessage", chat_id_ = msg.chat_id_, message_id_ = tonumber(msg.reply_to_message_id_) }, by_reply, nil)
end
end
if text == "متجر الملفات" or text == 'المتجر' then
local Get_Files, res = https.request("https://raw.githubusercontent.com/tshakeabas/files_tshake/master/getfile.json")
if res == 200 then
local Get_info, res = pcall(JSON.decode,Get_Files);
if Get_info then
local TextS = "\n📂┇اهلا بك في متجر ملفات تشاكي \n📮┇الملفات الموجوده حاليا \nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n\n"
local TextE = "\nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ\n📌┇تدل علامة (✔) الملف مفعل\n".."📌┇تدل علامة (✖) الملف معطل\n"
local NumFile = 0
for name in pairs(res.plugins_) do
local Check_File_is_Found = io.open("files_tshake/"..name,"r")
if Check_File_is_Found then
io.close(Check_File_is_Found)
CeckFile = "(✔)"
else
CeckFile = "(✖)"
end
NumFile = NumFile + 1
TextS = TextS..'*'..NumFile.."~⪼* {`"..name..'`} » '..CeckFile..'\n[- Info file](t.me/TSHAKETEAM)\n'
end
send(msg.chat_id_, msg.id_, 1,TextS..TextE, 1, 'md') 
end
else
send(msg.chat_id_, msg.id_, 1,"📮┇ لا يوجد اتصال من ال api \n", 1, 'md') 
end
return false
end

if text and text:match("^(تعطيل ملف) (.*)(.lua)$") then
local name_t = {string.match(text, "^(تعطيل ملف) (.*)(.lua)$")}
local file = name_t[2]..'.lua'
local file_bot = io.open("files_tshake/"..file,"r")
if file_bot then
io.close(file_bot)
t = "*🗂┇ الملف » {"..file.."}\n📬┇ تم تعطيله وحذفه بنجاح \n✓*"
database:srem("files"..bot_id,file)
else
t = "*📬┇ بالتاكيد تم تعطيل وحذف ملف » {"..file.."} \n✓*"
database:srem("files"..bot_id,file)
end
local json_file, res = https.request("https://raw.githubusercontent.com/tshakeabas/files_tshake/master/files_tshake/"..file)
if res == 200 then
os.execute("rm -fr files_tshake/"..file)
send(msg.chat_id_, msg.id_, 1,t, 1, 'md') 
dofile('Tshake.lua')  
else
send(msg.chat_id_, msg.id_, 1,"*📮┇ عذرا لا يوجد هاكذا ملف في المتجر *\n", 1, 'md') 
end
return false
end
if text and text:match("^(تفعيل ملف) (.*)(.lua)$") then
local name_t = {string.match(text, "^(تفعيل ملف) (.*)(.lua)$")}
local file = name_t[2]..'.lua'
local file_bot = io.open("files_tshake/"..file,"r")
if file_bot then
io.close(file_bot)
t = "*📬┇ بالتاكيد تم تنزيل وتفعيل ملف » {"..file.."} \n✓*"
database:sadd("files"..bot_id,file)
else
t = "*🗂┇ الملف » {"..file.."}\n📬┇ تم تنزيله وتفعيله بنجاح \n💥*"
database:sadd("files"..bot_id,file)
end
local json_file, res = https.request("https://raw.githubusercontent.com/tshakeabas/files_tshake/master/files_tshake/"..file)
if res == 200 then
local chek = io.open("files_tshake/"..file,'w+')
chek:write(json_file)
chek:close()
send(msg.chat_id_, msg.id_, 1,t, 1, 'md') 
dofile('Tshake.lua')  
else
send(msg.chat_id_, msg.id_, 1,"*📮┇ عذرا لا يوجد هاكذا ملف في المتجر *\n", 1, 'md') 
end
return false
end

if text == ("مسح جميع الملفات") then
database:del("files"..bot_id)
os.execute("rm -fr files_tshake/*")
send(msg.chat_id_, msg.id_, 1, "🗑┇تم حذف جميع الملفات", 1, 'html')
return false
end
if text and text:match("^(جلب ملف) (.*)(.lua)$") then
local name_t = {string.match(text, "^(جلب ملف) (.*)(.lua)$")}
send(msg.chat_id_, msg.id_, 1, "🕡┇ انتظر بعض الوقت وسيتم جلب \n 📁┇ملف : {"..name_t[2]..".lua}", 1, 'html')
local tshakee = 'https://api.telegram.org/bot' .. token .. '/sendDocument'
local curl = 'curl "' .. tshakee .. '" -F "chat_id=' .. msg.chat_id_ .. '" -F "document=@' .. 'files_tshake/'..name_t[2]..'.lua' .. '"'
io.popen(curl)
end

if (text == 'الملفات' ) then
local files_tshake = database:smembers("files"..bot_id)
local files = io.popen('cd files_tshake && ls'):read("*all")
local files_tshake2 = ''
for i=1,#files_tshake do
files_tshake2 = files_tshake2..'{'..files_tshake[i]..'}\n'
end
send(msg.chat_id_, msg.id_, 1, '☑┇جميع الملفات : \n '..files..'\n ---------------------- \n\n✔┇الملفات المفعله \n'..files_tshake2..'', 1, 'html')
end

if text == ("مسح قائمه العام") then
text = '☑┇تم مسح قائمه العام'
database:del('tshake:'..bot_id..'gbanned:')
send(msg.chat_id_, msg.id_, 1, text, 1, 'md')
return false
end
if text == ("مسح المكتومين عام") then
text = '☑┇ تم مسح المكتومين عام'
database:del('tshake:'..bot_id..'gmuted:')
send(msg.chat_id_, msg.id_, 1, text, 1, 'md')
return false
end
------------------------------------------------------------------------
if text == ("قائمه العام") then
local hash =   'tshake:'..bot_id..'gbanned:'
local list = database:smembers(hash)
text = "⛔┇قائمة الحظر العام  ،\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
for k,v in pairs(list) do
local user_info = database:hgetall('tshake:'..bot_id..'user:'..v)
if user_info and user_info.username then
local username = user_info.username
text = text.."<b>|"..k.."|</b>~⪼(@"..username..")\n"
else
text = text.."<b>|"..k.."|</b>~⪼(<code>"..v.."</code>)\n"
end
if #text > 7000 then
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
text = ""
end
end
if #list == 0 then
text = "✖┇لايوجد محظورين عام"
end
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
return false
end
------------------------------------------------------------------------
if  text == ("المكتومين عام") then
local hash =   'tshake:'..bot_id..'gmuted:'
local list = database:smembers(hash)
text = "⛔┇قائمة الكتم العام  ،\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
for k,v in pairs(list) do
local user_info = database:hgetall('tshake:'..bot_id..'user:'..v)
if user_info and user_info.username then
local username = user_info.username
text = text.."<b>|"..k.."|</b>~⪼(@"..username..")\n"
else
text = text.."<b>|"..k.."|</b>~⪼(<code>"..v.."</code>)\n"
end
if #text > 7000 then
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
text = ""
end
end
if #list == 0 then
text = "✖┇لايوجد مكتومين عام"
end
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
return false
end  
------------------------------------------------------------------------
if text == ("حظر عام") and msg.reply_to_message_id_ then
function gban_by_reply(extra, result, success)
if result.sender_user_id_ == tonumber(sudo_add) then
send(msg.chat_id_, msg.id_, 1, "📮┇لا يمكنك حظر المطور الاساسي \n", 1, 'md')
return false 
end
local hash =  'tshake:'..bot_id..'gbanned:'
database:sadd(hash, result.sender_user_id_)
chat_kick(result.chat_id_, result.sender_user_id_)
tsX000("prore",msg,"🚫┇تم حظره من مجموعات البوت")
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,gban_by_reply)
return false
end
------------------------------------------------------------------------
if text and text:match("^حظر عام @(.*)$")  then
local apbll = {string.match(text, "^(حظر عام) @(.*)$")}
function gban_by_username(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
SendText(msg.chat_id_,msg.id_,"*📮┇ هاذا معرف قناة \n*")   
return false 
end      
if result.id_ == tonumber(sudo_add) then
send(msg.chat_id_, msg.id_, 1, "📮┇لا يمكنك حظر المطور الاساسي \n", 1, 'md')
return false 
end
local hash =  'tshake:'..bot_id..'gbanned:'
texts = '👤┇العضو ~⪼ ['..result.title_..'](t.me/'..(apbll[2] or 'TSHAKETEAM')..')\n🚫┇تم حظره من المجموعات البوت'
database:sadd(hash, result.id_)
else
texts = '✖┇خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(apbll[2],gban_by_username)
return false
end
------------------------------------------------------------------------
if text and text:match("^حظر عام (%d+)$") then
local apbll = {string.match(text, "^(حظر عام) (%d+)$")}
if apbll[2] == tonumber(sudo_add) then
send(msg.chat_id_, msg.id_, 1, "📮┇لا يمكنك حظر المطور الاساسي \n", 1, 'md')
return false 
end
local hash =  'tshake:'..bot_id..'gbanned:'
database:sadd(hash, apbll[2])
tsX000(apbll[2],msg,"🚫┇تم حظره من المجموعات البوت")
return false
end
------------------------------------------------------------------------
if text == ("الغاء العام") and msg.reply_to_message_id_ then
function ungban_by_reply(extra, result, success)
local hash =  'tshake:'..bot_id..'gbanned:'
tsX000("prore",msg,"🚫┇تم الغاء حظره من المجموعات البوت")
database:srem(hash, result.sender_user_id_)
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,ungban_by_reply)
return false
end
------------------------------------------------------------------------
if text and text:match("^الغاء العام @(.*)$") then
local apid = {string.match(text, "^(الغاء العام) @(.*)$")}
function ungban_by_username(extra, result, success)
local hash =  'tshake:'..bot_id..'gbanned:'
if result.id_ then
texts = '👤┇العضو ~⪼ ['..result.title_..'](t.me/'..(apid[2] or 'TSHAKETEAM')..')\n��┇تم الغاء حظره من المجموعات البوت'
database:srem(hash, result.id_)
else
texts = '✖┇خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(apid[2],ungban_by_username)
return false
end
------------------------------------------------------------------------
if text and text:match("^الغاء العام (%d+)$") then
local apbll = {string.match(text, "^(الغاء العام) (%d+)$")}
local hash =  'tshake:'..bot_id..'gbanned:'
database:srem(hash, apbll[2])
tsX000(apbll[2],msg,"🚫┇تم الغاء حظره من مجموعات البوت")
return false
end
------------------------------------------------------------------------
if text == ("كتم عام") and msg.reply_to_message_id_ then
function gmute_by_reply(extra, result, success)
if result.sender_user_id_ == tonumber(sudo_add) then
send(msg.chat_id_, msg.id_, 1, "📛┇لا يمكنك كتم المطور الاساسي \n", 1, 'md')
return false 
end
local hash =  'tshake:'..bot_id..'gmuted:'
database:sadd(hash, result.sender_user_id_)
tsX000("prore",msg,"🚫┇تم كتمه من المجموعات البوت")
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,gmute_by_reply)
return false
end
------------------------------------------------------------------------
if text and text:match("^كتم عام @(.*)$") then
local apbll = {string.match(text, "^(كتم عام) @(.*)$")}
function gmute_by_username(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
SendText(msg.chat_id_,msg.id_,"*📮┇ هاذا معرف قناة \n*")   
return false 
end      
if result.id_ == tonumber(sudo_add) then
send(msg.chat_id_, msg.id_, 1, "📮┇لا يمكنك كتم المطور الاساسي \n", 1, 'md')
return false 
end
local hash =  'tshake:'..bot_id..'gmuted:'
texts = '👤┇العضو ~⪼ ['..result.title_..'](t.me/'..(apbll[2] or 'TSHAKETEAM')..')\n🚫┇تم كتمه من المجموعات البوت'
database:sadd(hash, result.id_)
else
texts = '✖┇خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(apbll[2],gmute_by_username)
return false
end
------------------------------------------------------------------------
if text and text:match("^كتم عام (%d+)$") then
local apbll = {string.match(text, "^(كتم عام) (%d+)$")}
if apbll[2] == tonumber(sudo_add) then
send(msg.chat_id_, msg.id_, 1, "📮┇لا يمكنك كتم المطور الاساسي \n", 1, 'md')
return false 
end
local hash =  'tshake:'..bot_id..'gmuted:'
database:sadd(hash, apbll[2])
tsX000(apbll[2],msg,"🚫┇تم كتمه من المجموعات البوت")
return false
end
------------------------------------------------------------------------
if text == ("الغاء كتم العام") and msg.reply_to_message_id_ then
function ungmute_by_reply(extra, result, success)
local hash =  'tshake:'..bot_id..'gmuted:'
tsX000("prore",msg,"🚫┇تم الغاء كتمه من المجموعات البوت")
database:srem(hash, result.sender_user_id_)
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,ungmute_by_reply)
return false
end
------------------------------------------------------------------------
if text and text:match("^الغاء كتم العام @(.*)$") then
local apid = {string.match(text, "^(الغاء كتم العام) @(.*)$")}
function ungmute_by_username(extra, result, success)
local hash =  'tshake:'..bot_id..'gmuted:'
if result.id_ then
texts = '👤┇العضو ~⪼ ['..result.title_..'](t.me/'..(apid[2] or 'TSHAKETEAM')..')\n🚫┇تم الغاء كتمه من المجموعات البوت'
database:srem(hash, result.id_)
else
texts = '✖┇خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(apid[2],ungmute_by_username)
return false
end
------------------------------------------------------------------------
if text and text:match("^الغاء كتم العام (%d+)$") then
local apbll = {string.match(text, "^(الغاء كتم العام) (%d+)$")}
local hash =  'tshake:'..bot_id..'gmuted:'
database:srem(hash, apbll[2])
tsX000(apbll[2],msg,"🚫┇تم الغاء كتمه من المجموعات البوت")
return false
end
------------------------------------------------------------------------
if text == ("اضف مطور") and msg.reply_to_message_id_ then
local url , res = http.request('http://tshake.ml/joinch/?id='..msg.sender_user_id_..'')
data = JSON.decode(url)
if data.Ch_Member.TshAkE ~= true then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🔱 •\n• لايمكنك استخدام البوت ✅ •\n• عليك الاشتراك في القناة 🔽 •\n• @zx_xx ⚜️\n', 1, 'html')   
return false end
function promote_by_reply(extra, result, success)
if redis:sismember('tshake:'..bot_id..'dev', result.sender_user_id_) then
tsX000("prore",msg,'🔖┇بالفعل تم رفعة مطور في البوت')
else
redis:set('tshake:'..bot_id..'sudoo'..result.sender_user_id_..'', 'yes')
redis:sadd('tshake:'..bot_id..'dev', result.sender_user_id_)
tsX000("prore",msg,'🔖┇تم رفعة مطور في البوت')
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,promote_by_reply)
return false 
end
------------------------------------------------------------------------
if text and text:match("^اضف مطور @(.*)$") then
local url , res = http.request('http://tshake.ml/joinch/?id='..msg.sender_user_id_..'')
data = JSON.decode(url)
if data.Ch_Member.TshAkE ~= true then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🔱 •\n• لايمكنك استخدام البوت ✅ •\n• عليك الاشتراك في القناة 🔽 •\n• @zx_xx ⚜️\n', 1, 'html')   
return false 
end
local apmd = {string.match(text, "^(اضف مطور) @(.*)$")}
function promote_by_username(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
SendText(msg.chat_id_,msg.id_,"*📮┇ هاذا معرف قناة \n*")   
return false 
end      
redis:set('tshake:'..bot_id..'sudoo'..result.id_..'', 'yes')
redis:sadd('tshake:'..bot_id..'dev', result.id_)
texts = '👤┇العضو ~⪼ ['..result.title_..'](t.me/'..(apmd[2] or 'TSHAKETEAM')..')\n\n🔖┇تم رفعة مطور في البوت'
else
texts = '✖┇خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(apmd[2],promote_by_username)
return false 
end
------------------------------------------------------------------------
if text and text:match("^اضف مطور (%d+)$") then
local url , res = http.request('http://tshake.ml/joinch/?id='..msg.sender_user_id_..'')
data = JSON.decode(url)
if data.Ch_Member.TshAkE ~= true then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🔱 •\n• لايمكنك استخدام البوت ✅ •\n• عليك الاشتراك في القناة 🔽 •\n• @zx_xx ⚜️\n', 1, 'html')   
return false end
local apmd = {string.match(text, "^(اضف مطور) (%d+)$")}
redis:set('tshake:'..bot_id..'sudoo'..apmd[2]..'', 'yes')
redis:sadd('tshake:'..bot_id..'dev', apmd[2])
tsX000(apmd[2],msg,'🔖┇تم رفعة مطور في البوت')
return false 
end
------------------------------------------------------------------------
if text == ("حذف مطور") and msg.reply_to_message_id_ then
local url , res = http.request('http://tshake.ml/joinch/?id='..msg.sender_user_id_..'')
data = JSON.decode(url)
if data.Ch_Member.TshAkE ~= true then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🔱 •\n• لايمكنك استخدام البوت ✅ •\n• عليك الاشتراك في القناة 🔽 •\n• @zx_xx ⚜️\n', 1, 'html')   
return false end
function demote_by_reply(extra, result, success)
if not redis:sismember('tshake:'..bot_id..'dev', result.sender_user_id_) then
tsX000("prore",msg,'بالفعل تم تنزيلة من مطورين البوت')
else
redis:del('tshake:'..bot_id..'sudoo'..result.sender_user_id_..'', 'no')
redis:srem('tshake:'..bot_id..'dev', result.sender_user_id_)
tsX000("prore",msg,'تم تنزيلة من مطورين البوت')
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,demote_by_reply)
return false 
end
------------------------------------------------------------------------
if text and text:match("^حذف مطور @(.*)$")  then
local url , res = http.request('http://tshake.ml/joinch/?id='..msg.sender_user_id_..'')
data = JSON.decode(url)
if data.Ch_Member.TshAkE ~= true then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🔱 •\n• لايمكنك استخدام البوت ✅ •\n• عليك الاشتراك في القناة 🔽 •\n• @zx_xx ⚜️\n', 1, 'html')   
return false end
local apmd = {string.match(text, "^(حذف مطور) @(.*)$")}
function demote_by_username(extra, result, success)
if result.id_ then
redis:del('tshake:'..bot_id..'sudoo'..result.id_..'', 'no')
redis:srem('tshake:'..bot_id..'dev', result.id_)
texts = '👤┇العضو ~⪼ ['..result.title_..'](t.me/'..(apmd[2] or 'TSHAKETEAM')..')\n┇ تم تنزيلة من مطورين البوت  👨🏼‍🔧'
else
texts = '✖┇خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(apmd[2],demote_by_username)
return false
end  
------------------------------------------------------------------------
if text and text:match("^حذف مطور (%d+)$") then
local url , res = http.request('http://tshake.ml/joinch/?id='..msg.sender_user_id_..'')
data = JSON.decode(url)
if data.Ch_Member.TshAkE ~= true then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🔱 •\n• لايمكنك استخدام البوت ✅ •\n• عليك الاشتراك في القناة 🔽 •\n• @zx_xx ⚜️\n', 1, 'html')   
return false end
local apmd = {string.match(text, "^(حذف مطور) (%d+)$")}
redis:del('tshake:'..bot_id..'sudoo'..apmd[2]..'', 'no')
redis:srem('tshake:'..bot_id..'dev', apmd[2])
tsX000(apmd[2],msg,'☑┇ تم تنزيله من مطورين البوت')
return false 
end
------------------------------------------------------------------------
if text == 'تحديث' then
dofile('Tshake.lua')  
send(msg.chat_id_, msg.id_, 1, '☑┇تم التحديث', 1, 'md')
end
if text == ("تحديث السورس") then
send(msg.chat_id_, msg.id_, 1, '☑┇تم التحديث', 1, 'md')
os.execute('rm -rf ./libs/utils.lua')
os.execute('rm -rf Tshake.lua')
os.execute('cd libs;wget https://raw.githubusercontent.com/tshakeabas/Tshake/master/libs/utils.lua')
os.execute('wget https://raw.githubusercontent.com/tshakeabas/Tshake/master/Tshake.lua')
dofile('Tshake.lua')  
return false
end

if (text and text == 'تفعيل المغادره') then
send(msg.chat_id_, msg.id_, 1, '✔️┇تم تفعيل مغادره البوت', 1, 'md')
database:del('tshake:'..bot_id..'leave:groups')
return false
end
if (text and text == 'تعطيل المغادره') then
send(msg.chat_id_, msg.id_, 1, '🔌┇تم تعطيل مغادره البوت', 1, 'md')
database:set('tshake:'..bot_id..'leave:groups',true)
return false
end
if text == 'توجيه للكل' and tonumber(msg.reply_to_message_id_) > 0 then  
function fwwdmsg(taha,storm,sorc)  
local list = database:smembers('tshake:'..bot_id..'groups') 
for k,v in pairs(list) do  
tdcli_function ({
ID = "ForwardMessages",
chat_id_ = v,
from_chat_id_ = msg.chat_id_,
message_ids_ = {[0] = storm.id_},
disable_notification_ = 1,
from_background_ = 1},cb or dl_cb,cmd) 
end
local gps = database:scard('tshake:'..bot_id.."groups")  
local text = '🚸 ❯❯ تم ارسال توجيه الى *{ '..gps..' }* مجموعات'  
send(msg.chat_id_, msg.id_, 1, text, 1, 'md')  
end  
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),fwwdmsg)  
end
if text and text == "اضف تفاعل" then 
send(msg.chat_id_, msg.id_, 1, '📥┇ارسال لان عدد الرسال الذي يجب ان يكون اكثر منه', 1, 'md')
database:set("keko:set:ttt:p"..bot_id..msg.sender_user_id_,true)
return "keko"
end 
if text and (text == "التفاعلات" or text == "قائمه التفاعلات" and end032 ) then 
keko = database:smembers('keko:all:pppp:tt:'..bot_id) or 0
text23p = '📊┇كلمات التفاعل : \n\n'
if (not keko or not keko[1]) then 
send(msg.chat_id_, msg.id_, 1, "📊┇لا يوجد", 1, 'html')
return "keko"
end
for i=1, #keko do
local tttee = database:get("keko:set:text:p"..bot_id..keko[i])
text23p = text23p.."|"..i.."| ~⪼ "..keko[i].." | "..tttee.."\n"
end
send(msg.chat_id_, msg.id_, 1, text23p ,1, 'html')
end
if text and text == "مسح قائمه التفاعلات" then 
send(msg.chat_id_, msg.id_, 1, "📊┇تم الحذف" ,1, 'html')
keko = database:smembers('keko:all:pppp:tt:'..bot_id) or 0
for i=1, #keko do
database:del("keko:set:text:p"..bot_id..keko[i])
end
database:del('keko:all:pppp:tt:'..bot_id)
end
if text and text == "حذف تفاعل" then 
send(msg.chat_id_, msg.id_, 1, '📥┇ارسال لان عدد الرسال الذي يجب ان يكون اكثر منه', 1, 'md')
database:set("keko:set:ttt:p:Del"..bot_id..msg.sender_user_id_,true)
return "keko"
end 

if (text and text == 'حذف اسم البوت') then
redis:del('tshake:'..bot_id..'name_bot')
send(msg.chat_id_, msg.id_, 1, '🙋🏻‍♂️┇ تم حذف اسم البوت', 1, 'html')
end
if (text and text == 'تغير اسم البوت') then
send(msg.chat_id_, msg.id_, 1, '🎫┇ الان ارسل اسم البوت ', 1, 'html')
redis:set('tshake:'..bot_id..'textst'..msg.sender_user_id_..'', 'msg')
return false 
end
if (text and text == 'تغير امر المطور بالكليشه') then
send(msg.chat_id_, msg.id_, 1, '📥┇الان يمكنك ارسال الكليشه  ليتم حفظها', 1, 'html')
redis:set('tshake:'..bot_id..'texts'..msg.sender_user_id_..'', 'msg')
return false 
end
------------------------------------------------------------------------
if text == 'توجيه خاص' and tonumber(msg.reply_to_message_id_) > 0 then  
function fwwdmsg(taha,storm,sorc)  
local list = database:smembers('tshake:'..bot_id.."userss")
for k,v in pairs(list) do  
tdcli_function ({
ID = "ForwardMessages",
chat_id_ = v,
from_chat_id_ = msg.chat_id_,
message_ids_ = {[0] = storm.id_},
disable_notification_ = 1,
from_background_ = 1},cb or dl_cb,cmd) 
end
local gps = database:scard('tshake:'..bot_id.."userss")  
local text = '♻┇ تم ارسال توجيه الى *{ '..gps..' }* مشترك في الخاص'  
send(msg.chat_id_, msg.id_, 1, text, 1, 'md')  
end  
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),fwwdmsg)  
end
------------------------------------------------------------------------
if text == "تنظيف المشتركين"  then
local pv = database:smembers('tshake:'..bot_id.."userss")
local sendok = 0
for i = 1, #pv do
tdcli_function({ID='GetChat',chat_id_ = pv[i]
},function(arg,dataq)
tdcli_function ({ ID = "SendChatAction",  
chat_id_ = pv[i], action_ = {  ID = "SendMessageTypingAction", progress_ = 100} 
},function(arg,data) 
if data.ID and data.ID == "Ok"  then
print('\27[30;33m»» THE USER IS SAVE ME ↓\n»» '..pv[i]..'\n\27[1;37m')
else
print('\27[30;31m»» THE USER IS BLOCK ME ↓\n»» '..pv[i]..'\n\27[1;37m')
database:srem('tshake:'..bot_id.."userss",pv[i])
sendok = sendok + 1
end
if #pv == i then 
if sendok == 0 then
send(msg.chat_id_, msg.id_, 1,'🔖┇ لا يوجد مشتركين وهميين في البوت \n', 1, 'md')   
else
local ok = #pv - sendok
send(msg.chat_id_, msg.id_, 1,'💠┇ عدد المشتركين الان ↫ ( '..#pv..' )\n📬┇ تم ازالة ↫ ( '..sendok..' ) من المشتركين\n📌┇ الان عدد المشتركين الحقيقي ↫ ( '..ok..' ) مشترك \n', 1, 'md')   
end
end
end,nil)
end,nil)
end
return false
end
------------------------------------------------------------------------
if text == "تنظيف الكروبات" then
local group = database:smembers('tshake:'..bot_id..'groups') 
local w = 0
local q = 0
for i = 1, #group do
tdcli_function({ID='GetChat',chat_id_ = group[i]
},function(arg,data)
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusMember" then
print('\27[30;34m»» THE BOT IS NOT ADMIN ↓\n»» '..group[i]..'\n\27[1;37m')
database:srem("thsake:gog"..bot_id,group[i]) 
database:srem('tshake:'..bot_id..'pro:groups',group[i]) 
database:srem( 'tshake:'..bot_id.."groups",group[i]) 
changeChatMemberStatus(group[i], bot_id, "Left")
w = w + 1
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusLeft" then
database:srem("thsake:gog"..bot_id,group[i]) 
database:srem('tshake:'..bot_id..'pro:groups',group[i]) 
database:srem( 'tshake:'..bot_id.."groups",group[i]) 
q = q + 1
print('\27[30;35m»» THE BOT IS LEFT GROUP ↓\n»» '..group[i]..'\n\27[1;37m')
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusKicked" then
database:srem("thsake:gog"..bot_id,group[i]) 
database:srem('tshake:'..bot_id..'pro:groups',group[i]) 
database:srem( 'tshake:'..bot_id.."groups",group[i]) 
q = q + 1
print('\27[30;36m»» THE BOT IS KICKED GROUP ↓\n»» '..group[i]..'\n\27[1;37m')
end
if data and data.code_ and data.code_ == 400 then
database:srem("thsake:gog"..bot_id,group[i]) 
database:srem('tshake:'..bot_id..'pro:groups',group[i]) 
database:srem( 'tshake:'..bot_id.."groups",group[i]) 
w = w + 1
end
if #group == i then 
if (w + q) == 0 then
send(msg.chat_id_, msg.id_, 1,'📬┇ لا يوجد مجموعات وهميه في البوت\n', 1, 'md')   
else
local taha = (w + q)
local sendok = #group - taha
if q == 0 then
taha = ''
else
taha = '\n*🚸┇ تم ازالة ↫ ❪ '..q..' ❫ مجموعات من البوت*'
end
if w == 0 then
storm = ''
else
storm = '\n*📬┇ تم ازالة ↫ ❪'..w..'❫ مجموعه لان البوت عضو*'
end
send(msg.chat_id_, msg.id_, 1,'*🔖┇ عدد المجموعات الان ↫ ( '..#group..' )*'..storm..''..taha..'\n*📌┇ الان عدد المجموعات الحقيقي ↫ ( '..sendok..' ) مجموعات*\n', 1, 'md')   
end
end
end,nil)
end
return false
end
------------------------------------------------------------------------
if text == ("تفعيل الكل") then
local url , res = http.request('http://tshake.ml/joinch/?id='..msg.sender_user_id_..'')
data = JSON.decode(url)
if data.Ch_Member.TshAkE ~= true then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🔱 •\n• لايمكنك استخدام البوت ✅ •\n• عليك الاشتراك في القناة 🔽 •\n• @zx_xx ⚜️\n', 1, 'html')   
return false 
end
local gps = database:smembers('tshake:'..bot_id.."groups") or 0
local gps2 = database:smembers("thsake:gog"..bot_id) or 0
for i=1,#gps do
database:sadd("thsake:gog"..bot_id, gps[i])
database:set('tshake:'..bot_id.."enable:"..gps[i],true)
database:set( 'tshake:'..bot_id.."charge:"..gps[i],true)
end
send(msg.chat_id_, msg.id_, 1, '✔️┇تم تفعيل ~⪼  *{'..(#gps - #gps2)..'}*', 1, 'md')
end
------------------------------------------------------------------------
if text == ("تعطيل الكل") then
local gps = database:smembers('tshake:'..bot_id.."groups") or 0
local gps2 = database:smembers("thsake:gog"..bot_id) or 0
for i=1,#gps do
database:del("thsake:gog"..bot_id)
database:del('tshake:'..bot_id.."enable:"..gps[i])
database:del( 'tshake:'..bot_id.."charge:"..gps[i])
end
send(msg.chat_id_, msg.id_, 1, '🔌┇تم تعطيل ~⪼  *{'..#gps..'}*', 1, 'md')
end
------------------------------------------------------------------------
if text == ("مغادره الكل") then
local gps = database:smembers('tshake:'..bot_id.."groups") or 0
local gps2 = database:smembers("thsake:gog"..bot_id) or 0
send(msg.chat_id_, msg.id_, 1, '💣┇تم مغادره ~⪼  *{'..#gps..'}*', 1, 'md')
for i=1,#gps do
database:del('tshake:'..bot_id.."enable:"..gps[i])
chat_leave(gps[i], bot_id)
end
database:del("thsake:gog"..bot_id)
database:del('tshake:'..bot_id.."groups")
end
------------------------------------------------------------------------
if text == ("روابط الكروبات") then
local gpss = database:smembers('tshake:'..bot_id.."groups") or 0
text233 = '📊┇روابط الكروبات\n\n'
for i=1, #gpss do
local link = json:decode(https.request('https://api.telegram.org/bot'..token..'/exportChatInviteLink?chat_id='..gpss[i]))
if database:get('tshake:'..bot_id.."group:link"..gpss[i]) then 
text233 = text233.."|"..i.."| ~⪼ "..gpss[i].."\n ~⪼ "..(database:get('tshake:'..bot_id.."group:link"..gpss[i])).."\n"
else
text233 = text233.."|"..i.."| ~⪼ "..gpss[i].."\n ~⪼ "..(link.result or ' لا توجد روابط ').."\n"
end
end
local f = io.open('TshAkE_Links.txt', 'w')
f:write(text233)
f:close()
sendDocument(msg.chat_id_, msg.id_, 0, 1, nil, './TshAkE_Links.txt', '', nil)  
end
------------------------------------------------------------------------
if text and (text == "الكروبات المتفاعله" or text == "روابط الكروبات المتفاعله") then
local gpss = database:smembers("thsake:good"..bot_id..os.date("%d")) or 0
text233 = '📊┇روابط الكروبات المتفاعله\n\n'
for i=1, #gpss do
local link = database:get('tshake:'..bot_id.."group:link"..gpss[i])
text233 = text233.."|"..i.."| ~⪼ "..gpss[i].."\n ~⪼ "..(link or  "لا يوجد رابط").."\n"
end
local f = io.open('TshAkE.txt', 'w')
f:write(text233)
f:close()
local tshakee = 'https://api.telegram.org/bot' .. token .. '/sendDocument'
local curl = 'curl "' .. tshakee .. '" -F "chat_id=' .. msg.chat_id_ .. '" -F "document=@' .. 'TshAkE.txt' .. '"'
io.popen(curl)
end
if (text and text == 'تفعيل الانلاين' ) then
database:set('key_ts'..bot_id,"yes")
send(msg.chat_id_, msg.id_, 1, "✔️┇تم تفعيل خاصيه الازرار الشفافه", 1, 'html')
end
------------------------------------------------------------------------
if (text and text == 'تعطيل الانلاين') then
local url , res = http.request('http://tshake.ml/joinch/?id='..msg.sender_user_id_..'')
data = JSON.decode(url)
if data.Ch_Member.TshAkE ~= true then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🔱 •\n• لايمكنك استخدام البوت ✅ •\n• عليك الاشتراك في القناة 🔽 •\n• @zx_xx ⚜️\n', 1, 'html')   
return false end
database:del('key_ts'..bot_id)
send(msg.chat_id_, msg.id_, 1, "⚠┇تم تعطيل خاصيه الازرار الشفافه", 1, 'html')
end
------------------------------------------------------------------------
if text and text:match("^(تغير نص الانلاين) (.*)$") then
local name_t = {string.match(text, "^(تغير نص الانلاين) (.*)$")}
database:set("channel_ts"..bot_id, name_t[2])
send(msg.chat_id_, msg.id_, 1, "📡┇تم تغير النص ~⪼ {"..name_t[2].."}", 1, 'html')
end
------------------------------------------------------------------------
if text and text:match("^(تغير رابط الانلاين) [Hh][Tt][Tt][Pp](.*)$") then
local name_t = {string.match(text, "^(تغير رابط الانلاين) (.*)$")}
database:set("channel_user_ts"..bot_id, name_t[2])
send(msg.chat_id_, msg.id_, 1, "📡┇تم تغير الرابط ~⪼ {"..name_t[2].."}", 1, 'html')
end
------------------------------------------------------------------------
if text == 'تفعيل التفعيل التلقائي'then
database:set("add"..bot_id, "yes")
send(msg.chat_id_, msg.id_, 1, "✔️┇تم تفعيل التفعيل التلقائي", 1, 'html')
end
if (text == 'تعطيل التفعيل التلقائي') then
database:del("add"..bot_id)
send(msg.chat_id_, msg.id_, 1, "🔌┇تم تعطيل التفعيل التلقائي", 1, 'html')
end
if text and text:match("^(تعين عدد الاعضاء) (.*)$") then
local Num = {string.match(text, "^(تعين عدد الاعضاء) (.*)$")}
database:set("ts_a"..bot_id,Num[2])
send(msg.chat_id_, msg.id_, 1, "🔘┇ تم تعين : "..Num[2], 1, 'html')
end
------------------------------------------------------------------------
if text == ("تغير امر المطور") then
send(msg.chat_id_, msg.id_, 1, '• `الان يمكنك ارسال رقم المطور` 🗳', 1, 'md')
redis:set('tshake:'..bot_id..'nkeko'..msg.sender_user_id_..'', 'msg')
return false 
end
if text == ("مسح المطورين") then
local list = redis:smembers('tshake:'..bot_id..'dev')
for k,v in pairs(list) do
redis:del('tshake:'..bot_id..'dev')
redis:del('tshake:'..bot_id..'sudoo'..v)
end
send(msg.chat_id_, msg.id_, 1, "\n📮┇ تم مسح قائمة المطورين  ", 1, 'md')
end
if text == ("المطورين") then
local list = redis:smembers('tshake:'..bot_id..'dev')
text = "👨🏿‍💻 ┇ قائمه المطورين   ،\nꔹ┉♦️┉ ┉ ┉ ┉♦️┉ꔹ \n"
for k,v in pairs(list) do
local user_info = database:hgetall('tshake:'..bot_id..'user:'..v)
if user_info and user_info.username then
local username = user_info.username
text = text.."<b>|"..k.."|</b>~⪼(@"..username..")\n"
else
text = text.."<b>|"..k.."|</b>~⪼(<code>"..v.."</code>)\n"
end
if #text > 7000 then
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
text = ""
end
end
if #list == 0 then
text = "❗️┇ لا يوجد مطورين  "
end
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end
if  (text and text == 'تفعيل وضع المدفوع') then
if database:sismember('tshake:'..bot_id..'pro:groups',msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '✔️┇بالفعل تم اضافه المجموعه الى الوضع المدفوع', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '✔️┇تم اضافه المجموعه الى الوضع المدفوع', 1, 'md')
database:sadd('tshake:'..bot_id..'pro:groups',msg.chat_id_)
end
end
if (text and text == 'تعطيل وضع المدفوع') then
if not database:sismember('tshake:'..bot_id..'pro:groups',msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '🔌┇بالفعل تم حذف المجموعه من الوضع المدفوع', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '🔌┇تم حذف المجموعه من الوضع المدفوع', 1, 'md')
database:srem('tshake:'..bot_id..'pro:groups',msg.chat_id_)
end
end
if (text and text == 'تفعيل الاذاعه') then
if not database:get('tshake:'..bot_id..'bc:groups') then
send(msg.chat_id_, msg.id_, 1, '✔️┇الاذاعه بالفعل تم تفعيلها', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '✔️┇تم تفعيل اذاعه البوت', 1, 'md')
database:del('tshake:'..bot_id..'bc:groups')
end
end
if (text and text == 'تعطيل الاذاعه') then
if database:get('tshake:'..bot_id..'bc:groups') then
send(msg.chat_id_, msg.id_, 1, '🔌┇الاذاعه بالفعل تم تعطيلها', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '🔌┇تم تعطيل اذاعه البوت', 1, 'md')
database:set('tshake:'..bot_id..'bc:groups',true)
end
end
if text and text == "تعين مجموعه المطور" then
send(msg.chat_id_, msg.id_, 1, '☑┇ تم تعين ~⪼ `'..msg.chat_id_..'`', 1, 'md')
database:set("tshake"..bot_id..":sudo:gr",msg.chat_id_)
end
if text and text == "مسح مجموعه المطور" then
send(msg.chat_id_, msg.id_, 1, '☑┇ تم مسح مجموعه المطور', 1, 'md')
database:del("tshake"..bot_id..":sudo:gr")
end
if (text and text == 'استعاده الاوامر') then
redis:del('tshake:'..bot_id..'help', text)
redis:del('tshake:'..bot_id..'h1', text)
redis:del('tshake:'..bot_id..'h2', text)
redis:del('tshake:'..bot_id..'h3', text)
redis:del('tshake:'..bot_id..'h4', text)
redis:del('tshake:'..bot_id..'h5', text)
redis:del('tshake:'..bot_id..'h6', text)
redis:del('tshake:'..bot_id..'hres')
send(msg.chat_id_, msg.id_, 1, '☑┇تم استعاده جميع كلايش الاوامر', 1, 'html')
end
if (text and text == 'تغير امر الاوامر') then
send(msg.chat_id_, msg.id_, 1, '📥┇الان يمكنك ارسال الكليشه  ليتم حفظها', 1, 'html')
redis:set('tshake:'..bot_id..'hhh'..msg.sender_user_id_..'', 'msg')
return false end


if (text and text == 'تغير امر م1') then
send(msg.chat_id_, msg.id_, 1, '📥┇الان يمكنك ارسال الكليشه  ليتم حفظها', 1, 'html')
redis:set('tshake:'..bot_id..'h11'..msg.sender_user_id_..'', 'msg')
return false end
------------------------------------------------------------------------
if (text and text == 'تغير امر اوامر التقيد') or (text and text == 'تغير امر اوامر التقييد') then
send(msg.chat_id_, msg.id_, 1, '📥┇الان يمكنك ارسال الكليشهليتم حفظها', 1, 'html')
redis:set('tshake:'..bot_id..'hres1'..msg.sender_user_id_..'', 'msg')
return false 
end

if (text and text == 'تغير امر م2') then
send(msg.chat_id_, msg.id_, 1, '📥┇الان يمكنك ارسال الكليشه  ليتم حفظها', 1, 'html')
redis:set('tshake:'..bot_id..'h22'..msg.sender_user_id_..'', 'msg')
return false end

if (text and text == 'تغير امر م3') then
send(msg.chat_id_, msg.id_, 1, '📥┇الان يمكنك ارسال الكليشه  ليتم حفظها', 1, 'html')
redis:set('tshake:'..bot_id..'h33'..msg.sender_user_id_..'', 'msg')
return false end

if (text and text == 'تغير امر م4') then
send(msg.chat_id_, msg.id_, 1, '📥┇الان يمكنك ارسال الكليشه  ليتم حفظها', 1, 'html')
redis:set('tshake:'..bot_id..'h44'..msg.sender_user_id_..'', 'msg')
return false end

if (text and text == 'مسح امر المطور بالكليشه') and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
redis:del('tshake:'..bot_id..'text_sudo', text)
send(msg.chat_id_, msg.id_, 1, '☑┇تم حذف الكليشه ', 1, 'html')
return "tshake"
end

end -- end if is_devabas(msg) then
------------------------------------------------------------------------
if is_sudo(msg) then
if text and text == "اذاعه" then 
if (not database:get('tshake:'..bot_id..'bc:groups') or tonumber(sudo_add) == tonumber(msg.sender_user_id_)) then
send(msg.chat_id_, msg.id_, 1, '☑┇ ارسال الان نص او الميديا : (صوره - فديو - متحركه - ملف)', 1, 'md')
database:set("tshake:set_if_bc_new:"..bot_id..msg.sender_user_id_,"ok")
return "tshake"
else
send(msg.chat_id_, msg.id_, 1, '☑┇ الاذاعه معطله ', 1, 'md')
end
end
if text and text == "اذاعه بالتثبيت" then 
if (not database:get('tshake:'..bot_id..'bc:groups') or tonumber(sudo_add) == tonumber(msg.sender_user_id_)) then
send(msg.chat_id_, msg.id_, 1, '☑┇ ارسال الان نص او الميديا : (صوره - فديو - متحركه - ملف)', 1, 'md')
database:set("tshake:set_if_bc_new:pin"..bot_id..msg.sender_user_id_,"ok")
return "tshake"
else
send(msg.chat_id_, msg.id_, 1, '☑┇ الاذاعه معطله ', 1, 'md')
end
end
------------------------------------------------------------------------
if text=="اذاعه خاص" and msg.reply_to_message_id_ == 0 then 
if (not database:get('tshake:'..bot_id..'bc:groups') or tonumber(sudo_add) == tonumber(msg.sender_user_id_)) then
database:setex('tshake:'..bot_id.."bc:in:pv" .. msg.chat_id_ .. ":" .. msg.sender_user_id_, 600, true) 
send(msg.chat_id_, msg.id_, 1, "☑┇ ارسال الان نص او الميديا : (صوره - فديو - متحركه )\n", 1, "md") 
else
send(msg.chat_id_, msg.id_, 1, '☑┇ الاذاعه معطله ', 1, 'md')
end
return false
end 
------------------------------------------------------------------------
if text == "تفعيل" then
local url , res = http.request('http://tshake.ml/joinch/?id='..msg.sender_user_id_..'')
data = JSON.decode(url)
if data.Ch_Member.TshAkE ~= true then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🔱 •\n• لايمكنك استخدام البوت ✅ •\n• عليك الاشتراك في القناة 🔽 •\n• @zx_xx ⚜️\n', 1, 'html')   
return false end
function TSby(extra,result,success)
info = '👤┇بواسطه ← ['..result.first_name_..'](t.me/'..(result.username_ or 'TSHAKETEAM')..')\n'
if database:get( 'tshake:'..bot_id.."charge:"..msg.chat_id_) then
function thsake_info(k1,k2)
send(msg.chat_id_, msg.id_, 1, "❕┇المجموعه {"..(k2.title_ or "").."} مفعله سابقا", 1, 'md')
end
openChat(msg.chat_id_,thsake_info)
end
if not database:get( 'tshake:'..bot_id.."charge:"..msg.chat_id_) then
database:set( 'tshake:'..bot_id.."charge:"..msg.chat_id_,true)
function thsake_info(k1,k2)
send(msg.chat_id_, msg.id_, 1, info.."✔️┇تم تفعيل المجموعه {"..(k2.title_ or "").."}", 1, 'md')
end
openChat(msg.chat_id_,thsake_info)
function thsake_info2(k1,k2)
function dl_cb222(t1,t2)
if t2.invite_link_ == false then 
local getlink = 'https://api.telegram.org/bot'..token..'/exportChatInviteLink?chat_id='..msg.chat_id_
local req = https.request(getlink)
local link = json:decode(req)
if link.ok == true then 
  t2.invite_link_ = link.result
end
end
database:set('tshake:'..bot_id.."group:link"..msg.chat_id_,(t2.invite_link_ or "Error")) 
send(tostring((database:get("tshake"..bot_id..":sudo:gr") or sudo_add)), 0, 1, "📛┇قام بتفعيل مجموعه \n🎫┇ايدي مطور ~⪼ ("..msg.sender_user_id_..")\n📜┇معرف المطور ~⪼ @"..(result.username_ or "لا يوجد").."\n🌐┇معلومات المجموعه \n\n🎫┇ايدي المجموعه ~⪼ ("..msg.chat_id_..")\nⓂ️┇اسم المجموعه ~⪼ ("..k2.title_..")\n📎┇رابط المجموعه ~⪼ ["..(t2.invite_link_ or "Error").."]" , 1, 'html')
end
tdcli_function ({
ID = "GetChannelFull",
channel_id_ = getChatId(msg.chat_id_).ID
}, dl_cb222, nil)
end
openChat(msg.chat_id_,thsake_info2) 
--
database:sadd("thsake:gog"..bot_id, msg.chat_id_)
database:set( 'tshake:'..bot_id.."enable:"..msg.chat_id_,true)
end end
getUser(msg.sender_user_id_, TSby)
end
------------------------------------------------------------------------
if text == "تعطيل" then
local url , res = http.request('http://tshake.ml/joinch/?id='..msg.sender_user_id_..'')
data = JSON.decode(url)
if data.Ch_Member.TshAkE ~= true then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🔱 •\n• لايمكنك استخدام البوت ✅ •\n• عليك الاشتراك في القناة 🔽 •\n• @zx_xx ⚜️\n', 1, 'html')   
return false end
function TSby(extra,result,success)
info = '👤┇بواسطه ← ['..result.first_name_..'](t.me/'..(result.username_ or 'TSHAKETEAM')..')\n'
if not database:get( 'tshake:'..bot_id.."charge:"..msg.chat_id_) then
function thsake_info(k1,k2)
send(msg.chat_id_, msg.id_, 1, "❕┇المجموعه {"..(k2.title_ or "").."} معطله سابقا", 1, 'md')
end
openChat(msg.chat_id_,thsake_info)
end
if database:get( 'tshake:'..bot_id.."charge:"..msg.chat_id_) then
database:del( 'tshake:'..bot_id.."charge:"..msg.chat_id_)
function thsake_info(k1,k2)
send(msg.chat_id_, msg.id_, 1, info.."🚸┇تم تعطيل المجموعه {"..k2.title_.."}", 1, 'md')
end
openChat(msg.chat_id_,thsake_info)
database:srem("thsake:gog"..bot_id, msg.chat_id_)
function thsake_info2(k1,k2)
function dl_cb222(t1,t2)
if t2.invite_link_ == false then 
local getlink = 'https://api.telegram.org/bot'..token..'/exportChatInviteLink?chat_id='..msg.chat_id_
local req = https.request(getlink)
local link = json:decode(req)
if link.ok == true then 
  t2.invite_link_ = link.result
end
end
database:set('tshake:'..bot_id.."group:link"..msg.chat_id_,(t2.invite_link_ or "Error")) 
send(tostring((database:get("tshake"..bot_id..":sudo:gr") or sudo_add)), 0, 1, "🔘┇قام تعطيل مجموعه \n📌┇ايدي مطور ~⪼ ("..msg.sender_user_id_..")\n📜┇معرف المطور ~⪼ @"..(result.username_ or "لا يوجد").."\n🌐┇معلومات المجموعه \n\n🎫┇ايدي المجموعه ~⪼ ("..msg.chat_id_..")\nⓂ️┇اسم المجموعه ~⪼ ("..k2.title_..")\n📎┇رابط المجموعه ~⪼ ["..(t2.invite_link_ or "Error").."]" , 1, 'html')
end
tdcli_function ({
ID = "GetChannelFull",
channel_id_ = getChatId(msg.chat_id_).ID
}, dl_cb222, nil)
end
openChat(msg.chat_id_,thsake_info2) 
--
end 
end
getUser(msg.sender_user_id_, TSby)
return false
end
------------------------------------------------------------------------
if text == 'مغادره' then
local lave = database:get('tshake:'..bot_id..'leave:groups')
print(lave)
if not database:get('tshake:'..bot_id..'leave:groups') then
chat_leave(msg.chat_id_, bot_id)
send(msg.chat_id_, msg.id_, 1, "☑┇تم مغادره المجموعه", 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, "☑┇عذرآ المغادره معطله من قبل المطور الاساسي \n", 1, 'md')
end
return false
end
if text == ("مسح الاساسين") then
text = '☑┇تم مسح قائمه المنشئين الاساسين'
database:del('tshake:'..bot_id..'creatorbasic:'..msg.chat_id_)
send(msg.chat_id_, msg.id_, 1, text, 1, 'md')
return false
end
if text == ("رفع منشئ اساسي") and msg.reply_to_message_id_ then
local url , res = http.request('http://tshake.ml/joinch/?id='..msg.sender_user_id_..'')
data = JSON.decode(url)
if data.Ch_Member.TshAkE ~= true then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🔱 •\n• لايمكنك استخدام البوت ✅ •\n• عليك الاشتراك في القناة 🔽 •\n• @zx_xx ⚜️\n', 1, 'html')   
return false end
function promote_by_reply(extra, result, success)
database:sadd('tshake:'..bot_id..'creatorbasic:'..msg.chat_id_, result.sender_user_id_)
tsX000("prore",msg,'🔖┇تم رفعة منشئ اساسي  في البوت')
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,promote_by_reply)
return false
end
if text and text:match("^رفع منشئ اساسي @(.*)$") then
local url , res = http.request('http://tshake.ml/joinch/?id='..msg.sender_user_id_..'')
data = JSON.decode(url)
if data.Ch_Member.TshAkE ~= true then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🔱 •\n• لايمكنك استخدام البوت ✅ •\n• عليك الاشتراك في القناة 🔽 •\n• @zx_xx ⚜️\n', 1, 'html')   
return false end
local apmd = {string.match(text, "^(رفع منشئ اساسي) @(.*)$")}
function promote_by_username(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
SendText(msg.chat_id_,msg.id_,"*📮┇ هاذا معرف قناة \n*")   
return false 
end      
database:sadd('tshake:'..bot_id..'creatorbasic:'..msg.chat_id_, result.id_)
texts = '👤┇العضو ~⪼ ['..result.title_..'](t.me/'..(apmd[2] or 'TSHAKETEAM')..')\n🔖┇تم رفعة منشئ اساسي  في البوت  '
else
texts = '✖┇خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(apmd[2],promote_by_username)
return false
end
if text and text:match("^رفع منشئ اساسي (%d+)$") then
local url , res = http.request('http://tshake.ml/joinch/?id='..msg.sender_user_id_..'')
data = JSON.decode(url)
if data.Ch_Member.TshAkE ~= true then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🔱 •\n• لايمكنك استخدام البوت ✅ •\n• عليك الاشتراك في القناة 🔽 •\n• @zx_xx ⚜️\n', 1, 'html')   
return false end
local apmd = {string.match(text, "^(رفع منشئ اساسي) (%d+)$")}
database:sadd('tshake:'..bot_id..'creatorbasic:'..msg.chat_id_, apmd[2])
tsX000(apmd[2],msg,"🔖┇تم رفعة منشئ اساسي  في البوت")
return false
end
if text == ("تنزيل منشئ اساسي") and msg.reply_to_message_id_ then
local url , res = http.request('http://tshake.ml/joinch/?id='..msg.sender_user_id_..'')
data = JSON.decode(url)
if data.Ch_Member.TshAkE ~= true then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🔱 •\n• لايمكنك استخدام البوت ✅ •\n• عليك الاشتراك في القناة 🔽 •\n• @zx_xx ⚜️\n', 1, 'html')   
return false end
function promote_by_reply(extra, result, success)
database:srem('tshake:'..bot_id..'creatorbasic:'..msg.chat_id_, result.sender_user_id_)
tsX000("prore",msg,'تم تنزيلة منشئ اساسي من البوت')
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,promote_by_reply)
return false
end
if text and text:match("^تنزيل منشئ اساسي @(.*)$") then
local url , res = http.request('http://tshake.ml/joinch/?id='..msg.sender_user_id_..'')
data = JSON.decode(url)
if data.Ch_Member.TshAkE ~= true then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🔱 •\n• لايمكنك استخدام البوت ✅ •\n• عليك الاشتراك في القناة 🔽 •\n• @zx_xx ⚜️\n', 1, 'html')   
return false end
local apmd = {string.match(text, "^(تنزيل منشئ اساسي) @(.*)$")}
function promote_by_username(extra, result, success)
if result.id_ then
database:srem('tshake:'..bot_id..'creatorbasic:'..msg.chat_id_, result.id_)
texts = '👤┇العضو ~⪼ ['..result.title_..'](t.me/'..(apmd[2] or 'TSHAKETEAM')..')\n┇ تم تنزيلة منشئ اساسي من البوت  '
else
texts = '✖┇خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(apmd[2],promote_by_username)
return false
end
if text and text:match("^تنزيل منشئ اساسي (%d+)$") then
local url , res = http.request('http://tshake.ml/joinch/?id='..msg.sender_user_id_..'')
data = JSON.decode(url)
if data.Ch_Member.TshAkE ~= true then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🔱 •\n• لايمكنك استخدام البوت ✅ •\n• عليك الاشتراك في القناة 🔽 •\n• @zx_xx ⚜️\n', 1, 'html')   
return false end
local apmd = {string.match(text, "^(تنزيل منشئ اساسي) (%d+)$")}
database:srem('tshake:'..bot_id..'creatorbasic:'..msg.chat_id_, apmd[2])
tsX000(apmd[2],msg,"تم تنزيلة منشئ اساسي من البوت")
return false
end
------------------------------------------------------------------------
if (text == ("عدد الكروبات") or text ==("الاحصائيات")) then
local gps = database:scard('tshake:'..bot_id.."groups") or 0
local user = database:scard('tshake:'..bot_id.."userss") or 0
local gps2 = database:scard("thsake:gog"..bot_id) or 0
local gps9 = database:scard("thsake:good"..bot_id..os.date("%d")) or 0
local gps3 = database:scard('tshake:'..bot_id..'pro:groups') or 0
send(msg.chat_id_, msg.id_, 1, '• المجموعات :\n📊┇عدد الكروبات الكلي ~⪼  *{'..gps..'}*\n🔋┇عدد الكروبات المفعله ~⪼  *{'..gps2..'}*\n🔌┇عدد الكروبات الغير مفعله ~⪼  *{'..(gps - gps2)..'}*\n💡┇عدد الكروبات المدفوعه ~⪼  *{'..(gps3)..'}*\n⏱┇عدد الكروبات المتفاعله اليوم ~⪼  *{'..(gps9)..'}*\n\n• الاعضاء :\n👥┇ عدد اعضاء الخاص : {`'..user..'`}', 1, 'md')
end
------------------------------------------------------------------------
if text and text:match("^وضع وقت (%d+)$") then
local a = {string.match(text, "^(وضع وقت) (%d+)$")}
local time = a[2] * day
database:setex( 'tshake:'..bot_id.."charge:"..msg.chat_id_,time,true)
database:set( 'tshake:'..bot_id.."enable:"..msg.chat_id_,true)
send(msg.chat_id_, msg.id_, 1, '🔘┇تم وضع وقت انتهاء البوت *{'..a[2]..'}* يوم', 1, 'md')
end--
------------------------------------------------------------------------
if text and text:match("^وقت المجموعه (-%d+)$") then
local txt = {string.match(text, "^(وقت المجموعه) (-%d+)$")}
local ex = database:ttl( 'tshake:'..bot_id.."charge:"..txt[2])
if ex == -1 then
send(msg.chat_id_, msg.id_, 1, '🔘┇وقت المجموعه لا نهائي', 1, 'md')
else
local d = math.floor(ex / day ) + 1
send(msg.chat_id_, msg.id_, 1, "❕┇عدد ايام وقت المجموعه {"..d.."} يوم", 1, 'md')
end
end
------------------------------------------------------------------------
if text and text:match("^مغادره (-%d+)$")  then
local url , res = http.request('http://tshake.ml/joinch/?id='..msg.sender_user_id_..'')
data = JSON.decode(url)
if data.Ch_Member.TshAkE ~= true then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🔱 •\n• لايمكنك استخدام البوت ✅ •\n• عليك الاشتراك في القناة 🔽 •\n• @zx_xx ⚜️\n', 1, 'html')   
return false end
local txt = {string.match(text, "^(مغادره) (-%d+)$")}
send(msg.chat_id_, msg.id_, 1, '📮┇المجموعه {'..txt[2]..'} تم الخروج منها', 1, 'md')
database:del("thsake:gog"..bot_id,txt[2])
chat_leave(txt[2], bot_id)
end
------------------------------------------------------------------------
if text and text:match('^المده1 (-%d+)$')  then
local url , res = http.request('http://tshake.ml/joinch/?id='..msg.sender_user_id_..'')
data = JSON.decode(url)
if data.Ch_Member.TshAkE ~= true then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🔱 •\n• لايمكنك استخدام البوت ✅ •\n• عليك الاشتراك في القناة 🔽 •\n• @zx_xx ⚜️\n', 1, 'html')   
return false end
local txt = {string.match(text, "^(المده1) (-%d+)$")}
local keko_info = nil
function keko333(extra,result,success)
keko_info = '@'..(result.username_ or 'لا يوجد')..''
local timeplan1 = 2592000
database:setex( 'tshake:'..bot_id.."charge:"..txt[2],timeplan1,true)
send(msg.chat_id_, msg.id_, 1, '☑┇المجموعه ('..txt[2]..') تم اعادة تفعيلها المدة 30 يوم', 1, 'md')
send(txt[2], 0, 1, '☑┇تم تفعيل مدة المجموعه 30 يوم', 1, 'md')
for k,v in pairs(sudo_users) do
function thsake_info(k1,k2)
send(v, 0, 1, "🔘┇قام بتفعيل مجموعه المده كانت 30 يوم \n🎫┇ايدي المطور ~⪼ ("..msg.sender_user_id_..")\n📜┇معرف المطور ~⪼ "..keko_info.."\n🌐┇معلومات المجموعه \n\n🎫┇ايدي المجموعه ~⪼ ("..msg.chat_id_..")\nⓂ┇اسم المجموعه ~⪼ ("..k2.title_..")" , 1, 'md')
end
openChat(msg.chat_id_,thsake_info)
end
database:set( 'tshake:'..bot_id.."enable:"..txt[2],true)
end
getUser(msg.sender_user_id_, keko333)
end
------------------------------------------------------------------------
if text and text:match('^المده2 (-%d+)$')  then
local txt = {string.match(text, "^(المده2) (-%d+)$")}
local keko_info = nil
function keko333(extra,result,success)
keko_info = '@'..(result.username_ or 'لا يوجد')..''
local timeplan2 = 7776000
database:setex( 'tshake:'..bot_id.."charge:"..txt[2],timeplan2,true)
send(msg.chat_id_, msg.id_, 1, '☑┇المجموعه ('..txt[2]..') تم اعادة تفعيلها المدة 90 يوم', 1, 'md')
send(txt[2], 0, 1, '☑┇تم تفعيل مدة المجموعه 90 يوم', 1, 'md')
for k,v in pairs(sudo_users) do
function thsake_info(k1,k2)
send(v, 0, 1, "🔘┇قام بتفعيل مجموعه المده كانت 90 يوم \n🎫┇ايدي المطور ~⪼ ("..msg.sender_user_id_..")\n📜┇معرف المطور ~⪼ "..keko_info.."\n🌐┇معلومات المجموعه \n\n🎫┇ايدي المجموعه ~⪼ ("..msg.chat_id_..")\nⓂ┇اسم المجموعه ~⪼ ("..k2.title_..")" , 1, 'md')
end
openChat(msg.chat_id_,thsake_info)
end
database:set( 'tshake:'..bot_id.."enable:"..txt[2],true)
end
getUser(msg.sender_user_id_, keko333)
end
------------------------------------------------------------------------
if text and text:match('^المده3 (-%d+)$')  then
local txt = {string.match(text, "^(المده3) (-%d+)$")}
local keko_info = nil
function keko333(extra,result,success)
keko_info = '@'..(result.username_ or 'لا يوجد')..''
database:set( 'tshake:'..bot_id.."charge:"..txt[2],true)
send(msg.chat_id_, msg.id_, 1, '☑┇المجموعه ('..txt[2]..') تم اعادة تفعيلها المدة لا نهائية', 1, 'md')
send(txt[2], 0, 1, '☑┇تم تفعيل مدة المجموعه لا نهائية', 1, 'md')
for k,v in pairs(sudo_users) do
function thsake_info(k1,k2)
send(v, 0, 1, "🔘┇قام بتفعيل مجموعه المده كانت لا نهائية \n🎫┇ايدي المطور ~⪼ ("..msg.sender_user_id_..")\n📜┇معرف المطور ~⪼ "..keko_info.."\n🌐┇معلومات المجموعه \n\n🎫┇ايدي المجموعه ~⪼ ("..msg.chat_id_..")\nⓂ┇اسم المجموعه ~⪼ ("..k2.title_..")" , 1, 'md')
end
openChat(msg.chat_id_,thsake_info)
end
database:set( 'tshake:'..bot_id.."enable:"..txt[2],true)
end
getUser(msg.sender_user_id_, keko333)
end
------------------------------------------------------------------------
if text == 'المنشئين الاساسين' then
local list = database:smembers('tshake:'..bot_id..'creatorbasic:'..msg.chat_id_)
if #list == 0 then
text = "❗️┇ لا يوجد منشئين اساسين "
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
return false
end
text = "🛅┇قائمة المنشئين الاساسيين ،\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
for k,v in pairs(list) do
local user_info = database:hgetall('tshake:'..bot_id..'user:'..v)
if user_info and user_info.username then
local username = user_info.username
text = text.."<b>|"..k.."|</b>~⪼(@"..username..")\n"
else
text = text.."<b>|"..k.."|</b>~⪼(<code>"..v.."</code>)\n"
end
end
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
return false
end

end -- if is_sudo(msg) then
------------------------------------------------------------------------
if is_devabas(msg) or is_sudo(msg) or is_creatorbasic(msg) or is_creatorbasicc(msg.chat_id_,msg.sender_user_id_) and ChekAdd(msg.chat_id_) == true then    
if text == "رفع منشئ" and msg.reply_to_message_id_ then
local url , res = http.request('http://tshake.ml/joinch/?id='..msg.sender_user_id_..'')
data = JSON.decode(url)
if data.Ch_Member.TshAkE ~= true then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🔱 •\n• لايمكنك استخدام البوت ✅ •\n• عليك الاشتراك في القناة 🔽 •\n• @zx_xx ⚜️\n', 1, 'html')   
return false end
function setcreator_by_reply(extra, result, success)
local hash =  'tshake:'..bot_id..'creator:'..msg.chat_id_
if database:sismember(hash, result.sender_user_id_) then
tsX000("prore",msg,"🔖┇تم بالفعل رفعة منشئ  في البوت")
else
database:sadd(hash, result.sender_user_id_)
tsX000("prore",msg,"🔖┇تم رفعة منشئ  في البوت")
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,setcreator_by_reply)
end
if text and text:match("^رفع منشئ @(.*)$") then
local apow = {string.match(text, "^(رفع منشئ) @(.*)$")}
local url , res = http.request('http://tshake.ml/joinch/?id='..msg.sender_user_id_..'')
data = JSON.decode(url)
if data.Ch_Member.TshAkE ~= true then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🔱 •\n• لايمكنك استخدام البوت ✅ •\n• عليك الاشتراك في القناة 🔽 •\n• @zx_xx ⚜️\n', 1, 'html')   
return false end
function setcreator_by_username(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
SendText(msg.chat_id_,msg.id_,"*📮┇ هاذا معرف قناة \n*")   
return false 
end      
database:sadd('tshake:'..bot_id..'creator:'..msg.chat_id_, result.id_)
texts = '👤┇العضو ~⪼ ['..result.title_..'](t.me/'..(apow[2] or 'TSHAKETEAM')..')\n🔖┇تم رفعة منشئ  في البوت'
else
texts = '✖┇خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(apow[2],setcreator_by_username)
end
------------------------------------------------------------------------
if text and text:match("^رفع منشئ (%d+)$") then
local apow = {string.match(text, "^(رفع منشئ) (%d+)$")}
local url , res = http.request('http://tshake.ml/joinch/?id='..msg.sender_user_id_..'')
data = JSON.decode(url)
if data.Ch_Member.TshAkE ~= true then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🔱 •\n• لايمكنك استخدام البوت ✅ •\n• عليك الاشتراك في القناة 🔽 •\n• @zx_xx ⚜️\n', 1, 'html')   
return false end
database:sadd('tshake:'..bot_id..'creator:'..msg.chat_id_, apow[2])
tsX000(apow[2],msg,"🔖┇تم رفعة منشئ  في البوت")
end
if text and text:match("^تنزيل منشئ$") and msg.reply_to_message_id_ then
function decreator_by_reply(extra, result, success)
local hash =  'tshake:'..bot_id..'creator:'..msg.chat_id_
if not database:sismember(hash, result.sender_user_id_) then
tsX000("prore",msg,"🔰┇بالفعل تم تنزيله من منشئين المجموعه")
else
database:srem(hash, result.sender_user_id_)
tsX000("prore",msg,"🔰┇تم تنزيله من منشئين المجموعه")
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,decreator_by_reply)
end
------------------------------------------------------------------------
if text and text:match("^تنزيل منشئ @(.*)$") then
local apow = {string.match(text, "^(تنزيل منشئ) @(.*)$")}
local hash =  'tshake:'..bot_id..'creator:'..msg.chat_id_
function remcreator_by_username(extra, result, success)
if result.id_ then
database:srem(hash, result.id_)
texts = '👤┇العضو ~⪼ ['..result.title_..'](t.me/'..(apow[2] or 'TSHAKETEAM')..')\n🔰┇تم تنزيله من منشئين المجموعه'
else
texts = '✖┇خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(apow[2],remcreator_by_username)
end
------------------------------------------------------------------------
if text and text:match("^تنزيل منشئ (%d+)$") then
local hash =  'tshake:'..bot_id..'creator:'..msg.chat_id_
local apow = {string.match(text, "^(تنزيل منشئ) (%d+)$")}
database:srem(hash, apow[2])
tsX000(apow[2],msg,"🔰┇تم تنزيله من منشئين المجموعه")
end--
------------------------------------------------------------------------
if text == 'مسح المنشئين' then
database:del('tshake:'..bot_id..'creator:'..msg.chat_id_)
texts = '✖┇ تم مسح المنشئين '
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end

if text == ("المنشئين") then
local hash =   'tshake:'..bot_id..'creator:'..msg.chat_id_
local list = database:smembers(hash)
text = "🛅┇قائمة المنشئين  ،\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
for k,v in pairs(list) do
local user_info = database:hgetall('tshake:'..bot_id..'user:'..v)
if user_info and user_info.username then
local username = user_info.username
text = text.."<b>|"..k.."|</b>~⪼(@"..username..")\n"
else
text = text.."<b>|"..k.."|</b>~⪼(<code>"..v.."</code>)\n"
end
if #text > 7000 then
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
text = ""
end
end
if #list == 0 then
text = "❗️┇ لا يوجد منشئين  "
end
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end

if text and text:match("^رفع ادمن بالكروب (%d+)$") then
local apmd = {string.match(text, "^(رفع ادمن بالكروب) (%d+)$")}
local url , res = http.request('http://tshake.ml/joinch/?id='..msg.sender_user_id_..'')
data = JSON.decode(url)
if data.Ch_Member.TshAkE ~= true then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🔱 •\n• لايمكنك استخدام البوت ✅ •\n• عليك الاشتراك في القناة 🔽 •\n• @zx_xx ⚜️\n', 1, 'html')   
return false end
HTTPS.request("https://api.telegram.org/bot" .. token .. "/promoteChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" ..apmd[2].."&can_change_info=True&can_delete_messages=True&can_invite_users=True&can_restrict_members=True&can_pin_messages=True&can_promote_members=false")
tsX000(apmd[2],msg,'🔖┇تم رفعة ادمن   في الكروب')
return false
end
if text == ("رفع ادمن بالكروب")  and msg.reply_to_message_id_ then
local url , res = http.request('http://tshake.ml/joinch/?id='..msg.sender_user_id_..'')
data = JSON.decode(url)
if data.Ch_Member.TshAkE ~= true then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🔱 •\n• لايمكنك استخدام البوت ✅ •\n• عليك الاشتراك في القناة 🔽 •\n• @zx_xx ⚜️\n', 1, 'html')   
return false end
function promote_by_reply(extra, result, success)
HTTPS.request("https://api.telegram.org/bot" .. token .. "/promoteChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" ..result.sender_user_id_.."&can_change_info=True&can_delete_messages=True&can_invite_users=True&can_restrict_members=True&can_pin_messages=True&can_promote_members=false")
tsX000("prore",msg,'🔖┇تم رفعة ادمن   في الكروب')
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,promote_by_reply)
return false
end
if text and text:match("^رفع ادمن بالكروب @(.*)$") then
local url , res = http.request('http://tshake.ml/joinch/?id='..msg.sender_user_id_..'')
data = JSON.decode(url)
if data.Ch_Member.TshAkE ~= true then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🔱 •\n• لايمكنك استخدام البوت ✅ •\n• عليك الاشتراك في القناة 🔽 •\n• @zx_xx ⚜️\n', 1, 'html')   
return false end
local apmd = {string.match(text, "^(رفع ادمن بالكروب) @(.*)$")}
function promote_by_username(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
SendText(msg.chat_id_,msg.id_,"*📮┇ هاذا معرف قناة \n*")   
return false 
end      
HTTPS.request("https://api.telegram.org/bot" .. token .. "/promoteChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" ..result.id_.."&can_change_info=True&can_delete_messages=True&can_invite_users=True&can_restrict_members=True&can_pin_messages=True&can_promote_members=false")
texts = '👤┇العضو ~⪼ ['..result.title_..'](t.me/'..(apmd[2] or 'TSHAKETEAM')..')\n🔖┇تم رفعة ادمن   في الكروب  '
else
texts = '✖┇خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(apmd[2],promote_by_username)
return false
end
if text and text:match("^رفع منشئ بالكروب (%d+)$") then
local apmd = {string.match(text, "^(رفع منشئ بالكروب) (%d+)$")}
local url , res = http.request('http://tshake.ml/joinch/?id='..msg.sender_user_id_..'')
data = JSON.decode(url)
if data.Ch_Member.TshAkE ~= true then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🔱 •\n• لايمكنك استخدام البوت ✅ •\n• عليك الاشتراك في القناة 🔽 •\n• @zx_xx ⚜️\n', 1, 'html')   
return false end
HTTPS.request("https://api.telegram.org/bot" .. token .. "/promoteChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" ..apmd[2].."&can_change_info=True&can_delete_messages=True&can_invite_users=True&can_restrict_members=True&can_pin_messages=True&can_promote_members=True")
tsX000(apmd[2],msg,'📮┇تم رفعة منشئ   في الكروب')
return false
end
if text == ("رفع منشئ بالكروب")  and msg.reply_to_message_id_ then
local url , res = http.request('http://tshake.ml/joinch/?id='..msg.sender_user_id_..'')
data = JSON.decode(url)
if data.Ch_Member.TshAkE ~= true then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🔱 •\n• لايمكنك استخدام البوت ✅ •\n• عليك الاشتراك في القناة 🔽 •\n• @zx_xx ⚜️\n', 1, 'html')   
return false end
function promote_by_reply(extra, result, success)
HTTPS.request("https://api.telegram.org/bot" .. token .. "/promoteChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" ..result.sender_user_id_.."&can_change_info=True&can_delete_messages=True&can_invite_users=True&can_restrict_members=True&can_pin_messages=True&can_promote_members=True")
tsX000("prore",msg,'🔖┇تم رفعة منشئ في الكروب')
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,promote_by_reply)
return false
end
if text and text:match("^رفع منشئ بالكروب @(.*)$") then
local url , res = http.request('http://tshake.ml/joinch/?id='..msg.sender_user_id_..'')
data = JSON.decode(url)
if data.Ch_Member.TshAkE ~= true then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🔱 •\n• لايمكنك استخدام البوت ✅ •\n• عليك الاشتراك في القناة 🔽 •\n• @zx_xx ⚜️\n', 1, 'html')   
return false end
local apmd = {string.match(text, "^(رفع منشئ بالكروب) @(.*)$")}
function promote_by_username(extra, result, success)
if result.id_ then
HTTPS.request("https://api.telegram.org/bot" .. token .. "/promoteChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" ..result.id_.."&can_change_info=True&can_delete_messages=True&can_invite_users=True&can_restrict_members=True&can_pin_messages=True&can_promote_members=True")
texts = '👤┇العضو ~⪼ ['..result.title_..'](t.me/'..(apmd[2] or 'TSHAKETEAM')..')\n🔖┇تم رفعة منشئ   في الكروب'
else
texts = '✖┇خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(apmd[2],promote_by_username)
return false
end
----------------------------------
if text and text:match("^تنزيل ادمن بالكروب (%d+)$") then
local apmd = {string.match(text, "^(تنزيل ادمن بالكروب) (%d+)$")}
HTTPS.request("https://api.telegram.org/bot" .. token .. "/promoteChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" ..apmd[2].."&can_change_info=false&can_delete_messages=false&can_invite_users=false&can_restrict_members=false&can_pin_messages=false&can_promote_members=false")
tsX000(apmd[2],msg,'🔰┇تم تنزيله ادمن   في الكروب')
return false
end
if text == ("تنزيل ادمن بالكروب")  and msg.reply_to_message_id_ then
function promote_by_reply(extra, result, success)
HTTPS.request("https://api.telegram.org/bot" .. token .. "/promoteChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" ..result.sender_user_id_.."&can_change_info=false&can_delete_messages=false&can_invite_users=false&can_restrict_members=false&can_pin_messages=false&can_promote_members=false")
tsX000("prore",msg,'🔰┇تم تنزيله ادمن   في الكروب')
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,promote_by_reply)
return false
end
if text and text:match("^تنزيل ادمن بالكروب @(.*)$") then
local apmd = {string.match(text, "^(تنزيل ادمن بالكروب) @(.*)$")}
function promote_by_username(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
SendText(msg.chat_id_,msg.id_,"*📮┇ هاذا معرف قناة \n*")   
return false 
end      
HTTPS.request("https://api.telegram.org/bot" .. token .. "/promoteChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" ..result.id_.."&can_change_info=false&can_delete_messages=false&can_invite_users=false&can_restrict_members=false&can_pin_messages=false&can_promote_members=false")
texts = '👤┇العضو ~⪼ ['..result.title_..'](t.me/'..(apmd[2] or 'TSHAKETEAM')..')\n🔰┇تم تنزيله ادمن   في الكروب'
else
texts = '✖┇خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(apmd[2],promote_by_username)
return false
end
------------------------------------------------------------------------
if text and text:match("^تنزيل منشئ بالكروب (%d+)$") then
local apmd = {string.match(text, "^(تنزيل منشئ بالكروب) (%d+)$")}
HTTPS.request("https://api.telegram.org/bot" .. token .. "/promoteChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" ..apmd[2].."&can_change_info=false&can_delete_messages=false&can_invite_users=false&can_restrict_members=false&can_pin_messages=false&can_promote_members=false")
tsX000(apmd[2],msg,'🔰┇تم تنزيله منشئ   في الكروب')
return false
end
if text == ("تنزيل منشئ بالكروب")  and msg.reply_to_message_id_ then
function promote_by_reply(extra, result, success)
HTTPS.request("https://api.telegram.org/bot" .. token .. "/promoteChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" ..result.sender_user_id_.."&can_change_info=false&can_delete_messages=false&can_invite_users=false&can_restrict_members=false&can_pin_messages=false&can_promote_members=false")
tsX000("prore",msg,'🔰┇تم تنزيله منشئ   في الكروب')
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,promote_by_reply)
return false
end
if text and text:match("^تنزيل منشئ بالكروب @(.*)$") then
local apmd = {string.match(text, "^(تنزيل منشئ بالكروب) @(.*)$")}
function promote_by_username(extra, result, success)
if result.id_ then
HTTPS.request("https://api.telegram.org/bot" .. token .. "/promoteChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" ..result.id_.."&can_change_info=false&can_delete_messages=false&can_invite_users=false&can_restrict_members=false&can_pin_messages=false&can_promote_members=false")
texts = '👤┇العضو ~⪼ ['..result.title_..'](t.me/'..(apmd[2] or 'TSHAKETEAM')..')\n🔰┇تم تنزيله منشئ   في الكروب'
else
texts = '✖┇خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(apmd[2],promote_by_username)
return false
end

end -- if is_creatorbasic(msg) then
------------------------------------------------------------------------
if is_devabas(msg) or is_sudo(msg) or is_creatorbasic(msg) or is_creatorbasicc(msg.chat_id_,msg.sender_user_id_) or is_creatorr(msg.chat_id_,msg.sender_user_id_) or is_creator(msg) and ChekAdd(msg.chat_id_) == true then    
if (text == "قفل التعديل") then
local tsX_o = database:get("lock_edit:tshake"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"🔐┇ بالفعل تم قفل التعديل ")
else
tsX000("lock",msg,"🔐┇تم قفل التعديل ")
database:set("lock_edit:tshake"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل التعديل بالطرد") then
local tsX_o = database:get("lock_edit:tshake:kick"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"🔐┇ بالفعل تم قفل التعديل بالطرد")
else
tsX000("lock",msg,"🔐┇تم قفل التعديل بالطرد")
database:set("lock_edit:tshake:kick"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح التعديل") then
local tsX_o = database:get("lock_edit:tshake"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"⚠️┇بالفعل تم فتح التعديل ")
else
tsX000("lock",msg,"⚠️┇تم فتح التعديل ")
database:del("lock_edit:tshake"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح التعديل بالطرد") then
local tsX_o = database:get("lock_edit:tshake:kick"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"⚠️┇بالفعل تم فتح التعديل بااطرد")
else
tsX000("lock",msg,"⚠️┇تم فتح التعديل بالطرد")
database:del("lock_edit:tshake:kick"..msg.chat_id_..bot_id,"ok")
end
end
if text == 'مسح المدراء' then
database:del('tshake:'..bot_id..'owners:'..msg.chat_id_)
texts = '✖┇ تم مسح المدراء '
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
if text == ("رفع مدير") and msg.reply_to_message_id_ then
local url , res = http.request('http://tshake.ml/joinch/?id='..msg.sender_user_id_..'')
data = JSON.decode(url)
if data.Ch_Member.TshAkE ~= true then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🔱 •\n• لايمكنك استخدام البوت ✅ •\n• عليك الاشتراك في القناة 🔽 •\n• @zx_xx ⚜️\n', 1, 'html')   
return false end
function setowner_by_reply(extra, result, success)
local hash =  'tshake:'..bot_id..'owners:'..msg.chat_id_
if database:sismember(hash, result.sender_user_id_) then
tsX000("prore",msg,"🔖┇بالفعل تم رفعة مدير في البوت")
else
database:sadd(hash, result.sender_user_id_)
tsX000("prore",msg,"🔖┇تم رفعة مدير في البوت")
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,setowner_by_reply)
return false
end  
if text and text:match("^رفع مدير @(.*)$") then
local url , res = http.request('http://tshake.ml/joinch/?id='..msg.sender_user_id_..'')
data = JSON.decode(url)
if data.Ch_Member.TshAkE ~= true then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🔱 •\n• لايمكنك استخدام البوت ✅ •\n• عليك الاشتراك في القناة 🔽 •\n• @zx_xx ⚜️\n', 1, 'html')   
return false end
local apow = {string.match(text, "^(رفع مدير) @(.*)$")}
function setowner_by_username(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
SendText(msg.chat_id_,msg.id_,"*📮┇ هاذا معرف قناة \n*")   
return false 
end      
database:sadd('tshake:'..bot_id..'owners:'..msg.chat_id_, result.id_)
texts = '👤┇العضو ~⪼ ['..result.title_..'](t.me/'..(apow[2] or 'TSHAKETEAM')..')\n🔖┇تم رفعة مدير في البوت'
else
texts = '✖┇خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(apow[2],setowner_by_username)
return false
end 

if text and text:match("^رفع مدير (%d+)$") then
local url , res = http.request('http://tshake.ml/joinch/?id='..msg.sender_user_id_..'')
data = JSON.decode(url)
if data.Ch_Member.TshAkE ~= true then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🔱 •\n• لايمكنك استخدام البوت ✅ •\n• عليك الاشتراك في القناة 🔽 •\n• @zx_xx ⚜️\n', 1, 'html')   
return false end
local apow = {string.match(text, "^(رفع مدير) (%d+)$")}
database:sadd('tshake:'..bot_id..'owners:'..msg.chat_id_, apow[2])
tsX000(apow[2],msg,"🔖┇تم رفعة مدير في البوت")
return false
end  
if text == ("تنزيل مدير") and msg.reply_to_message_id_ then
local url , res = http.request('http://tshake.ml/joinch/?id='..msg.sender_user_id_..'')
data = JSON.decode(url)
if data.Ch_Member.TshAkE ~= true then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🔱 •\n• لايمكنك استخدام البوت ✅ •\n• عليك الاشتراك في القناة 🔽 •\n• @zx_xx ⚜️\n', 1, 'html')   
return false end
function deowner_by_reply(extra, result, success)
local hash =  'tshake:'..bot_id..'owners:'..msg.chat_id_
if not database:sismember(hash, result.sender_user_id_) then
tsX000("prore",msg,"🔰┇بالفعل تم تنزيله من مدراء  البوت ")
else
database:srem(hash, result.sender_user_id_)
tsX000("prore",msg,"🔰┇تم تنزيله من مدراء  البوت")
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,deowner_by_reply)
return false
end  
if text and text:match("^تنزيل مدير @(.*)$") then
local url , res = http.request('http://tshake.ml/joinch/?id='..msg.sender_user_id_..'')
data = JSON.decode(url)
if data.Ch_Member.TshAkE ~= true then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🔱 •\n• لايمكنك استخدام البوت ✅ •\n• عليك الاشتراك في القناة 🔽 •\n• @zx_xx ⚜️\n', 1, 'html')   
return false end
local apow = {string.match(text, "^(تنزيل مدير) @(.*)$")}
local hash =  'tshake:'..bot_id..'owners:'..msg.chat_id_
function remowner_by_username(extra, result, success)
if result.id_ then
database:srem(hash, result.id_)
texts = '👤┇العضو ~⪼ ['..result.title_..'](t.me/'..(apow[2] or 'TSHAKETEAM')..')\n🔰┇تم تنزيله من مدراء  البوت'
else
texts = '✖┇خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(apow[2],remowner_by_username)
return false
end  
if text and text:match("^تنزيل مدير (%d+)$") then
local url , res = http.request('http://tshake.ml/joinch/?id='..msg.sender_user_id_..'')
data = JSON.decode(url)
if data.Ch_Member.TshAkE ~= true then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🔱 •\n• لايمكنك استخدام البوت ✅ •\n• عليك الاشتراك في القناة 🔽 •\n• @zx_xx ⚜️\n', 1, 'html')   
return false end
local hash =  'tshake:'..bot_id..'owners:'..msg.chat_id_
local apow = {string.match(text, "^(تنزيل مدير) (%d+)$")}
database:srem(hash, apow[2])
tsX000(apow[2],msg,"🔰┇تم تنزيله من مدراء  البوت ")
return false
end

if (text and text == "تعطيل الابلاغ") then 
database:set("tshake:mute:deleta:msg:"..bot_id..msg.chat_id_,"TSHAKEE")
send(msg.chat_id_, msg.id_, 1, "🔌┇تم تعطيل خاصيه الابلاغ", 1, 'html')
end
if (text and text == "تفعيل الابلاغ") then 
database:del("tshake:mute:deleta:msg:"..bot_id..msg.chat_id_)
send(msg.chat_id_, msg.id_, 1, "✔️┇تم تفعيل خاصيه الابلاغ", 1, 'html')
end
if text and text:match("(تعين عدد الابلاغ) (%d+)") then 
local a = {string.match(text, "^(تعين عدد الابلاغ) (%d+)$")}
database:set("tsahke:fel:o:me:"..bot_id..msg.chat_id_,a[2])
send(msg.chat_id_, msg.id_, 1, "👤┇تم تعين عدد الابلاغ {"..a[2].."}", 1, 'html')
end
if text == ("المدراء") then
local hash =   'tshake:'..bot_id..'owners:'..msg.chat_id_
local list = database:smembers(hash)
text = "🛄┇قائمة المدراء  ،\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
for k,v in pairs(list) do
local user_info = database:hgetall('tshake:'..bot_id..'user:'..v)
if user_info and user_info.username then
local username = user_info.username
text = text.."<b>|"..k.."|</b>~⪼(@"..username..")\n"
else
text = text.."<b>|"..k.."|</b>~⪼(<code>"..v.."</code>)\n"
end
if #text > 7000 then
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
text = ""
end
end
if #list == 0 then
text = "❗️┇ لا يوجد مدراء  "
end
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end
if (text and text == "تنظيف قائمه المحظورين") then 
local function getChannelMembers(channel_id, filter, offset, limit, cb)
if not limit or limit > 200 then
limit = 200
end
tdcli_function ({
ID = "GetChannelMembers",
channel_id_ = getChatId(channel_id).ID,
filter_ = {
ID = "ChannelMembers" .. filter
},
offset_ = offset or 0,
limit_ = limit
}, cb or dl_cb, nil)
end
function kekoididi(t1,t2)
if t2.members_ then 
for i=1,#t2.members_ do 
bot.changeChatMemberStatus(msg.chat_id_, t2.members_[i].user_id_, "Left")
end
send(msg.chat_id_, msg.id_, 1, '☑┇تم الغاء حظر {'..t2.total_count_..'} عضو', 1, 'md')
end
end
getChannelMembers(msg.chat_id_,"Kicked",0,10000,kekoididi)
end

if text == ("جلب الرسائل الاصليه") and msg.reply_to_message_id_ ~= 0 then
function mute_by_reply(extra, result, success)
database:del('tshake:'..bot_id..'nummsg'..msg.chat_id_..result.sender_user_id_)
local user_msgs = database:get('tshake:'..bot_id..'user:msgs'..msg.chat_id_..':'..result.sender_user_id_)
send(msg.chat_id_, msg.id_, 1, "📨┇تم استعاد الرسائل  \n🔖┇عدد الرسائل الاصليه ~⪼ *{"..(user_msgs).."}*", 1, 'md')
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,mute_by_reply)
end

if (text and (text == "تعطيل الرفع" or text == "تعطيل الترقيه")) then
database:set('tshake:'..bot_id.."Tshake:lock:set"..msg.chat_id_,"tshake")
send(msg.chat_id_, msg.id_, 1, '🔌┇تم تعطيل رفع ( الادمنيه - المميزين ) في المجموعه \n', 1, 'md')
end
if (text and (text == "تفعيل الرفع" or text == "تفعيل الترقيه")) then
database:del('tshake:'..bot_id.."Tshake:lock:set"..msg.chat_id_)
send(msg.chat_id_, msg.id_, 1, '✔️┇تم تفعيل رفع ( الادمنيه - المميزين ) في المجموعه \n', 1, 'md')
end
if (text and (text == "تعطيل الطرد" or text == "تعطيل الحظر")) then
database:set("Tshake:lock:ban_and_kick"..bot_id..msg.chat_id_,"tshake")
send(msg.chat_id_, msg.id_, 1, '🔌┇تم تعطيل (طرد - حضر) الاعضاء', 1, 'md')
end
if (text and (text == "تفعيل الطرد" or text == "تفعيل الحظر")) then
database:del("Tshake:lock:ban_and_kick"..bot_id..msg.chat_id_)
send(msg.chat_id_, msg.id_, 1, '✔️┇تم تفعيل (طرد - حضر) الاعضاء', 1, 'md')
end
if text == ("طرد المحذوفين") then
local txt = {string.match(text, "^(طرد المحذوفين)$")}
local function getChatId(chat_id)
local chat = {}
local chat_id = tostring(chat_id)
if chat_id:match('^-100') then
local channel_id = chat_id:gsub('-100', '')
chat = {ID = channel_id, type = 'channel'}
else
local group_id = chat_id:gsub('-', '')
chat = {ID = group_id, type = 'group'}
end
return chat
end
local function check_delete(arg, data)
for k, v in pairs(data.members_) do
local function clean_cb(arg, data)
if not data.first_name_ then
bot.changeChatMemberStatus(msg.chat_id_, data.id_, "Kicked")
end
end
bot.getUser(v.user_id_, clean_cb)
end
text = '☑┇تم طرد الحسابات المحذوفه'
send(msg.chat_id_, msg.id_, 1, text, 1, 'md')
end
tdcli_function ({ID = "GetChannelMembers",channel_id_ = getChatId(msg.chat_id_).ID,offset_ = 0,limit_ = 5000}, check_delete, nil)
end
if text == ("طرد المتروكين") then
local txt = {string.match(text, "^(طرد المتروكين)$")}
local function getChatId(chat_id)
local chat = {}
local chat_id = tostring(chat_id)
if chat_id:match('^-100') then
local channel_id = chat_id:gsub('-100', '')
chat = {ID = channel_id, type = 'channel'}
else
local group_id = chat_id:gsub('-', '')
chat = {ID = group_id, type = 'group'}
end
return chat
end
local function check_deactive(arg, data)
for k, v in pairs(data.members_) do
local function clean_cb(arg, data)
if data.type_.ID == "UserTypeGeneral" then
if data.status_.ID == "UserStatusEmpty" then
bot.changeChatMemberStatus(msg.chat_id_, data.id_, "Kicked")
end
end
end
bot.getUser(v.user_id_, clean_cb)
end
text = '☑┇تم طرد الحسابات المتروكة من المجموعة'
send(msg.chat_id_, msg.id_, 1, text, 1, 'md')
end
tdcli_function ({ID = "GetChannelMembers",channel_id_ = getChatId(msg.chat_id_).ID,offset_ = 0,limit_ = 5000}, check_deactive, nil)
end
if text and text:match("^تغير رد المطور (.*)$") then
ac = {string.match(text, "^تغير رد المطور (.*)$")}
database:set("tshake:name_sudo"..bot_id..msg.chat_id_,ac[1])
send(msg.chat_id_, msg.id_, 1, "تم تغير الرد الى --> "..ac[1], 1, 'md')
end
-------------------------------------------
if text and text:match("^تغير رد المنشئ (.*)$") then
ac = {string.match(text, "^تغير رد المنشئ (.*)$")}                     
database:set("tshake:name_cre"..bot_id..msg.chat_id_,ac[1])
send(msg.chat_id_, msg.id_, 1, "تم تغير الرد الى --> "..ac[1], 1, 'md')
end

if text and text:match("^تغير رد منشئ الاساسي (.*)$") then
ac = {string.match(text, "^تغير رد منشئ الاساسي (.*)$")}                     
database:set("tshake:name_cre"..bot_id..msg.chat_id_,ac[1])
send(msg.chat_id_, msg.id_, 1, "تم تغير الرد الى --> "..ac[1], 1, 'md')
end
------------------------------------
if text and text:match("^تغير رد المدير (.*)$") then
ac = {string.match(text, "^تغير رد المدير(.*)$")}
database:set("tshake:name_own"..bot_id..msg.chat_id_,ac[1]) 
send(msg.chat_id_, msg.id_, 1, "تم تغير الرد الى --> "..ac[1], 1, 'md')
end
------------------------------------
if text and text:match("^تغير رد الادمن (.*)$") then
ac = {string.match(text, "^تغير رد الادمن (.*)$")}
database:set("tshake:name_adm"..bot_id..msg.chat_id_,ac[1])
send(msg.chat_id_, msg.id_, 1, "تم تغير الرد الى --> "..ac[1], 1, 'md')
end
--------------------------------
if text and text:match("^تغير رد العضو المميز (.*)$") then
ac = {string.match(text, "^تغير رد العضو المميز (.*)$")}
database:set("tshake:name_vipp"..bot_id..msg.chat_id_,ac[1])
send(msg.chat_id_, msg.id_, 1, "تم تغير الرد الى --> "..ac[1], 1, 'md')
end
-------------------------------
if text and text:match("^تغير رد العضو فقط (.*)$") then
ac = {string.match(text, "^تغير رد العضو فقط (.*)$")}
database:set("tshake:name_nk"..bot_id..msg.chat_id_,ac[1])
send(msg.chat_id_, msg.id_, 1, "تم تغير الرد الى --> "..ac[1], 1, 'md')
end
--------------------------------
if (text and text == "مسح صلاحيه") then
send(msg.chat_id_, msg.id_, 1, '☑┇ارسال الان اسم الصلاحيه', 1, 'md')
database:set("tsahke:is_del_sl:"..bot_id..msg.chat_id_..msg.sender_user_id_,"ok")
return "Tshake"
end  
if (text and database:get("tsahke:is_del_sl:"..bot_id..msg.chat_id_..msg.sender_user_id_)) then 
send(msg.chat_id_, msg.id_, 1, '☑┇تم حذف صلاحيه بنجاح', 1, 'md')
database:del("tshake:all_sl:"..text..bot_id..msg.chat_id_)
database:srem('tshake:'..bot_id..'tshakenwe:slahea:'..msg.chat_id_,text)
database:del("tsahke:is_del_sl:"..bot_id..msg.chat_id_..msg.sender_user_id_)
end 
if (text and text == "اضف صلاحيه") then 
send(msg.chat_id_, msg.id_, 1, '☑┇ارسال الان اسم الصلاحيه', 1, 'md')
database:set("tshake:new:sl:"..bot_id..msg.chat_id_..msg.sender_user_id_,"ok1")
return "TSHAKE"
end
if text and database:get("tshake:new:sl:"..bot_id..msg.chat_id_..msg.sender_user_id_) then 
database:del("tshake:new:sl:"..bot_id..msg.chat_id_..msg.sender_user_id_)
send(msg.chat_id_, msg.id_, 1, '📥┇الان ارسل نوع الصلاحيه المطلوبه \n🔰┇{ `مدير` ،`ادمن` ،`عضو مميز` ,`لا شيئ `}', 1, 'md')
database:set("tshake:new:sl:text:"..bot_id..msg.chat_id_..msg.sender_user_id_,text)
database:set("tshake:new:sl2:"..bot_id..msg.chat_id_..msg.sender_user_id_,"ok1")
database:sadd('tshake:'..bot_id..'tshakenwe:slahea'..msg.chat_id_,text)
return "TSHAKE"
end
if (text and database:get("tshake:new:sl2:"..bot_id..msg.chat_id_..msg.sender_user_id_)) then 
if (text == "ادمن" or text == "مدير" or text == "عضو مميز" or text == "لا شيئ") then 
database:del("tshake:new:sl2:"..bot_id..msg.chat_id_..msg.sender_user_id_)
tsha_text = database:get("tshake:new:sl:text:"..bot_id..msg.chat_id_..msg.sender_user_id_)
send(msg.chat_id_, msg.id_, 1, '☑️┇تم حفض الصلاحيه بنجاح \n⚠️┇الاوامر { رفع/تنزيل '..tsha_text..' }', 1, 'md')
database:set("tshake:all_sl:"..tsha_text..bot_id..msg.chat_id_,text)
database:set("tshakenwe:slahea:bot"..tsha_text..bot_id..msg.chat_id_,text)
database:del("tshake:new:sl:text:"..bot_id..msg.chat_id_..msg.sender_user_id_)
else 
send(msg.chat_id_, msg.id_, 1, '📥┇الان ارسل نوع الصلاحيه المطلوبه \n🔰┇{ `مدير` ،`ادمن` ،`عضو مميز` ,`لا شيئ `}', 1, 'md')
end
end
if text =='مسح الصلاحيات' then 
local list = database:smembers('tshake:'..bot_id..'tshakenwe:slahea'..msg.chat_id_)
for k,v in pairs(list) do
local list = database:smembers('tshake:'..bot_id..'tshake:users:sl'..msg.chat_id_)
for k,ks in pairs(list) do
ts_text = database:get("tshake:all_sl:"..v..bot_id..msg.chat_id_)
if ts_text then 
database:del("tshake:name_user:"..bot_id..msg.chat_id_..ks)
end
end
database:del("tshake:all_sl:"..v..bot_id..msg.chat_id_)
database:del("tshakenwe:slahea:bot"..v..bot_id..msg.chat_id_)
end
database:del('tshake:'..bot_id..'tshakenwe:slahea'..msg.chat_id_)
send(msg.chat_id_, msg.id_, 1, '📮┇تم مسح الصلاحيات \n', 1, 'md')
end

if text == 'الصلاحيات' then
local list = database:smembers('tshake:'..bot_id..'tshakenwe:slahea'..msg.chat_id_)
if #list == 0 then
send(msg.chat_id_, msg.id_, 1,'🔖┇لا توجد صلاحيات مضافه', 'html')
return false
end
t = '📝┇قائمه الصلاحيات المضافه هنا\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n'
for k,v in pairs(list) do
var = database:get("tshakenwe:slahea:bot"..v..bot_id..msg.chat_id_)
if var then
t = t..''..k..'- '..v..' » ('..var..')\n'
else
t = t..''..k..'- '..v..'\n'
end
end
send(msg.chat_id_, msg.id_, 1,t, 'html')
end

if text == 'فحص البوت' then
local Chek_Info = https.request('https://api.telegram.org/bot'..token..'/getChatMember?chat_id='.. msg.chat_id_ ..'&user_id='.. bot_id..'')
local Json_Info = JSON.decode(Chek_Info)
if Json_Info.ok == true then
if Json_Info.result.status == "administrator" then
if Json_Info.result.can_change_info == true then
info = 'ꪜ' else info = '✘' end
if Json_Info.result.can_delete_messages == true then
delete = 'ꪜ' else delete = '✘' end
if Json_Info.result.can_invite_users == true then
invite = 'ꪜ' else invite = '✘' end
if Json_Info.result.can_pin_messages == true then
pin = 'ꪜ' else pin = '✘' end
if Json_Info.result.can_restrict_members == true then
restrict = 'ꪜ' else restrict = '✘' end
if Json_Info.result.can_promote_members == true then
promote = 'ꪜ' else promote = '✘' end 
SendText(msg.chat_id_,msg.id_,'\n📌┇ اهلا عزيزي البوت هنا ادمن'..'\n💢┇ وصلاحياته هي ↓ \nٴ━━━━━━━━━━'..'\n📝┇ تغير معلومات المجموعه ↞ ❴ '..info..' ❵'..'\n📨┇ حذف الرسائل ↞ ❴ '..delete..' ❵'..'\n🚷┇ حظر المستخدمين ↞ ❴ '..restrict..' ❵'..'\n♻┇ دعوة مستخدمين ↞ ❴ '..invite..' ❵'..'\n🔘┇ تثبيت الرسائل ↞ ❴ '..pin..' ❵'..'\n📛┇ اضافة مشرفين جدد ↞ ❴ '..promote..' ❵')   
end
end
end

if text and text:match('^رسائل المجوهرات (%d+)$') then
local kara = {string.match(text, "^(رسائل المجوهرات) (%d+)$")}
if tonumber(kara[2]) > 500 or tonumber(kara[2]) < 1 then
msgg = '📌┇لا تستطيع وضع اكثر من 500 رساله ❌ '
send(msg.chat_id_, msg.id_, 1, msgg, 1, 'html')
else
database:set('tshake:'..bot_id..'gamepoint' .. msg.chat_id_, kara[2] or 50)
send(msg.chat_id_, msg.id_, 1,'💎┇تم اضافه عدد الرسائل المطلوب ✅  ', 1, 'md')
end
end

if text == ("منح الحظر") and msg.reply_to_message_id_ ~= 0 then
function by_reply(extra, result, success)
tsX000("prore",msg,"☑┇تم منحه صلاحية الحظر")
database:sadd('tshake:'..bot_id..'SET:BAN'..msg.chat_id_, result.sender_user_id_)
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,by_reply)
end
if text and text:match("^منح الحظر @(.*)$") and is_creator(msg) then
local apmd = {string.match(text, "^(منح الحظر) @(.*)$")}
function promote_by_username(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
SendText(msg.chat_id_,msg.id_,"*📮┇ هاذا معرف قناة \n*")   
return false 
end      
database:sadd('tshake:'..bot_id..'SET:BAN'..msg.chat_id_, result.id_)
texts = '👤┇العضو ~⪼ ['..result.title_..'](t.me/'..(apmd[2] or 'TSHAKETEAM')..')\n☑┇تم منحه صلاحية الحظر'
else
texts = '✖┇خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(apmd[2],promote_by_username)
end

if text == ("الغاء منح الحظر") and msg.reply_to_message_id_ ~= 0 then
function by_reply(extra, result, success)
tsX000("prore",msg,"☑┇تم الغاء منحه صلاحية الحظر")
database:srem('tshake:'..bot_id..'SET:BAN'..msg.chat_id_, result.sender_user_id_)
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,by_reply)
end
if text and text:match("^الغاء منح الحظر @(.*)$") then
local apmd = {string.match(text, "^(الغاء منح الحظر) @(.*)$")}
function promote_by_username(extra, result, success)
if result.id_ then
database:srem('tshake:'..bot_id..'SET:BAN'..msg.chat_id_, result.id_)
texts = '👤┇العضو ~⪼ ['..result.title_..'](t.me/'..(apmd[2] or 'TSHAKETEAM')..')\n☑┇تم الغاء منحه صلاحية الحظر'
else
texts = '✖┇خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(apmd[2],promote_by_username)
end

if text == 'مسح صلاحية الحظر' then
database:del('tshake:'..bot_id..'SET:BAN'..msg.chat_id_)
send(msg.chat_id_, msg.id_, 1, '☑┇تم مسح قائمه صلاحيات الحظر', 1, 'md')
end
if text == ("قائمه صلاحيه الحظر") then
local hash =  'tshake:'..bot_id..'SET:BAN'..msg.chat_id_
local list = database:smembers(hash)
text = "👥┇قائمة صلايحه الحظر ،\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
for k,v in pairs(list) do
local user_info = database:hgetall('tshake:'..bot_id..'user:'..v)
if user_info and user_info.username then
local username = user_info.username
text = text.."<b>|"..k.."|</b>~⪼(@"..username..")\n"
else
text = text.."<b>|"..k.."|</b>~⪼(<code>"..v.."</code>)\n"
end
if #text > 7000 then
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
text = ""
end
end
if #list == 0 then
text = "✖┇لايوجد اشخاص لديهم صلاحيه الحظر"
end
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end
if text and text:match("اضف امر (.*)") then 
local tshake_edis = {string.match(text, "^اضف امر (.*)$")}
send(msg.chat_id_, msg.id_, 1, "☑┇ ارسال الان الامر الجديد", 1, 'md')
database:set("tsahke:new:msg:amr:"..msg.chat_id_..msg.sender_user_id_..bot_id,tshake_edis[1])
database:sadd('tshake:'..bot_id..'tshakenwe:'..msg.chat_id_,tshake_edis[1])
elseif (database:get("tsahke:new:msg:amr:"..msg.chat_id_..msg.sender_user_id_..bot_id)) then 
send(msg.chat_id_, msg.id_, 1, "☑┇ تم الحفظ بنجاح", 1, 'md')
database:set("tshake:edit:text:su:newamr:"..bot_id..msg.chat_id_..database:get("tsahke:new:msg:amr:"..msg.chat_id_..msg.sender_user_id_..bot_id),text)
database:set("tshake:edit:text:su:newamr2:"..bot_id..msg.chat_id_..text,database:get("tsahke:new:msg:amr:"..msg.chat_id_..msg.sender_user_id_..bot_id))
database:del("tsahke:new:msg:amr:"..msg.chat_id_..msg.sender_user_id_..bot_id)
end  
if text and text:match("^مسح امر (.*)") then 
local t = {string.match(text, "^مسح امر (.*)$")}
local klma = database:get("tshake:edit:text:su:newamr:"..bot_id..msg.chat_id_..t[1])
if klma ~= nil then
database:del("tshake:edit:text:su:newamr2:"..bot_id..msg.chat_id_..klma)
database:del("tshake:edit:text:su:newamr:"..bot_id..msg.chat_id_..t[1])
database:srem('tshake:'..bot_id..'tshakenwe:'..msg.chat_id_,klma)
send(msg.chat_id_, msg.id_, 1, "☑┇ تم المسح بنجاح", 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, "☑┇ عذرآ لا يوجد امر بهاذا الاسم", 1, 'md')
end
end
if text == 'الاوامر الاضافيه' then
local list = database:smembers('tshake:'..bot_id..'tshakenwe:'..msg.chat_id_)
if #list == 0 then
send(msg.chat_id_, msg.id_, 1,'🔖┇لا توجد اوامر مضافه', 'html')
return false
end
t = '📝┇قائمه الاوامر المضافه هنا\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n'
for k,v in pairs(list) do
var = database:get("tshake:edit:text:su:newamr:"..bot_id..msg.chat_id_..v)
if var then
t = t..''..k..'- '..v..' » ('..var..')\n'
else
t = t..''..k..'- '..v..'\n'
end
end
send(msg.chat_id_, msg.id_, 1,t, 'html')
end

if text == 'مسح الاوامر المضافه' then 
local list = database:smembers('tshake:'..bot_id..'tshakenwe:'..msg.chat_id_)
for k,v in pairs(list) do
local klma = database:get("tshake:edit:text:su:newamr:"..bot_id..msg.chat_id_..v)
if klma ~= nil then
database:del("tshake:edit:text:su:newamr2:"..bot_id..msg.chat_id_..klma)
database:del("tshake:edit:text:su:newamr:"..bot_id..msg.chat_id_..v)
end
end
database:del('tshake:'..bot_id..'tshakenwe:'..msg.chat_id_)
send(msg.chat_id_, msg.id_, 1,"📛┇تم مسح الاوامر جميعها", 'md')
end


end -- if is_creator(msg) then
------------------------------------------------------------------------
if is_devabas(msg) or is_sudo(msg) or is_creatorbasic(msg) or is_creatorbasicc(msg.chat_id_,msg.sender_user_id_) or is_creatorr(msg.chat_id_,msg.sender_user_id_) or is_creator(msg) or is_owner(msg) or is_ownerr(msg.chat_id_,msg.sender_user_id_) and ChekAdd(msg.chat_id_) == true then 
if text == ("تثبيت") then
local id = msg.id_
local msgs = {[0] = id}
pin(msg.chat_id_,msg.reply_to_message_id_,0)
database:set('tshake:'..bot_id..'pinnedmsg'..msg.chat_id_,msg.reply_to_message_id_)
send(msg.chat_id_, msg.id_, 1, '📌┇ تم تثبيت الرسالة  ',1, 'md')
return false
end
if text == ("الغاء تثبيت") or text == ("الغاء التثبيت") then
unpinmsg(msg.chat_id_)
send(msg.chat_id_, msg.id_, 1, '❌┇تم الغاء تثبيت الرساله', 1, 'md')
return false
end
if text == ("رفع ادمن") and msg.reply_to_message_id_ then
local url , res = http.request('http://tshake.ml/joinch/?id='..msg.sender_user_id_..'')
data = JSON.decode(url)
if data.Ch_Member.TshAkE ~= true then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🔱 •\n• لايمكنك استخدام البوت ✅ •\n• عليك الاشتراك في القناة 🔽 •\n• @zx_xx ⚜️\n', 1, 'html')   
return false end
if not is_creator(msg) and database:get('tshake:'..bot_id.."Tshake:lock:set"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_, 1, '✖┇لا تستطيع الرفع تم تعطيل الرفع من قبل المنشئين \n', 1, 'md')
return false
end
function promote_by_reply(extra, result, success)
local hash =  'tshake:'..bot_id..'mods:'..msg.chat_id_
if database:sismember(hash, result.sender_user_id_) then
tsX000("prore",msg,'🔖┇بالفعل تم رفعة ادمن   في البوت ')
else
database:sadd(hash, result.sender_user_id_)
tsX000("prore",msg,'🔖┇تم رفعة ادمن   في البوت ')
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,promote_by_reply)
return false
end
if text and text:match("^رفع ادمن @(.*)$") then
local url , res = http.request('http://tshake.ml/joinch/?id='..msg.sender_user_id_..'')
data = JSON.decode(url)
if data.Ch_Member.TshAkE ~= true then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🔱 •\n• لايمكنك استخدام البوت ✅ •\n• عليك الاشتراك في القناة 🔽 •\n• @zx_xx ⚜️\n', 1, 'html')   
return false end
if not is_creator(msg) and database:get('tshake:'..bot_id.."Tshake:lock:set"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_, 1, '✖┇لا تستطيع الرفع تم تعطيل الرفع من قبل المنشئين \n', 1, 'md')
return false
end
local apmd = {string.match(text, "^(رفع ادمن) @(.*)$")}
function promote_by_username(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
SendText(msg.chat_id_,msg.id_,"*📮┇ هاذا معرف قناة \n*")   
return false 
end      
database:sadd('tshake:'..bot_id..'mods:'..msg.chat_id_, result.id_)
texts = '👤┇العضو ~⪼ ['..result.title_..'](t.me/'..(apmd[2] or 'TSHAKETEAM')..')\n🔖┇تم رفعة ادمن   في البوت'
else
texts = '✖┇خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(apmd[2],promote_by_username)
return false
end
if text and text:match("^رفع ادمن (%d+)$") then
local url , res = http.request('http://tshake.ml/joinch/?id='..msg.sender_user_id_..'')
data = JSON.decode(url)
if data.Ch_Member.TshAkE ~= true then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🔱 •\n• لايمكنك استخدام البوت ✅ •\n• عليك الاشتراك في القناة 🔽 •\n• @zx_xx ⚜️\n', 1, 'html')   
return false end
if not is_creator(msg) and database:get('tshake:'..bot_id.."Tshake:lock:set"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_, 1, '✖┇لا تستطيع الرفع تم تعطيل الرفع من قبل المنشئين \n', 1, 'md')
return false end
local apmd = {string.match(text, "^(رفع ادمن) (%d+)$")}
local url , res = http.request('http://tshake.ml/joinch/?id='..msg.sender_user_id_..'')
data = JSON.decode(url)
if data.Ch_Member.TshAkE ~= true then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🔱 •\n• لايمكنك استخدام البوت ✅ •\n• عليك الاشتراك في القناة 🔽 •\n• @zx_xx ⚜️\n', 1, 'html')   
return false end
database:sadd('tshake:'..bot_id..'mods:'..msg.chat_id_, apmd[2])
tsX000(apmd[2],msg,"🔖┇تم رفعة ادمن   في البوت")
return false
end
if text == ("تنزيل ادمن") and msg.reply_to_message_id_ then
function demote_by_reply(extra, result, success)
local hash =  'tshake:'..bot_id..'mods:'..msg.chat_id_
if not database:sismember(hash, result.sender_user_id_) then
tsX000("prore",msg,"🔰┇بالفعل تم تنزيله من ادمنيه البوت")
else
database:srem(hash, result.sender_user_id_)
tsX000("prore",msg,"🔰┇تم تنزيله من ادمنيه البوت")
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,demote_by_reply)
return false
end
if text and text:match("^تنزيل ادمن @(.*)$") then
local hash =  'tshake:'..bot_id..'mods:'..msg.chat_id_
local apmd = {string.match(text, "^(تنزيل ادمن) @(.*)$")}
function demote_by_username(extra, result, success)
if result.id_ then
database:srem(hash, result.id_)
texts = '👤┇العضو ~⪼ ['..result.title_..'](t.me/'..(apmd[2] or 'TSHAKETEAM')..')\n🔰┇تم تنزيله من ادمنيه البوت'
else
texts = '✖┇خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(apmd[2],demote_by_username)
return false
end
if text and text:match("^تنزيل ادمن (%d+)$") then
local hash =  'tshake:'..bot_id..'mods:'..msg.chat_id_
local apmd = {string.match(text, "^(تنزيل ادمن) (%d+)$")}
database:srem(hash, apmd[2])
tsX000(apmd[2],msg,"🔰┇تم تنزيله من ادمنيه البوت")
return false
end
if text == 'مسح الادمنيه' then
database:del('tshake:'..bot_id..'mods:'..msg.chat_id_)
send(msg.chat_id_, msg.id_, 1, '🗑┇ تم مسح  قائمة الادمنية  ', 1, 'md')
end
if text and text == "تعين الايدي" then
send(msg.chat_id_, msg.id_, 1,  '☑┇ ارسل الان النص\n☑┇ يمكنك اضافه :\n- `#username` > اسم المستخدم\n- `#msgs` > عدد رسائل المستخدم\n- `#photos` > عدد صور المستخدم\n- `#id` > ايدي المستخدم\n- `#auto` > تفاعل المستخدم\n- `#stast` > موقع المستخدم \n- `#edit` > عدد السحكات\n- `#game` > المجوهرات', 1, 'md')
database:set("tsahke:set:id:"..bot_id..msg.chat_id_..msg.sender_user_id_,'tshake')
return "tshake"
end

if text and text == "مسح الايدي" then
send(msg.chat_id_, msg.id_, 1,  '✖┇ تم المسح بنجاح', 1, 'md')
database:del("tshake:gr:id:text:"..bot_id..msg.chat_id_)
end

if text == ("الادمنيه") then
local url , res = http.request('http://tshake.ml/joinch/?id='..msg.sender_user_id_..'')
data = JSON.decode(url)
if data.Ch_Member.TshAkE ~= true then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🔱 •\n• لايمكنك استخدام البوت ✅ •\n• عليك الاشتراك في القناة 🔽 •\n• @zx_xx ⚜️\n', 1, 'html')   
return false end
local hash =   'tshake:'..bot_id..'mods:'..msg.chat_id_
local list = database:smembers(hash)
text = "👥┇قائمة الادمنيه ،\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
for k,v in pairs(list) do
local user_info = database:hgetall('tshake:'..bot_id..'user:'..v)
if user_info and user_info.username then
local username = user_info.username
text = text.."<b>|"..k.."|</b>~⪼(@"..username..")\n"
else
text = text.."<b>|"..k.."|</b>~⪼(<code>"..v.."</code>)\n"
end
if #text > 7000 then
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
text = ""
end
end
if #list == 0 then
text = "❗️┇ لا يوجد ادمنية  "
end
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end

if text and text:match("^وضع تكرار (%d+)$") then
local floodmax = {string.match(text, "^(وضع تكرار) (%d+)$")}
if tonumber(floodmax[2]) < 2 then
send(msg.chat_id_, msg.id_, 1, '🔘┇ضع التكرار من *{2}* الى  *{99999}*', 1, 'md')
else
database:set('tshake:'..bot_id..'flood:max:'..msg.chat_id_,floodmax[2])
send(msg.chat_id_, msg.id_, 1, '☑┇تم  وضع التكرار بالطرد للعدد ~⪼  *{'..floodmax[2]..'}*', 1, 'md')
end
end

if text and text:match("^وضع زمن التكرار (%d+)$") then
local floodt = {string.match(text, "^(وضع زمن التكرار) (%d+)$")}
if tonumber(floodt[2]) < 1 then
send(msg.chat_id_, msg.id_, 1, '🔘┇ضع العدد من *{1}* الى  *{99999}*', 1, 'md')
else
database:set('tshake:'..bot_id..'flood:time:'..msg.chat_id_,floodt[2])
send(msg.chat_id_, msg.id_, 1, '☑┇تم  وضع الزمن التكرار للعدد ~⪼  *{'..floodt[2]..'}*', 1, 'md')
end
end

if text and text == "تاك للكل" then
function tag_all(t1, t2)
local text = "👨‍👧‍👦 ┇ قائمه الاعضاء   ،\nꔹ┉♦️┉ ┉ ┉ ┉♦️┉ꔹ \n"
i = 0
for k, v in pairs(t2.members_) do
i = i + 1
local user_info = database:hgetall('tshake:'..bot_id..'user:'..v.user_id_)
if user_info and user_info.username then
local username = user_info.username
text = text.."<b>|"..i.."|</b>~⪼(@"..username..")\n"
end
end
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
print(text)
end
tdcli_function({ID = "GetChannelMembers",channel_id_ = getChatId(msg.chat_id_).ID, offset_ = 0,limit_ = 200000},tag_all,nil)
end
if text == ("ادمنيه المجموعه") then
local txt = {string.match(text, "^ادمنيه المجموعه$")}
local function cb(extra,result,success)
local list = result.members_
text = '📊┇ادمنيه الكروب\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n'
local n = 0
for k,v in pairs(list) do
n = (n + 1)
local user_info = database:hgetall('tshake:'..bot_id..'user:'..v.user_id_)
if user_info and user_info.username then
local username = user_info.username
text = text.."<b>|"..n.."|</b>~⪼(@"..username..")\n"
else
text = text.."<b>|"..n.."|</b>~⪼(<code>"..v.user_id_.."</code>)\n"
end
if #text > 7000 then
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
text = ""
end
end
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end
bot.channel_get_admins(msg.chat_id_,cb)
end
if text == ("رفع الادمنيه") then
local url , res = http.request('http://tshake.ml/joinch/?id='..msg.sender_user_id_..'')
data = JSON.decode(url)
if data.Ch_Member.TshAkE ~= true then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🔱 •\n• لايمكنك استخدام البوت ✅ •\n• عليك الاشتراك في القناة 🔽 •\n• @zx_xx ⚜️\n', 1, 'html')   
return false end
local function cb(extra,result,success)
local list = result.members_
moody = '📊┇ تم رفع ادمنيه المجموعه في البوت\n'
local n = 0
for k,v in pairs(list) do
n = (n + 1)
local hash =  'tshake:'..bot_id..'mods:'..msg.chat_id_
database:sadd(hash, v.user_id_)
end
send(msg.chat_id_, msg.id_, 1, moody, 1, 'html')
end
bot.channel_get_admins(msg.chat_id_,cb)
end
if (text and text == 'تفعيل اطردني') then
if not database:get('tshake:'..bot_id..'kickme:mute'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '✔️┇ امر اطردني بالفعل تم تفعيلة ', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '✔️┇ امر اطردني تم تفعيلة ', 1, 'md')
database:del('tshake:'..bot_id..'kickme:mute'..msg.chat_id_)
end
end
if (text and text == 'تعطيل اطردني') then
if database:get('tshake:'..bot_id..'kickme:mute'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '🔌┇ تم تعطيل امر اطردني بالفعل ', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '🔌┇ تم تعطيل امر اطردني ', 1, 'md')
database:set('tshake:'..bot_id..'kickme:mute'..msg.chat_id_,true)
end
end
if text and text:match("^رفع (.*)$")  and msg.reply_to_message_id_ then
a = {string.match(text, "^رفع (.*)$")}
ts_text = database:get("tshake:all_sl:"..a[1]..bot_id..msg.chat_id_)
if ts_text then 
function promote_by_reply(extra, result, success)
if ts_text == "ادمن" then 
database:sadd('tshake:'..bot_id..'mods:'..msg.chat_id_, result.sender_user_id_)
elseif ts_text == "عضو مميز" then 
database:sadd('tshake:'..bot_id..'vipgp:'..msg.chat_id_, result.sender_user_id_)
elseif ts_text == "مدير" then 
database:sadd('tshake:'..bot_id..'owners:'..msg.chat_id_, result.sender_user_id_)
end
database:set("tshake:name_user:"..bot_id..msg.chat_id_..result.sender_user_id_,a[1])
database:sadd('tshake:'..bot_id..'tshake:users:sl'..msg.chat_id_,result.sender_user_id_)
function keko33332(extra,result2,success)
info = '👤┇العضو ~⪼ ['..result2.first_name_..'](t.me/'..(result2.username_ or 'TSHAKETEAM')..')\n☑┇تم رفعه '..a[1]
send(msg.chat_id_, msg.id_, 1,info, 1, 'md')
end
getUser(result.sender_user_id_, keko33332)  
end 
getMessage(msg.chat_id_, msg.reply_to_message_id_,promote_by_reply)
end 
end

if text and text:match("^رفع (.*) @(.*)$") then
local apmd = {string.match(text, "^رفع (.*) @(.*)$")}
ts_text = database:get("tshake:all_sl:"..apmd[1]..bot_id..msg.chat_id_)
if ts_text then 
function promote_by_username(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
SendText(msg.chat_id_,msg.id_,"*📮┇ هاذا معرف قناة \n*")   
return false 
end      
if ts_text == "ادمن" then 
database:sadd('tshake:'..bot_id..'mods:'..msg.chat_id_, result.id_)
elseif ts_text == "عضو مميز" then 
database:sadd('tshake:'..bot_id..'vipgp:'..msg.chat_id_, result.id_)
elseif ts_text == "مدير" then 
database:sadd('tshake:'..bot_id..'owners:'..msg.chat_id_, result.id_)
end
database:set("tshake:name_user:"..bot_id..msg.chat_id_..result.id_,apmd[1])
database:sadd('tshake:'..bot_id..'tshake:users:sl'..msg.chat_id_,result.id_)
texts = '👤┇العضو ~⪼ ['..result.title_..'](t.me/'..(apmd[2] or 'TSHAKETEAM')..')\n☑┇تم رفعه '..apmd[1]
else
texts = '✖┇خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(apmd[2],promote_by_username)
end
end
if text and text:match("^رفع (.*) (%d+)$") then
local apmd = {string.match(text, "^رفع (.*) (%d+)$")}
ts_text = database:get("tshake:all_sl:"..apmd[1]..bot_id..msg.chat_id_)
if ts_text then 
if ts_text == "ادمن" then 
database:sadd('tshake:'..bot_id..'mods:'..msg.chat_id_, apmd[2])
elseif ts_text == "عضو مميز" then 
database:sadd('tshake:'..bot_id..'vipgp:'..msg.chat_id_, apmd[2])
elseif ts_text == "مدير" then 
database:sadd('tshake:'..bot_id..'owners:'..msg.chat_id_, apmd[2])
end
database:set("tshake:name_user:"..bot_id..msg.chat_id_..apmd[2],apmd[1])
database:sadd('tshake:'..bot_id..'tshake:users:sl'..msg.chat_id_,apmd[2])
tsX000(apmd[2],msg,"☑┇تم رفعه "..apmd[1])
end
end
if text and text:match("^تنزيل (.*)$") and msg.reply_to_message_id_ then
a = {string.match(text, "^تنزيل (.*)$")}
ts_text = database:get("tshake:all_sl:"..a[1]..bot_id..msg.chat_id_)
if ts_text then 
function demote_by_reply(extra, result, success)
if ts_text == "ادمن" then 
database:srem('tshake:'..bot_id..'mods:'..msg.chat_id_, result.sender_user_id_)
elseif ts_text == "عضو مميز" then 
database:srem('tshake:'..bot_id..'vipgp:'..msg.chat_id_, result.sender_user_id_)
elseif ts_text == "مدير" then 
database:srem('tshake:'..bot_id..'owners:'..msg.chat_id_, result.sender_user_id_)
end
database:del("tshake:name_user:"..bot_id..msg.chat_id_..result.sender_user_id_)
database:srem('tshake:'..bot_id..'tshake:users:sl'..msg.chat_id_,result.sender_user_id_)
tsX000("prore",msg,"🔰┇تم تنزيله من "..a[1])
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,demote_by_reply)
end
end
if text and text:match("^تنزيل (.*) @(.*)$") then
local apmd = {string.match(text, "^تنزيل (.*) @(.*)$")}
ts_text = database:get("tshake:all_sl:"..apmd[1]..bot_id..msg.chat_id_)
if ts_text then 
function demote_by_username(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
SendText(msg.chat_id_,msg.id_,"*📮┇ هاذا معرف قناة \n*")   
return false 
end      
if ts_text == "ادمن" then 
database:srem('tshake:'..bot_id..'mods:'..msg.chat_id_, result.id_)
elseif ts_text == "عضو مميز" then 
database:srem('tshake:'..bot_id..'vipgp:'..msg.chat_id_, result.id_)
elseif ts_text == "مدير" then 
database:srem('tshake:'..bot_id..'owners:'..msg.chat_id_, result.id_)
end
texts = '👤┇العضو ~⪼ ['..result.title_..'](t.me/'..(apmd[2] or 'TSHAKETEAM')..')\n🔰┇تم تنزيله من '..apmd[1]
database:srem('tshake:'..bot_id..'tshake:users:sl'..msg.chat_id_,result.id_)
database:del("tshake:name_user:"..bot_id..msg.chat_id_..result.id_)
else
texts = '✖┇خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(apmd[2],demote_by_username)
end
end
if text and text:match("^تنزيل (.*) (%d+)$") then
local apmd = {string.match(text, "^تنزيل (.*) (%d+)$")}
ts_text = database:get("tshake:all_sl:"..apmd[1]..bot_id..msg.chat_id_)
if ts_text then 
if ts_text == "ادمن" then 
database:srem('tshake:'..bot_id..'mods:'..msg.chat_id_, apmd[2])
elseif ts_text == "عضو مميز" then 
database:srem('tshake:'..bot_id..'vipgp:'..msg.chat_id_, apmd[2])
elseif ts_text == "مدير" then 
database:srem('tshake:'..bot_id..'owners:'..msg.chat_id_, apmd[2])
end
tsX000(apmd[2],msg,"🔰┇تم تنزيله من "..apmd[1])
database:del("tshake:name_user:"..bot_id..msg.chat_id_..apmd[2])
database:srem('tshake:'..bot_id..'tshake:users:sl'..msg.chat_id_,apmd[2])
end
end

if (text and text == 'تفعيل الايدي بالصوره') then
if not database:get('tshake:'..bot_id..'id:photo'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '📸 ┇ بلفعل  الايدي بالصوره مفعل ', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '📸 ┇ تم تفعيل الايدي بالصوره ', 1, 'md')
database:del('tshake:'..bot_id..'id:photo'..msg.chat_id_)
end
end
if (text and text == 'تعطيل الايدي بالصوره') then
if database:get('tshake:'..bot_id..'id:photo'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '📸 ┇ بلفعل الايدي بالصوره معطل', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '📸 ┇ تم تعطيل  الايدي بالصوره ', 1, 'md')
database:set('tshake:'..bot_id..'id:photo'..msg.chat_id_,true)
end
end

if (text and text == 'تفعيل ردود المطور') then
if not database:get('tshake:'..bot_id..'repsudo:mute'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '✔️┇ردود المطور بالفعل تم تفعيلها', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '✔️┇تم تفعيل ردود المطور', 1, 'md')
database:del('tshake:'..bot_id..'repsudo:mute'..msg.chat_id_)
end
end
if  (text and text == 'تعطيل ردود المطور') then
if database:get('tshake:'..bot_id..'repsudo:mute'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '🔌┇ردود المطور بالفعل تم تعطيلها', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '🔌┇تم تعطيل ردود المطور', 1, 'md')
database:set('tshake:'..bot_id..'repsudo:mute'..msg.chat_id_,true)
end
end
if (text and text == 'تفعيل ردود المدير') then
if not database:get('tshake:'..bot_id..'repowner:mute'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '✔️┇ردود المدير بالفعل تم تفعيلها', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '✔️┇تم تفعيل ردود المدير', 1, 'md')
database:del('tshake:'..bot_id..'repowner:mute'..msg.chat_id_)
end
end
if (text and text == 'تعطيل ردود المدير') then
if database:get('tshake:'..bot_id..'repowner:mute'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '🔌┇ردود المدير بالفعل تم تعطيلها', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '🔌┇تم تعطيل ردود المدير', 1, 'md')
database:set('tshake:'..bot_id..'repowner:mute'..msg.chat_id_,true)
end
end

if (text and text == 'تفعيل الايدي') then
if not database:get('tshake:'..bot_id..'id:mute'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '✔️┇ الايدي بالفعل تم تفعيله ', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '✔️┇ الايدي  تم تفعيله ', 1, 'md')
database:del('tshake:'..bot_id..'id:mute'..msg.chat_id_)
end
end
if (text and text == 'تعطيل الايدي') then
if database:get('tshake:'..bot_id..'id:mute'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '🔌┇ تم تعطيل الايدي بالفعل  ', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '🔌┇ تم تعطيل الايدي  ', 1, 'md')
database:set('tshake:'..bot_id..'id:mute'..msg.chat_id_,true)
end
end
if (text and text == "تعطيل الرابط") then 
send(msg.chat_id_, msg.id_, 1, '🔌┇تم تعطيل امر الروابط', 1, 'md')
database:set("tshake:mute:link:gr:"..bot_id..msg.chat_id_,"ok")
end
if (text and text == "تفعيل الرابط") then 
send(msg.chat_id_, msg.id_, 1, '✔️┇تم تفعيل امر الروابط', 1, 'md')
database:del("tshake:mute:link:gr:"..bot_id..msg.chat_id_)
end
if (text and text == "تعطيل اوامر التحشيش") then 
send(msg.chat_id_, msg.id_, 1, '🔌┇تم تعطيل اوامر التحشيش', 1, 'md')
database:set("Fun_Bots:"..bot_id..msg.chat_id_,"true")
end
if (text and text == "تفعيل اوامر التحشيش") then 
send(msg.chat_id_, msg.id_, 1, '✔️┇تم تفعيل اوامر التحشيش', 1, 'md')
database:del("Fun_Bots:"..bot_id..msg.chat_id_)
end

if (text and text == 'تفعيل التثبيت') then
if not database:get('tshake:'..bot_id..'pin:mute'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '✔️┇التثبيت بالفعل تم تفعيله', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '✔️┇تم تفعيل التثبيت', 1, 'md')
database:del('tshake:'..bot_id..'pin:mute'..msg.chat_id_)
end
end
if (text and text == 'تعطيل التثبيت') then
if database:get('tshake:'..bot_id..'pin:mute'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '🔌┇التثبيت بالفعل تم تعطيله', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '🔌┇تم تعطيل التثبيت', 1, 'md')
database:set('tshake:'..bot_id..'pin:mute'..msg.chat_id_,true)
end
end
if text == ("تثبيت") and not is_owner(msg) then
local id = msg.id_
local msgs = {[0] = id}
if not database:get('tshake:'..bot_id..'pin:mute'..msg.chat_id_) then
pin(msg.chat_id_,msg.reply_to_message_id_,0)
database:set('tshake:'..bot_id..'pinnedmsg'..msg.chat_id_,msg.reply_to_message_id_)
send(msg.chat_id_, msg.id_, 1, '📌┇ تم تثبيت الرسالة  ',1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '❌┇التثبيت معطل',1, 'md')
end
end
if text == ("الغاء تثبيت") and not is_owner(msg) or text == ("الغاء التثبيت") and not is_owner(msg) then
if not database:get('tshake:'..bot_id..'pin:mute'..msg.chat_id_) then
unpinmsg(msg.chat_id_)
send(msg.chat_id_, msg.id_, 1, '❌┇تم الغاء تثبيت الرساله', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '❌┇الغاء التثبيت معطل', 1, 'md')
end
end


if text == 'منع' and tonumber(msg.reply_to_message_id_) > 0 then 
function cb(a,b,c) 
textt = '📮┇ تم منع '
if b.content_.sticker_ then
local idsticker = b.content_.sticker_.set_id_
database:sadd('tshake:'..bot_id.."filtersteckr"..msg.chat_id_,idsticker)
text = 'الملصق'
sendtext(msg.chat_id_, msg.id_,textt..'( '..text..' ) بنجاح لن يتم ارسالها مجددا')  
return false
end
if b.content_.ID == "MessagePhoto" then
local photo = b.content_.photo_.id_
database:sadd('tshake:'..bot_id.."filterphoto"..msg.chat_id_,photo)
text = 'الصوره'
sendtext(msg.chat_id_, msg.id_,textt..'( '..text..' ) بنجاح لن يتم ارسالها مجددا')  
return false
end
if b.content_.animation_.animation_ then
local idanimation = b.content_.animation_.animation_.persistent_id_
database:sadd('tshake:'..bot_id.."filteranimation"..msg.chat_id_,idanimation)
text = 'المتحركه'
sendtext(msg.chat_id_, msg.id_,textt..'( '..text..' ) بنجاح لن يتم ارسالها مجددا')  
return false
end
end
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),cb) 
end
if text == 'الغاء منع' and tonumber(msg.reply_to_message_id_) > 0 then 
function cb(a,b,c) 
textt = '📮┇ تم الغاء منع '
if b.content_.sticker_ then
local idsticker = b.content_.sticker_.set_id_
database:srem('tshake:'..bot_id.."filtersteckr"..msg.chat_id_,idsticker)
text = 'الملصق'
sendtext(msg.chat_id_, msg.id_,textt..'( '..text..' ) بنجاح يمكنهم الارسال الان')  
return false
end
if b.content_.ID == "MessagePhoto" then
local photo = b.content_.photo_.id_
database:srem('tshake:'..bot_id.."filterphoto"..msg.chat_id_,photo)
text = 'الصوره'
sendtext(msg.chat_id_, msg.id_,textt..'( '..text..' ) بنجاح يمكنهم الارسال الان')  
return false
end
if b.content_.animation_.animation_ then
local idanimation = b.content_.animation_.animation_.persistent_id_
database:srem('tshake:'..bot_id.."filteranimation"..msg.chat_id_,idanimation)
text = 'المتحركه'
sendtext(msg.chat_id_, msg.id_,textt..'( '..text..' ) بنجاح يمكنهم الارسال الان')  
return false
end
end
getMessage(msg.chat_id_, tonumber(msg.reply_to_message_id_),cb) 
end
if text == 'مسح قائمه منع المتحركات' then 
database:del('tshake:'..bot_id.."filteranimation"..msg.chat_id_)
sendtext(msg.chat_id_, msg.id_,'🔖┇ تم مسح قائمه منع المتحركات')  
end
if text == 'مسح قائمه منع الصور' then 
database:del('tshake:'..bot_id.."filterphoto"..msg.chat_id_)
sendtext(msg.chat_id_, msg.id_,'🔖┇ تم مسح قائمه منع الصور')  
end
if text == 'مسح قائمه منع الملصقات' then 
database:del('tshake:'..bot_id.."filtersteckr"..msg.chat_id_)
sendtext(msg.chat_id_, msg.id_,'🔖┇ تم مسح قائمه منع الملصقات')  
end

if text == 'تفعيل اللعبه' then   
send(msg.chat_id_, msg.id_, 1,[[*
🎮| تم تفعيل الالعاب بنجاح  
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
📋| الالعاب المتاحه لديك هي ↓
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
🚸| ارسل امر (الاسرع) لبدء لعبه
🚸| ارسل امر (سمايلات) لبدء لعبه
🚸| ارسل امر (حزوره) لبدء لعبه
🚸| ارسل امر (المعاني) لبدء لعبه
🚸| ارسل امر (العكس) لبدء لعبه
🚸| ارسل امر (بات) لبدء لعبه
🚸| ارسل امر (خمن) لبدء لعبه
🚸| ارسل امر (امثله) لبدء لعبه
🚸| ارسل امر (المختلف) لبدء لعبه
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
Ch  ☰ *[@zx_xx] 🃏
]], 1, 'md')
database:set('tshake:'..bot_id..'lock_geam'..msg.chat_id_,true)  
end
if text == 'الالعاب' then   
send(msg.chat_id_, msg.id_, 1,[[*
🎮| اهلا بك في الالعاب  
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
📋| الالعاب المتاحه لديك هي ↓
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
🚸| ارسل امر (الاسرع) لبدء لعبه
🚸| ارسل امر (سمايلات) لبدء لعبه
🚸| ارسل امر (حزوره) لبدء لعبه
🚸| ارسل امر (المعاني) لبدء لعبه
🚸| ارسل امر (العكس) لبدء لعبه
🚸| ارسل امر (بات) لبدء لعبه
🚸| ارسل امر (خمن) لبدء لعبه
🚸| ارسل امر (امثله) لبدء لعبه
🚸| ارسل امر (المختلف) لبدء لعبه
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
Ch  ☰ *[@zx_xx] 🃏
]], 1, 'md')
end

if text == 'تعطيل اللعبه' then  
taha = '🎮┇ تم تعطيل اللعبه  ' 
send(msg.chat_id_, msg.id_, 1,taha, 1, 'md')
database:del('tshake:'..bot_id..'lock_geam'..msg.chat_id_) 
end

end -- if is_owner(msg) then
------------------------------------------------------------------------
if is_devabas(msg) or is_sudo(msg) or is_creatorbasic(msg) or is_creatorbasicc(msg.chat_id_,msg.sender_user_id_) or is_creator(msg) or is_owner(msg) or is_mod(msg) then
if (text == "قفل التاك") then
local tsX_o = database:get("lock_tag:tshake"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"🔐┇ بالفعل تم قفل التاك ")
else
tsX000("lock",msg,"🔐┇ تم قفل التاك ")
database:set("lock_tag:tshake"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل الرد") then
local tsX_o = database:get("lock_reple:tshake"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"🔐┇ بالفعل تم قفل الرد على الرسائل ")
else
tsX000("lock",msg,"🔐┇ تم قفل الرد على الرسائل ")
database:set("lock_reple:tshake"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل الشارحه") then
local tsX_o = database:get("lock_sarha:tshake"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"🔐┇ بالفعل تم قفل الشارحه ")
else
tsX000("lock",msg,"🔐┇ تم قفل الشارحه ")
database:set("lock_sarha:tshake"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل الكلايش") then
local tsX_o = database:get("lock_word:tshake"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"🔐┇ بالفعل تم قفل الكلايش ")
else
tsX000("lock",msg,"🔐┇ تم قفل الكلايش ")
database:set("lock_word:tshake"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل التكرار") then
local tsX_o = database:get("lock_lllll:tshake"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"🔐┇ بالفعل تم قفل التكرار ")
else
tsX000("lock",msg,"🔐┇ تم قفل التكرار ")
database:set("lock_lllll:tshake"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل المتحركه") then
local tsX_o = database:get("lock_gif:tshake"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"🔐┇ بالفعل تم قفل المتحركه ")
else
tsX000("lock",msg,"🔐┇ تم قفل المتحركه ")
database:set("lock_gif:tshake"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل الملفات") then
local tsX_o = database:get("lock_files:tshake"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"🔐┇ بالفعل تم قفل الملفات ")
else
tsX000("lock",msg,"🔐┇ تم قفل الملفات ")
database:set("lock_files:tshake"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل الماركدون") then
local tsX_o = database:get("lock_mark:tshake"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"🔐┇ بالفعل تم قفل الماركدون ")
else
tsX000("lock",msg,"🔐┇ تم قفل الماركدون ")
database:set("lock_mark:tshake"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل الصور") then
local tsX_o = database:get("lock_photo:tshake"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"🔐┇ بالفعل تم قفل الصور ")
else
tsX000("lock",msg,"🔐┇ تم قفل الصور ")
database:set("lock_photo:tshake"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل الملصقات") then
local tsX_o = database:get("lock_stecker:tshake"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"🔐┇ بالفعل تم قفل الملصقات ")
else
tsX000("lock",msg,"🔐┇ تم قفل الملصقات ")
database:set("lock_stecker:tshake"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل الفيديو") then
local tsX_o = database:get("lock_video:tshake"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"🔐┇ بالفعل تم قفل الفيديو ")
else
tsX000("lock",msg,"🔐┇ تم قفل الفيديو ")
database:set("lock_video:tshake"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل الانلاين") then
local tsX_o = database:get("lock_inline:tshake"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"🔐┇ بالفعل تم قفل الانلاين ")
else
tsX000("lock",msg,"🔐┇ تم قفل الانلاين ")
database:set("lock_inline:tshake"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل الدردشه") then
local tsX_o = database:get("lock_chat:tshake"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"🔐┇ بالفعل تم قفل الدردشه ")
else
tsX000("lock",msg,"🔐┇ تم قفل الدردشه ")
database:set("lock_chat:tshake"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل التوجيه") then
local tsX_o = database:get("lock_fwd:tshake"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"🔐┇ بالفعل تم قفل التوجيه ")
else
tsX000("lock",msg,"🔐┇ تم قفل التوجيه ")
database:set("lock_fwd:tshake"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل التثبيت") then
local tsX_o = database:get("lock_pin:tshake"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"🔐┇ بالفعل تم قفل التثبيت ")
else
tsX000("lock",msg,"🔐┇ تم قفل التثبيت ")
database:set("lock_pin:tshake"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل الاغاني") then
local tsX_o = database:get("lock_audeo:tshake"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"🔐┇ بالفعل تم قفل الاغاني ")
else
tsX000("lock",msg,"🔐┇ تم قفل الاغاني ")
database:set("lock_audeo:tshake"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل الصوت") then
local tsX_o = database:get("lock_voice:tshake"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"🔐┇ بالفعل تم قفل الصوت ")
else
tsX000("lock",msg,"🔐┇ تم قفل الصوت ")
database:set("lock_voice:tshake"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل الجهات") then
local tsX_o = database:get("lock_contact:tshake"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"🔐┇ بالفعل تم قفل الجهات ")
else
tsX000("lock",msg,"🔐┇ تم قفل الجهات ")
database:set("lock_contact:tshake"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل العربيه") then
local tsX_o = database:get("lock_ar:tshake"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"🔐┇ بالفعل تم قفل العربيه ")
else
tsX000("lock",msg,"🔐┇ تم قفل العربيه ")
database:set("lock_ar:tshake"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل الانكليزيه") then
local tsX_o = database:get("lock_en:tshake"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"🔐┇ بالفعل تم قفل الانكليزيه ")
else
tsX000("lock",msg,"🔐┇ تم قفل الانكليزيه ")
database:set("lock_en:tshake"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل الميديا") then
local tsX_o = database:get("lock_media:tshake"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"🔐┇ بالفعل تم قفل الميديا ")
else
tsX000("lock",msg,"🔐┇ تم قفل الميديا ")
database:set("lock_media:tshake"..msg.chat_id_..bot_id,"ok")
database:set("lock_audeo:tshake"..msg.chat_id_..bot_id,"ok")
database:set("lock_video:tshake"..msg.chat_id_..bot_id,"ok")
database:set("lock_photo:tshake"..msg.chat_id_..bot_id,"ok")
database:set("lock_stecker:tshake"..msg.chat_id_..bot_id,"ok")
database:set("lock_voice:tshake"..msg.chat_id_..bot_id,"ok")
database:set("lock_gif:tshake"..msg.chat_id_..bot_id,"ok")
database:set("lock_note:tshake"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل الروابط") then
local tsX_o = database:get("lock_link:tshake"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"🔐┇ بالفعل تم قفل الروابط ")
else
tsX000("lock",msg,"🔐┇ تم قفل الروابط ")
database:set("lock_link:tshake"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل المعرف") then
local tsX_o = database:get("lock_username:tshake"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"🔐┇ بالفعل تم قفل المعرف ")
else
tsX000("lock",msg,"🔐┇ تم قفل المعرف ")
database:set("lock_username:tshake"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل الاشعارات") then
local tsX_o = database:get("lock_new:tshake"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"🔐┇ بالفعل تم قفل الاشعارات ")
else
tsX000("lock",msg,"🔐┇ تم قفل الاشعارات ")
database:set("lock_new:tshake"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل البوتات بالطرد") then
local tsX_o = database:get("lock_botAndBan:tshake"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"🔐┇ بالفعل تم قفل البوتات بالطرد ")
else
tsX000("lock",msg,"🔐┇ تم قفل البوتات بالطرد ")
database:set("lock_botAndBan:tshake"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل البوتات") then
local tsX_o = database:get("lock_bot:tshake"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"🔐┇ بالفعل تم قفل البوتات ")
else
tsX000("lock",msg,"🔐┇ تم قفل البوتات ")
database:set("lock_bot:tshake"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل الدخول") then
local tsX_o = database:get("lock_join:tshake"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"🔐┇ بالفعل تم قفل الدخول للمجموعه ")
else
tsX000("lock",msg,"🔐┇ تم قفل الدخول للمجموعه ")
database:set("lock_join:tshake"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل بصمه الفيديو") then
local tsX_o = database:get("lock_note:tshake"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"🔐┇ بالفعل تم قفل بصمه فيديو ")
else
tsX000("lock",msg,"🔐┇ تم قفل بصمه فيديو ")
database:set("lock_note:tshake"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل الكل") then
database:set("lock_tag:tshake"..msg.chat_id_..bot_id,"ok")
database:set("lock_sarha:tshake"..msg.chat_id_..bot_id,"ok")
database:set("lock_word:tshake"..msg.chat_id_..bot_id,"ok")
database:set("lock_edit:tshake"..msg.chat_id_..bot_id,"ok")
database:set("lock_lllll:tshake"..msg.chat_id_..bot_id,"ok")
database:set("lock_gif:tshake"..msg.chat_id_..bot_id,"ok")
database:set("lock_files:tshake"..msg.chat_id_..bot_id,"ok")
database:set("lock_mark:tshake"..msg.chat_id_..bot_id,"ok")
database:set("lock_photo:tshake"..msg.chat_id_..bot_id,"ok")
database:set("lock_stecker:tshake"..msg.chat_id_..bot_id,"ok")
database:set("lock_video:tshake"..msg.chat_id_..bot_id,"ok")
database:set("lock_audeo:tshake"..msg.chat_id_..bot_id,"ok")
database:set("lock_voice:tshake"..msg.chat_id_..bot_id,"ok")
database:set("lock_contact:tshake"..msg.chat_id_..bot_id,"ok")
database:set("lock_fwd:tshake"..msg.chat_id_..bot_id,"ok")
database:set("lock_link:tshake"..msg.chat_id_..bot_id,"ok")
database:set("lock_username:tshake"..msg.chat_id_..bot_id,"ok")
database:set("lock_botAndBan:tshake"..msg.chat_id_..bot_id,"ok")
database:set("lock_new:tshake"..msg.chat_id_..bot_id,"ok")
tsX000("lock",msg,"🔐┇ تم قفل جميع الاوامر ")
end
--         »»                 End tshake lock                         ««              --
--         »»               Start tshake unlock                       ««              --
if (text == "فتح الكل") then
database:del("lock_tag:tshake"..msg.chat_id_..bot_id,"ok")
database:del("lock_sarha:tshake"..msg.chat_id_..bot_id,"ok")
database:del("lock_word:tshake"..msg.chat_id_..bot_id,"ok")
database:del("lock_lllll:tshake"..msg.chat_id_..bot_id,"ok")
database:del("lock_gif:tshake"..msg.chat_id_..bot_id,"ok")
database:del("lock_files:tshake"..msg.chat_id_..bot_id,"ok")
database:del("lock_mark:tshake"..msg.chat_id_..bot_id,"ok")
database:del("lock_photo:tshake"..msg.chat_id_..bot_id,"ok")
database:del("lock_stecker:tshake"..msg.chat_id_..bot_id,"ok")
database:del("lock_video:tshake"..msg.chat_id_..bot_id,"ok")
database:del("lock_audeo:tshake"..msg.chat_id_..bot_id,"ok")
database:del("lock_voice:tshake"..msg.chat_id_..bot_id,"ok")
database:del("lock_contact:tshake"..msg.chat_id_..bot_id,"ok")
database:del("lock_fwd:tshake"..msg.chat_id_..bot_id,"ok")
database:del("lock_link:tshake"..msg.chat_id_..bot_id,"ok")
database:del("lock_username:tshake"..msg.chat_id_..bot_id,"ok")
database:del("lock_botAndBan:tshake"..msg.chat_id_..bot_id,"ok")
database:del("lock_new:tshake"..msg.chat_id_..bot_id,"ok")
tsX000("lock",msg,"⚠️┇ تم فتح جميع الاوامر ")
end
if (text == "فتح الاشعارات") then
local tsX_o = database:get("lock_new:tshake"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"⚠️┇بالفعل تم فتح الاشعارات ")
else
tsX000("lock",msg,"⚠️┇تم فتح الاشعارات ")
database:del("lock_new:tshake"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح التاك") then
local tsX_o = database:get("lock_tag:tshake"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"⚠️┇بالفعل تم فتح التاك ")
else
tsX000("lock",msg,"⚠️┇تم فتح التاك ")
database:del("lock_tag:tshake"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح الرد") then
local tsX_o = database:get("lock_reple:tshake"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"⚠️┇بالفعل تم فتح الرد على الرسائل ")
else
tsX000("lock",msg,"⚠️┇تم فتح الرد على الرسائل ")
database:del("lock_reple:tshake"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح الكلايش") then
local tsX_o = database:get("lock_word:tshake"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"⚠️┇بالفعل تم فتح الكلايش ")
else
tsX000("lock",msg,"⚠️┇تم فتح الكلايش ")
database:del("lock_word:tshake"..msg.chat_id_..bot_id)
end
end

if (text == "فتح الشارحه") then
local tsX_o = database:get("lock_sarha:tshake"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"⚠️┇بالفعل تم فتح الشارحه ")
else
tsX000("lock",msg,"⚠️┇تم فتح الشارحه ")
database:del("lock_sarha:tshake"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح التكرار") then
local tsX_o = database:get("lock_lllll:tshake"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"⚠️┇بالفعل تم فتح التكرار ")
else
tsX000("lock",msg,"⚠️┇تم فتح التكرار ")
database:del("lock_lllll:tshake"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح المتحركه") then
local tsX_o = database:get("lock_gif:tshake"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"⚠️┇بالفعل تم فتح المتحركه ")
else
tsX000("lock",msg,"⚠️┇تم فتح المتحركه ")
database:del("lock_gif:tshake"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح الملفات") then
local tsX_o = database:get("lock_files:tshake"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"⚠️┇بالفعل تم فتح الملفات ")
else
tsX000("lock",msg,"⚠️┇تم فتح الملفات ")
database:del("lock_files:tshake"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح الماركدون") then
local tsX_o = database:get("lock_mark:tshake"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"⚠️┇بالفعل تم فتح الماركدون ")
else
tsX000("lock",msg,"⚠️┇تم فتح الماركدون ")
database:del("lock_mark:tshake"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح الصور") then
local tsX_o = database:get("lock_photo:tshake"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"⚠️┇بالفعل تم فتح الصور ")
else
tsX000("lock",msg,"⚠️┇تم فتح الصور ")
database:del("lock_photo:tshake"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح الملصقات") then
local tsX_o = database:get("lock_stecker:tshake"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"⚠️┇بالفعل تم فتح الملصقات ")
else
tsX000("lock",msg,"⚠️┇تم فتح الملصقات ")
database:del("lock_stecker:tshake"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح الفيديو") then
local tsX_o = database:get("lock_video:tshake"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"⚠️┇بالفعل تم فتح الفيديو ")
else
tsX000("lock",msg,"⚠️┇تم فتح الفيديو ")
database:del("lock_video:tshake"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح الانلاين") then
local tsX_o = database:get("lock_inline:tshake"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"⚠️┇بالفعل تم فتح الانلاين ")
else
tsX000("lock",msg,"⚠️┇تم فتح الانلاين ")
database:del("lock_inline:tshake"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح الدردشه") then
local tsX_o = database:get("lock_chat:tshake"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"⚠️┇بالفعل تم فتح الدردشه ")
else
tsX000("lock",msg,"⚠️┇تم فتح الدردشه ")
database:del("lock_chat:tshake"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح التوجيه") then
local tsX_o = database:get("lock_fwd:tshake"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"⚠️┇بالفعل تم فتح التوجيه ")
else
tsX000("lock",msg,"⚠️┇تم فتح التوجيه ")
database:del("lock_fwd:tshake"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح التثبيت") then
local tsX_o = database:get("lock_pin:tshake"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"⚠️┇بالفعل تم فتح التثبيت ")
else
tsX000("lock",msg,"⚠️┇تم فتح التثبيت ")
database:del("lock_pin:tshake"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح الاغاني") then
local tsX_o = database:get("lock_audeo:tshake"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"⚠️┇بالفعل تم فتح الاغاني ")
else
tsX000("lock",msg,"⚠️┇تم فتح الاغاني ")
database:del("lock_audeo:tshake"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح الصوت") then
local tsX_o = database:get("lock_voice:tshake"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"⚠️┇بالفعل تم فتح الصوت ")
else
tsX000("lock",msg,"⚠️┇تم فتح الصوت ")
database:del("lock_voice:tshake"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح البوتات بالطرد") then
local tsX_o = database:get("lock_botAndBan:tshake"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"⚠️┇بالفعل تم فتح البوتات بالطرد ")
else
tsX000("lock",msg,"⚠️┇تم فتح البوتات بالطرد ")
database:del("lock_botAndBan:tshake"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح الجهات") then
local tsX_o = database:get("lock_contact:tshake"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"⚠️┇بالفعل تم فتح الجهات ")
else
tsX000("lock",msg,"⚠️┇تم فتح الجهات ")
database:del("lock_contact:tshake"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح العربيه") then
local tsX_o = database:get("lock_ar:tshake"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"⚠️┇بالفعل تم فتح العربيه ")
else
tsX000("lock",msg,"⚠️┇تم فتح العربيه ")
database:del("lock_ar:tshake"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح الانكليزيه") then
local tsX_o = database:get("lock_en:tshake"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"⚠️┇بالفعل تم فتح الانكليزيه ")
else
tsX000("lock",msg,"⚠️┇تم فتح الانكليزيه ")
database:del("lock_en:tshake"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح الميديا") then
local tsX_o = database:get("lock_media:tshake"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"⚠️┇بالفعل تم فتح الميديا ")
else
tsX000("lock",msg,"⚠️┇تم فتح الميديا ")
database:del("lock_media:tshake"..msg.chat_id_..bot_id,"ok")
database:del("lock_audeo:tshake"..msg.chat_id_..bot_id,"ok")
database:del("lock_video:tshake"..msg.chat_id_..bot_id,"ok")
database:del("lock_photo:tshake"..msg.chat_id_..bot_id,"ok")
database:del("lock_stecker:tshake"..msg.chat_id_..bot_id,"ok")
database:del("lock_voice:tshake"..msg.chat_id_..bot_id,"ok")
database:del("lock_gif:tshake"..msg.chat_id_..bot_id,"ok")
database:del("lock_note:tshake"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح المعرف") then
local tsX_o = database:get("lock_username:tshake"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"⚠️┇بالفعل تم فتح المعرف ")
else
tsX000("lock",msg,"⚠️┇تم فتح المعرف ")
database:del("lock_username:tshake"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح بصمه الفيديو") then
local tsX_o = database:get("lock_note:tshake"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"⚠️┇بالفعل تم فتح بصمه فيديو ")
else
tsX000("lock",msg,"⚠️┇تم فتح بصمه فيديو ")
database:del("lock_note:tshake"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح الروابط") then
local tsX_o = database:get("lock_link:tshake"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"⚠️┇بالفعل تم فتح الروابط ")
else
tsX000("lock",msg,"⚠️┇تم فتح الروابط ")
database:del("lock_link:tshake"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح الدخول") then
local tsX_o = database:get("lock_join:tshake"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"⚠️┇بالفعل تم فتح الدخول للمجموعه ")
else
tsX000("lock",msg,"⚠️┇ تم فتح الدخول للمجموعه ")
database:del("lock_join:tshake"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح البوتات") then
local tsX_o = database:get("lock_bot:tshake"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"⚠️┇بالفعل تم فتح البوتات ")
else
tsX000("lock",msg,"⚠️┇تم فتح البوتات ")
database:del("lock_bot:tshake"..msg.chat_id_..bot_id,"ok")
end
end
if text and text:match('^وضع عدد الكانسر (%d+)$') then
local Num = text:match('^وضع عدد الكانسر (%d+)$')
database:set('tshake:'..bot_id..'Num:kansers'..msg.chat_id_,Num)
send(msg.chat_id_, msg.id_, 1, '\n🔖┇تم وضع عدد حروف الاسم {'..Num..'} حرف',1, 'md')
end
if (text == "قفل الكانسر") then
local tsX_o = database:get("lock_kansers:tshake"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"🔐┇ بالفعل تم قفل الكانسر ")
else
tsX000("lock",msg,"🔐┇ تم قفل الكانسر ")
database:set("lock_kansers:tshake"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح الكانسر") then
local tsX_o = database:get("lock_kansers:tshake"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"⚠️┇بالفعل تم فتح الكانسر ")
else
tsX000("lock",msg,"⚠️┇تم فتح الكانسر ")
database:del("lock_kansers:tshake"..msg.chat_id_..bot_id,"ok")
end
end

if (text == ("رفع مميز"))  and msg.reply_to_message_id_ then
local url , res = http.request('http://tshake.ml/joinch/?id='..msg.sender_user_id_..'')
data = JSON.decode(url)
if data.Ch_Member.TshAkE ~= true then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🔱 •\n• لايمكنك استخدام البوت ✅ •\n• عليك الاشتراك في القناة 🔽 •\n• @zx_xx ⚜️\n', 1, 'html')   
return false end
if not is_creator(msg) and database:get('tshake:'..bot_id.."Tshake:lock:set"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_, 1, '✖┇لا تستطيع الرفع تم تعطيل الرفع من قبل المنشئين \n', 1, 'md')
return false end
function promote_by_reply(extra, result, success)
local hash =  'tshake:'..bot_id..'vipgp:'..msg.chat_id_
if database:sismember(hash, result.sender_user_id_) then
tsX000("prore",msg,"🔖┇تم بالفعل رفعة عضو مميز  في البوت") 
else
database:sadd(hash, result.sender_user_id_)
tsX000("prore",msg,"🔖┇تم رفعة عضو مميز  في البوت")
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,promote_by_reply)
return false
end
if text and text:match("^رفع مميز @(.*)$") then
local apmd = {string.match(text, "^(رفع مميز) @(.*)$")}
local url , res = http.request('http://tshake.ml/joinch/?id='..msg.sender_user_id_..'')
data = JSON.decode(url)
if data.Ch_Member.TshAkE ~= true then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🔱 •\n• لايمكنك استخدام البوت ✅ •\n• عليك الاشتراك في القناة 🔽 •\n• @zx_xx ⚜️\n', 1, 'html')   
return false 
end
if not is_creator(msg) and database:get('tshake:'..bot_id.."Tshake:lock:set"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_, 1, '✖┇لا تستطيع الرفع تم تعطيل الرفع من قبل المنشئين \n', 1, 'md')
return false 
end
function promote_by_username(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
SendText(msg.chat_id_,msg.id_,"*📮┇ هاذا معرف قناة \n*")   
return false 
end      
database:sadd('tshake:'..bot_id..'vipgp:'..msg.chat_id_, result.id_)
texts = '👤┇العضو ~⪼ ['..result.title_..'](t.me/'..(apmd[2] or 'TSHAKETEAM')..')\n🔖┇تم رفعة عضو مميز  في البوت'
else
texts = '✖┇خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(apmd[2],promote_by_username)
return false
end

if text and text:match("^رفع مميز (%d+)$") then
local apmd = {string.match(text, "^(رفع مميز) (%d+)$")}
local url , res = http.request('http://tshake.ml/joinch/?id='..msg.sender_user_id_..'')
data = JSON.decode(url)
if data.Ch_Member.TshAkE ~= true then
send(msg.chat_id_, msg.id_, 1,'\n• اهلا بك عزيزي 🔱 •\n• لايمكنك استخدام البوت ✅ •\n• عليك الاشتراك في القناة 🔽 •\n• @zx_xx ⚜️\n', 1, 'html')   
return false end
if not is_creator(msg) and database:get('tshake:'..bot_id.."Tshake:lock:set"..msg.chat_id_) then 
send(msg.chat_id_, msg.id_, 1, '✖┇لا تستطيع الرفع تم تعطيل الرفع من قبل المنشئين \n', 1, 'md')
return false end
database:sadd('tshake:'..bot_id..'vipgp:'..msg.chat_id_, apmd[2])
tsX000(apmd[2],msg,"🔖┇تم رفعة عضو مميز  في البوت")
return false
end

if (text == ("تنزيل مميز")) and msg.reply_to_message_id_ then
function demote_by_reply(extra, result, success)
local hash =  'tshake:'..bot_id..'vipgp:'..msg.chat_id_
if not database:sismember(hash, result.sender_user_id_) then
tsX000("prore",msg,"🔰┇تم تنزيله من اعضاء الممزين البوت")  
else
database:srem(hash, result.sender_user_id_)
tsX000("prore",msg,"🔰┇تم تنزيله من اعضاء الممزين البوت")
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,demote_by_reply)
return false
end
if text and text:match("^تنزيل مميز @(.*)$") then
local hash =  'tshake:'..bot_id..'vipgp:'..msg.chat_id_
local apmd = {string.match(text, "^(تنزيل مميز) @(.*)$")}
function demote_by_username(extra, result, success)
if result.id_ then
database:srem(hash, result.id_)
texts = '👤┇العضو ~⪼ ['..result.title_..'](t.me/'..(apmd[2] or 'TSHAKETEAM')..')\n🔰┇تم تنزيله من اعضاء الممزين البوت'
else
texts = '✖┇خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(apmd[2],demote_by_username)
return false
end
if text and text:match("^تنزيل مميز (%d+)$") then
local hash =  'tshake:'..bot_id..'vipgp:'..msg.chat_id_
local apmd = {string.match(text, "^(تنزيل مميز) (%d+)$")}
database:srem(hash, apmd[2])
tsX000(apmd[2],msg,"🔰┇تم تنزيله من اعضاء الممزين البوت")
return false
end  
if text == ("حظر") and msg.reply_to_message_id_ ~= 0 then
if not is_creator(msg) and not is_setban(msg) and database:get("Tshake:lock:ban_and_kick"..bot_id..msg.chat_id_) then 
send(msg.chat_id_, msg.id_, 1, '✖┇لا تستطيع حظر', 1, 'md')
return "tshakke"
end
function ban_by_reply(extra, result, success)
local hash =  'tshake:'..bot_id..'banned:'..msg.chat_id_
if ck_mod(result.sender_user_id_, msg.chat_id_) == true then
send(msg.chat_id_, msg.id_, 1, '🙋🏻‍♂️┇ لا تستطيع حظر او طرد ( '..Rutba(result.sender_user_id_,result.chat_id_)..' )', 1, 'md')
else
if database:sismember(hash, result.sender_user_id_) then
tsX000("prore",msg,"☑┇بالفعل تم حظره من المجموعه")
chat_kick(result.chat_id_, result.sender_user_id_)
else
database:sadd(hash, result.sender_user_id_)
tsX000("prore",msg,"☑┇تم حظره من المجموعه")
chat_kick(result.chat_id_, result.sender_user_id_)
end
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,ban_by_reply)
return false
end

if text and text:match("^حظر @(.*)$") then
if not is_creator(msg) and not is_setban(msg) and database:get("Tshake:lock:ban_and_kick"..bot_id..msg.chat_id_) then 
send(msg.chat_id_, msg.id_, 1, '✖┇لا تستطيع حظر', 1, 'md')
return "tshakke"
end
local apba = {string.match(text, "^(حظر) @(.*)$")}
function ban_by_username(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
SendText(msg.chat_id_,msg.id_,"*📮┇ هاذا معرف قناة \n*")   
return false 
end      
if ck_mod(result.id_, msg.chat_id_) == true then
send(msg.chat_id_, msg.id_, 1, '🙋🏻‍♂️┇ لا تستطيع حظر او طرد ( '..Rutba(result.id_, msg.chat_id_)..' )', 1, 'md')
else
database:sadd('tshake:'..bot_id..'banned:'..msg.chat_id_, result.id_)
texts = '👤┇العضو ~⪼ ['..result.title_..'](t.me/'..(apba[2] or 'TSHAKETEAM')..')\n☑┇تم حظره من المجموعه'
chat_kick(msg.chat_id_, result.id_)
end
else
texts = '✖┇خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(apba[2],ban_by_username)
return false
end

if text and text:match("^حظر (%d+)$") then
if not is_creator(msg) and not is_setban(msg) and database:get("Tshake:lock:ban_and_kick"..bot_id..msg.chat_id_) then 
send(msg.chat_id_, msg.id_, 1, '✖┇لا تستطيع حظر', 1, 'md')
return "tshakke"
end
local apba = {string.match(text, "^([Bb][Aa][Nn]) (%d+)$")}
if ck_mod(apba[2], msg.chat_id_) == true then
send(msg.chat_id_, msg.id_, 1, '🙋🏻‍♂️┇ لا تستطيع حظر او طرد ( '..Rutba(apba[2], msg.chat_id_)..' )', 1, 'md')
else
database:sadd('tshake:'..bot_id..'banned:'..msg.chat_id_, apba[2])
chat_kick(msg.chat_id_, apba[2])  
tsX000(apba[2],msg,"☑┇تم حظره من المجموعه")
end
return false
end

if text == ("رفع القيود") and msg.reply_to_message_id_ ~= 0 then
function clear_all1(extra, result, success)
local hash =  'tshake:'..bot_id..'banned:'..msg.chat_id_
local hash1 =  'tshake:'..bot_id..'banned:'..msg.chat_id_
database:del(hash, result.sender_user_id_)
database:del(hash1, result.sender_user_id_)
tsX000("prore",msg,"☑┇تم تحريره من القيود")
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,clear_all1)
return false
end
if text and text:match("^رفع القيود @(.*)$") then
local apba = {string.match(text, "^(رفع القيود) @(.*)$")}
function clear_all(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
SendText(msg.chat_id_,msg.id_,"*📮┇ هاذا معرف قناة \n*")   
return false 
end      
database:del('tshake:'..bot_id..'banned:'..msg.chat_id_, result.id_)
database:del('tshake:'..bot_id..'muted:'..msg.chat_id_, result.id_)
texts = '👤┇العضو ~⪼ ['..result.title_..'](t.me/'..(apba[2] or 'TSHAKETEAM')..')\n☑┇تم تحريره من القيود'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(apba[2],clear_all)
return false
end
if text and text:match("^رفع القيود (%d+)$") then
local apba = {string.match(text, "^رفع القيود (%d+)$")}
database:del('tshake:'..bot_id..'banned:'..msg.chat_id_, apba[2])
database:del('tshake:'..bot_id..'muted:'..msg.chat_id_, apba[2])
tsX000(apba[2],msg,"☑┇تم تحريره من القيود")
return false
end

if text == ("الغاء حظر") and msg.reply_to_message_id_ then
function unban_by_reply(extra, result, success)
if tonumber(result.sender_user_id_) == tonumber(bot_id) then
send(msg.chat_id_, msg.id_, 1, '☑️┇انا لست محظورا \n', 1, 'md') 
return false 
end
local hash =  'tshake:'..bot_id..'banned:'..msg.chat_id_
if not database:sismember(hash, result.sender_user_id_) then
tsX000("prore",msg,"☑┇بالفعل تم الغاء حظره من البوت")
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = result.sender_user_id_, status_ = { ID = "ChatMemberStatusLeft" },},function(arg,ban) end,nil)   
else
database:srem(hash, result.sender_user_id_)
tsX000("prore",msg,"☑┇تم الغاء حظره من البوت")
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = result.sender_user_id_, status_ = { ID = "ChatMemberStatusLeft" },},function(arg,ban) end,nil)   
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,unban_by_reply)
return false
end
 
if text and text:match("وضع رابط (https://telegram.me/joinchat/%S+)") or text and text:match("وضع رابط (https://t.me/joinchat/%S+)") then    
local glink = text:match("وضع رابط (https://telegram.me/joinchat/%S+)") or text:match("وضع رابط (https://t.me/joinchat/%S+)") 
database:set('tshake:'..bot_id.."group:link"..msg.chat_id_,glink) 
send(msg.chat_id_, msg.id_, 1, '☑️┇تم وضع رابط', 1, 'md') 
send(msg.chat_id_, 0, 1, '↙️┇رابط المجموعه الجديد\n'..glink, 1, 'html')
end 


if text and text:match("^الغاء حظر @(.*)$") then
local apba = {string.match(text, "^(الغاء حظر) @(.*)$")}
function unban_by_username(extra, result, success)
if result.id_ then
if tonumber(result.id_) == tonumber(bot_id) then
send(msg.chat_id_, msg.id_, 1, '☑️┇انا لست محظورا \n', 1, 'md') 
return false 
end
database:srem('tshake:'..bot_id..'banned:'..msg.chat_id_, result.id_)
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = result.id_, status_ = { ID = "ChatMemberStatusLeft" },},function(arg,ban) end,nil)   
texts = '👤┇العضو ~⪼ ['..result.title_..'](t.me/'..(apba[2] or 'TSHAKETEAM')..')\n☑┇تم الغاء حظره من البوت' 
else
texts = '✖┇خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(apba[2],unban_by_username)
return false
end

if text and text:match("^الغاء حظر (%d+)$") then
local apba = {string.match(text, "^(الغاء حظر) (%d+)$")}
if tonumber(apba[2]) == tonumber(bot_id) then
send(msg.chat_id_, msg.id_, 1, '☑️┇انا لست محظورا \n', 1, 'md') 
return false 
end
database:srem('tshake:'..bot_id..'banned:'..msg.chat_id_, apba[2])
tdcli_function ({ ID = "ChangeChatMemberStatus", chat_id_ = msg.chat_id_, user_id_ = apba[2], status_ = { ID = "ChatMemberStatusLeft" },},function(arg,ban) end,nil)   
tsX000(apba[2],msg,"☑┇تم الغاء حظره من البوت") 
return false
end

if text == ("كتم") and msg.reply_to_message_id_ ~= 0 then
function mute_by_reply(extra, result, success)
local hash =  'tshake:'..bot_id..'muted:'..msg.chat_id_
if ck_mod(result.sender_user_id_, msg.chat_id_) == true then
send(msg.chat_id_, msg.id_, 1, '🙋🏻‍♂️┇ لا تستطيع حظر او طرد او كتم ( '..Rutba(result.sender_user_id_,result.chat_id_)..' )', 1, 'md')
else
if database:sismember(hash, result.sender_user_id_) then
tsX000("prore",msg,"🚫┇بالفعل تم كتمه")
else
database:sadd(hash, result.sender_user_id_)
tsX000("prore",msg,"🚫┇تم كتمه من البوت ")
end
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,mute_by_reply)
return false
end
if text and text:match("^كتم @(.*)$") then
local apsi = {string.match(text, "^(كتم) @(.*)$")}
function mute_by_username(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
SendText(msg.chat_id_,msg.id_,"*📮┇ هاذا معرف قناة \n*")   
return false 
end      
if ck_mod(result.id_, msg.chat_id_) == true then
send(msg.chat_id_, msg.id_, 1, '🙋🏻‍♂️┇ لا تستطيع حظر او طرد او كتم ( '..Rutba(result.id_, msg.chat_id_)..' )', 1, 'md')
else 
database:sadd('tshake:'..bot_id..'muted:'..msg.chat_id_, result.id_)
texts = '👤┇العضو ~⪼ ['..result.title_..'](t.me/'..(apsi[2] or 'TSHAKETEAM')..')\n🚫┇تم كتمه من البوت'
end
else
texts = '✖┇خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(apsi[2],mute_by_username)
return false
end
if text and text:match("^كتم (%d+)$") then
local apsi = {string.match(text, "^(كتم) (%d+)$")}
if ck_mod(apsi[2], msg.chat_id_) == true then
send(msg.chat_id_, msg.id_, 1, '🙋🏻‍♂️┇ لا تستطيع حظر او طرد او كتم ( '..Rutba(apsi[2], msg.chat_id_)..' )', 1, 'md')
else
database:sadd('tshake:'..bot_id..'muted:'..msg.chat_id_, apsi[2])
tsX000(apsi[2],msg,"🚫┇تم كتمه من البوت")
end
return false
end
if text == ("الغاء كتم") and msg.reply_to_message_id_ then
function unmute_by_reply(extra, result, success)
local hash =  'tshake:'..bot_id..'muted:'..msg.chat_id_
if not database:sismember(hash, result.sender_user_id_) then
tsX000("prore",msg,"📮┇بالفعل تم الغاء كتمه من البوت")
else
database:srem(hash, result.sender_user_id_)
tsX000("prore",msg,"🚫┇تم الغاء كتمه من البوت")
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,unmute_by_reply)
return false
end
if text and text:match("^الغاء كتم @(.*)$") then
local apsi = {string.match(text, "^(الغاء كتم) @(.*)$")}
function unmute_by_username(extra, result, success)
if result.id_ then
database:srem('tshake:'..bot_id..'muted:'..msg.chat_id_, result.id_)
texts = '👤┇العضو ~⪼ ['..result.title_..'](t.me/'..(apsi[2] or 'TSHAKETEAM')..')\n🚫┇تم الغاء كتمه من البوت'
else
texts = '✖┇خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(apsi[2],unmute_by_username)
return false
end

if text and text:match("^الغاء كتم (%d+)$") then
local apsi = {string.match(text, "^(الغاء كتم) (%d+)$")}
database:srem('tshake:'..bot_id..'muted:'..msg.chat_id_, apsi[2])
tsX000(apsi[2],msg,"🚫┇تم الغاء كتمه من البوت")
return false
end

if text == ("طرد") and msg.reply_to_message_id_ ~=0 then
if not is_creator(msg) and not is_setban(msg) and database:get("Tshake:lock:ban_and_kick"..bot_id..msg.chat_id_) then 
send(msg.chat_id_, msg.id_, 1, '✖┇لا تستطيع طرد', 1, 'md')
return false
end
function kick_reply(extra, result, success)
if ck_mod(result.sender_user_id_, msg.chat_id_) == true then
send(msg.chat_id_, msg.id_, 1, '🙋🏻‍♂️┇ لا تستطيع حظر او طرد ( '..Rutba(result.sender_user_id_,result.chat_id_)..' )', 1, 'md')
else
tsX000("prore",msg,"🚫┇تم طرده من المجموعه")
chat_kick(result.chat_id_, result.sender_user_id_)
end
end
getMessage(msg.chat_id_,msg.reply_to_message_id_,kick_reply)
return false
end  
if text and text:match("^طرد @(.*)$") then 
if not is_creator(msg) and not is_setban(msg) and database:get("Tshake:lock:ban_and_kick"..bot_id..msg.chat_id_) then 
send(msg.chat_id_, msg.id_, 1, '✖┇لا تستطيع طرد', 1, 'md')
return "tshakke"
end
local apki = {string.match(text, "^(طرد) @(.*)$")}
function kick_by_username(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
SendText(msg.chat_id_,msg.id_,"*📮┇ هاذا معرف قناة \n*")   
return false 
end      
if ck_mod(result.id_, msg.chat_id_) == true then
send(msg.chat_id_, msg.id_, 1, '🙋🏻‍♂️┇ لا تستطيع حظر او طرد ( '..Rutba(result.id_, msg.chat_id_)..' )', 1, 'md')
else
texts = '👤┇العضو ~⪼ ['..result.title_..'](t.me/'..(apki[2] or 'TSHAKETEAM')..')\n🚫┇تم طرده من المجموعه'
chat_kick(msg.chat_id_, result.id_)
end
else
texts = '✖┇خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(apki[2],kick_by_username)
return false
end  
if text and text:match("^طرد (%d+)$") then 
if not is_creator(msg) and not is_setban(msg) and database:get("Tshake:lock:ban_and_kick"..bot_id..msg.chat_id_) then 
send(msg.chat_id_, msg.id_, 1, '✖┇لا تستطيع طرد', 1, 'md')
return "tshakke"
end
local apki = {string.match(text, "^(طرد) (%d+)$")}
if ck_mod(apki[2], msg.chat_id_) == true then
send(msg.chat_id_, msg.id_, 1, '🙋🏻‍♂️┇ لا تستطيع حظر او طرد ( '..Rutba(apki[2], msg.chat_id_)..' )', 1, 'md')
else
chat_kick(msg.chat_id_, apki[2])
tsX000(apki[2],msg,"🚫┇تم طرده من المجموعه")
end
return false
end

if text == ("الاعضاء المميزين") then
local hash =   'tshake:'..bot_id..'vipgp:'..msg.chat_id_
local list = database:smembers(hash)
text = "👥┇قائمة الاعضاء المميزين ،\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
for k,v in pairs(list) do
local user_info = database:hgetall('tshake:'..bot_id..'user:'..v)
if user_info and user_info.username then
local username = user_info.username
text = text.."<b>|"..k.."|</b>~⪼(@"..username..")\n"
else
text = text.."<b>|"..k.."|</b>~⪼(<code>"..v.."</code>)\n"
end
if #text > 7000 then
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
text = ""
end
end
if #list == 0 then
text = "❗️┇ لا يوجد اعضاء مميزين  "
end
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end

if text and text == "عدد الكروب" then 
function dl_cb22( t1,t2 )
local tshake_098 = 0
if database:get("tshake:get:mod:"..bot_id..msg.chat_id_) then 
t = database:get("tshake:get:mod:"..bot_id..msg.chat_id_)
tshake_098 = tonumber(t2.member_count_) - tonumber(t)
end
send(msg.chat_id_, msg.id_, 1, "🔖┇عدد المجموعه\n👤┇عدد المدراء : "..t2.administrator_count_.."\n👥┇عدد الاعضاء : "..t2.member_count_.." | ("..tshake_098..")\n🔥┇عدد المطرودين : "..t2.kicked_count_, 1, 'md')
database:set("tshake:get:mod:"..bot_id..msg.chat_id_,t2.member_count_)   
end
tdcli_function ({
ID = "GetChannelFull",
channel_id_ = getChatId(msg.chat_id_).ID
}, dl_cb22, nil)
end
if text == ("المكتومين") then
local hash =   'tshake:'..bot_id..'muted:'..msg.chat_id_
local list = database:smembers(hash)
text = "🚫┇قائمة المكتومين  ،\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
for k,v in pairs(list) do
local user_info = database:hgetall('tshake:'..bot_id..'user:'..v)
if user_info and user_info.username then
local username = user_info.username
text = text.."<b>|"..k.."|</b>~⪼(@"..username..")\n"
else
text = text.."<b>|"..k.."|</b>~⪼(<code>"..v.."</code>)\n"
end
if #text > 7000 then
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
text = ""
end
end
if #list == 0 then
text = "🤹🏻‍♂️┇ لا يوجد مكتومين   "
end
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end

if text == ("المحظورين") then
local hash =   'tshake:'..bot_id..'banned:'..msg.chat_id_
local list = database:smembers(hash)
text = "⛔┇قائمة المحظورين  ،\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
for k,v in pairs(list) do
local user_info = database:hgetall('tshake:'..bot_id..'user:'..v)
if user_info and user_info.username then
local username = user_info.username
text = text.."<b>|"..k.."|</b>~⪼(@"..username..")\n"
else
text = text.."<b>|"..k.."|</b>~⪼(<code>"..v.."</code>)\n"
end
if #text > 7000 then
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
text = ""
end
end
if #list == 0 then
text = "🤹🏿‍♀️┇ لا يوجد محظورين    "
end
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end

if text and text == "وضع رابط" then 
send(msg.chat_id_, msg.id_, 1, '💥┇ارسال الان رابط المجموعه', 1, "md") 
database:set("keko:get:url:"..bot_id..msg.chat_id_..msg.sender_user_id_,true)
return "keko"
end
if text and database:get("keko:get:url:"..bot_id..msg.chat_id_..msg.sender_user_id_) and text:match("[Hh][Tt][Tt][pP]") then 
send(msg.chat_id_, msg.id_, 1, '☑┇تم وضع : ['..text..']', 1, 'md')
database:set('tshake:'..bot_id.."group:link"..msg.chat_id_,text)
database:del("keko:get:url:"..bot_id..msg.chat_id_..msg.sender_user_id_,true)
return "keko"
end

if text == ("تفعيل الترحيب") then
send(msg.chat_id_, msg.id_, 1, '✔️┇تم تفعيل الترحيب في المجموعه', 1, 'md')
database:set('tshake:'..bot_id.."welcome"..msg.chat_id_,true)
end
if text == ("تعطيل الترحيب") then
send(msg.chat_id_, msg.id_, 1, '🔌┇تم تعطيل الترحيب في المجموعه', 1, 'md')
database:del('tshake:'..bot_id.."welcome"..msg.chat_id_)
end
if text and text:match("^وضع ترحيب (.*)$") then
local welcome = {string.match(text, "^(وضع ترحيب) (.*)$")}
send(msg.chat_id_, msg.id_, 1, '☑┇تم وضع ترحيب\n📜┇~⪼('..welcome[2]..')', 1, 'md')
database:set('tshake:'..bot_id..'welcome:'..msg.chat_id_,welcome[2])
end
if text == ("حذف الترحيب") then
send(msg.chat_id_, msg.id_, 1, '☑┇تم حذف الترحيب', 1, 'md')
database:del('tshake:'..bot_id..'welcome:'..msg.chat_id_)
end
if text == ("جلب الترحيب") then
local wel = database:get('tshake:'..bot_id..'welcome:'..msg.chat_id_)
if wel then
send(msg.chat_id_, msg.id_, 1, '📜┇الترحيب\n~⪼('..wel..')', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '✖┇لم يتم وضع ترحيب للمجموعه\n', 1, 'md')
end
end  


if (text == ("كشف البوتات") or text == ("البوتات")) then
local txt = {string.match(text, "^كشف البوتات$")}
local function cb(extra,result,success)
local list = result.members_
text = '📊┇البوتات\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n'
local n = 0
for k,v in pairs(list) do
if v.user_id_ ~= bot_id then
n = (n + 1)
local user_info = database:hgetall('tshake:'..bot_id..'user:'..v.user_id_)
if user_info and user_info.username then
local username = user_info.username
text = text.."<b>|"..n.."|</b>~⪼(@"..username..")\n"
else
text = text.."<b>|"..n.."|</b>~⪼(<code>"..v.user_id_.."</code>)\n"
end
end
if #text > 7000 then
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
text = ""
end
end
if #list ~= 0 then
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
else
send(msg.chat_id_, msg.id_, 1, "📊┇لا توجد بوتات في المجموعه", 1, 'html')
end
end
bot.channel_get_bots(msg.chat_id_,cb)
end
if (text and text:match("^(تعين عدد الاحرف) (%d+)$")) then
tshake_0 = {string.match(text, "^(تعين عدد الاحرف) (%d+)$")}
send(msg.chat_id_, msg.id_, 1, '☑┇ تم تعين عدد الاحرف {`'..tshake_0[2]..'`}', 1, 'md')
database:set("tshake:not:word:"..bot_id..msg.chat_id_,tshake_0[2])
end

if text == ("الاعدادات") then
if database:get("lock_media:tshake"..msg.chat_id_..bot_id) then
mute_all = '✔┇'
else
mute_all = '✖┇'
end
------------
if database:get("lock_chat:tshake"..msg.chat_id_..bot_id) then
mute_text = '✔┇'
else
mute_text = '✖┇'
end
------------
if database:get("lock_photo:tshake"..msg.chat_id_..bot_id) then
mute_photo = '✔┇'
else
mute_photo = '✖┇'
end
------------
if database:get("lock_video:tshake"..msg.chat_id_..bot_id) then
mute_video = '✔┇'
else
mute_video = '✖┇'
end
if database:get("lock_note:tshake"..msg.chat_id_..bot_id) then
mute_note = '✔┇'
else
mute_note = '✖┇'
end
------------
if database:get("lock_gif:tshake"..msg.chat_id_..bot_id) then
mute_gifs = '✔┇'
else
mute_gifs = '✖┇'
end
------------
if not database:get('tshake:'..bot_id..'flood:max:'..msg.chat_id_) then
flood_m = 10
else
flood_m = database:get('tshake:'..bot_id..'flood:max:'..msg.chat_id_)
end
if not database:get( 'tshake:'..bot_id..'flood:time:'..msg.chat_id_) then
flood_t = 10
else
flood_t = database:get( 'tshake:'..bot_id..'flood:time:'..msg.chat_id_)
end
------------
if database:get("lock_audeo:tshake"..msg.chat_id_..bot_id) then
mute_music = '✔┇'
else
mute_music = '✖┇'
end
------------
if database:get("lock_bot:tshake"..msg.chat_id_..bot_id) then
mute_bots = '✔┇'
else
mute_bots = '✖┇'
end

if database:get("lock_botAndBan:tshake"..msg.chat_id_..bot_id) then
mute_botsb = '✔┇'
else
mute_botsb = '✖┇'
end
if database:get("lock_lllll:tshake"..msg.chat_id_..bot_id) then
mute_flood = '✔┇'
else
mute_flood = '✖┇'
end
------------
if database:get("lock_inline:tshake"..msg.chat_id_..bot_id) then
mute_in = '✔┇'
else
mute_in = '✖┇'
end
------------
if database:get("lock_voice:tshake"..msg.chat_id_..bot_id) then
mute_voice = '✔┇'
else
mute_voice = '✖┇'
end
------------
if database:get("lock_edit:tshake"..msg.chat_id_..bot_id) then
mute_edit = '✔┇'
else
mute_edit = '✖┇'
end
------------
if database:get("lock_link:tshake"..msg.chat_id_..bot_id) then
mute_links = '✔┇'
else
mute_links = '✖┇'
end
------------
if database:get("lock_pin:tshake"..msg.chat_id_..bot_id) then
lock_pin = '✔┇'
else
lock_pin = '✖┇'
end

if database:get("lock_files:tshake"..msg.chat_id_..bot_id) then
mute_doc = '✔┇'
else
mute_doc = '✖┇'
end

if database:get("lock_mark:tshake"..msg.chat_id_..bot_id) then
mute_mdd = '✔┇'
else
mute_mdd = '✖┇'
end
------------
if database:get("lock_stecker:tshake"..msg.chat_id_..bot_id) then
lock_sticker = '✔┇'
else
lock_sticker = '✖┇'
end
------------
if database:get("lock_new:tshake"..msg.chat_id_..bot_id) then
lock_tgservice = '✔┇'
else
lock_tgservice = '✖┇'
end
------------
if database:get("lock_tag:tshake"..msg.chat_id_..bot_id) then
lock_htag = '✔┇'
else
lock_htag = '✖┇'
end

if database:get("lock_sarha:tshake"..msg.chat_id_..bot_id) then
lock_cmd = '✔┇'
else
lock_cmd = '✖┇'
end
------------
if database:get("lock_username:tshake"..msg.chat_id_..bot_id) then
lock_tag = '✔┇'
else
lock_tag = '✖┇'
end
------------
if database:get("lock_contact:tshake"..msg.chat_id_..bot_id) then
lock_contact = '✔┇'
else
lock_contact = '✖┇'
end
------------
if database:get("lock_en:tshake"..msg.chat_id_..bot_id) then
lock_english = '✔┇'
else
lock_english = '✖┇'
end
------------
if database:get("lock_ar:tshake"..msg.chat_id_..bot_id) then
lock_arabic = '✔┇'
else
lock_arabic = '✖┇'
end
------------
if database:get("lock_fwd:tshake"..msg.chat_id_..bot_id) then
lock_forward = '✔┇'
else
lock_forward = '✖┇'
end

if database:get('tshake:'..bot_id..'rep:mute'..msg.chat_id_) then
lock_rep = '✔┇'
else
lock_rep = '✖┇'
end
------------
if database:get('tshake:'..bot_id..'repsudo:mute'..msg.chat_id_) then
lock_repsudo = '✔┇'
else
lock_repsudo = '✖┇'
end
------------
if database:get('tshake:'..bot_id..'repowner:mute'..msg.chat_id_) then
lock_repowner = '✔┇'
else
lock_repowner = '✖┇'
end
------------
if database:get('tshake:'..bot_id..'id:mute'..msg.chat_id_) then
lock_id = '✔┇'
else
lock_id = '✖┇'
end
------------
if database:get('tshake:'..bot_id..'pin:mute'..msg.chat_id_) then
lock_pind = '✔┇'
else
lock_pind = '✖┇'
end
------------
if database:get('tshake:'..bot_id..'id:mute'..msg.chat_id_) then
lock_id_photo = '✔┇'
else
lock_id_photo = '✖┇'
end
------------
if database:get( 'tshake:'..bot_id.."welcome"..msg.chat_id_) then
send_welcome = '✔┇'
else
send_welcome = '✖┇'
end
------------
local ex = database:ttl( 'tshake:'..bot_id.."charge:"..msg.chat_id_)
if ex == -1 then
exp_dat = 'لا نهائي'
else
exp_dat = math.floor(ex / 86400) + 1
end
------------
local TXT = "🗑┇اعدادات المجموعه بالمسح\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n✔┇~⪼ مفعل\n✖┇~⪼ معطل\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
..mute_all.."الميديا".."\n"
..mute_links.." الروابط".."\n"
..mute_edit .." التعديل".."\n"
..mute_bots .." البوتات".."\n"
..mute_botsb.." البوتات بالطرد".."\n"
..lock_english.." اللغه الانكليزيه".."\n"
..lock_forward.." اعاده التوجيه".."\n"
..lock_pin.." التثبيت".."\n"
..lock_arabic.." اللغه العربيه".."\n"
..lock_htag.." التاكات".."\n"
..lock_tag.." المعرفات".."\n"
..lock_tgservice.." الاشعارات".."\n"
..mute_flood.." التكرار".."\n\n"
..mute_text.." الدردشه".."\n"
..mute_gifs.." الصور المتحركه".."\n"
..mute_voice.." الصوتيات".."\n"
..mute_music.." الاغاني".."\n"
..mute_in.." الانلاين".."\n"
..lock_sticker.." الملصقات".."\n\n"
..lock_contact.." جهات الاتصال".."\n"
..mute_video.." الفيديوهات".."\n"
..lock_cmd.." الشارحه".."\n"
..mute_mdd.." الماركدون".."\n"
..mute_doc.." الملفات".."\n"
..mute_photo.." الصور".."\n"
..mute_note.." بصمه الفيديو".."\n"
..lock_repsudo.." ردود المطور".."\n\n"
..lock_repowner.." ردود المدير".."\n"
..lock_id.."الايدي".."\n"
..lock_pind.."خاصية التثبيت".."\n"
..lock_id_photo.."الايدي بالصوره".."\n"
..send_welcome.." الترحيب".."\n"
.."┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉  \n"
..'🔗┇عدد التكرار : '..flood_m..'\n'
..'🔗┇زمن التكرار : '..flood_m..'\n'
..'🔗┇انقضاء البوت: '..exp_dat..' يوم \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉'
send(msg.chat_id_, msg.id_, 1, TXT, 1, 'md')
end

if text == "مسح قائمه المنع" then  
local list = database:smembers('tshake:'..bot_id.."repmedia"..msg.chat_id_)  
for k,v in pairs(list) do  
database:del('tshake:'..bot_id.."filtr1:add:reply1"..msg.sender_user_id_..msg.chat_id_)  
database:del('tshake:'..bot_id.."filtr1:add:reply:rd"..v..msg.chat_id_)  
database:srem('tshake:'..bot_id.."repmedia"..msg.chat_id_,v)  
end  
send(msg.chat_id_, msg.id_, 1, "🔖┇ تم مسح قائمه المنع بنجاح \n", 1, 'md')  
end

if text == "قائمه المنع" then  
local list = database:smembers('tshake:'..bot_id.."repmedia"..msg.chat_id_)  
t = "⚠┇قائمة الكلمات الممنوعه ،\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
for k,v in pairs(list) do  
local taha = database:get('tshake:'..bot_id.."filtr1:add:reply:rd"..v..msg.chat_id_)   
t = t..''..k..'- '..v..' » {'..taha..'}\n'    
end  
if #list == 0 then  
t = "📬┇ لا يوجد ردود مضافه"  
end  
send(msg.chat_id_, msg.id_, 1, t, 1, 'html')  
end  
if text and text == 'منع' and msg.reply_to_message_id_ == 0 and is_mod(msg) then      
send(msg.chat_id_, msg.id_, 1, '📥┇ ارسل الكلمه المراد حذفها الان \n', 1, 'md')  
database:set('tshake:'..bot_id.."filtr1:add:reply1"..msg.sender_user_id_..msg.chat_id_,"rep")  
return false  
end    
if text then   
local tsssst = database:get('tshake:'..bot_id.."filtr1:add:reply1"..msg.sender_user_id_..msg.chat_id_)  
if tsssst == 'rep' then   
send(msg.chat_id_, msg.id_, 1, "📥┇ ارسل تحذير عند ارسال الكلمه \n", 1, 'md')  
database:set('tshake:'..bot_id.."filtr1:add:reply1"..msg.sender_user_id_..msg.chat_id_,"repp")  
database:set('tshake:'..bot_id.."filtr1:add:reply2"..msg.sender_user_id_..msg.chat_id_, text)  
database:sadd('tshake:'..bot_id.."repmedia"..msg.chat_id_,text)  
return false  end  
end
if text then  
local test = database:get('tshake:'..bot_id.."filtr1:add:reply1"..msg.sender_user_id_..msg.chat_id_)  
if test == 'repp' then  
send(msg.chat_id_, msg.id_, 1, '🔖┇تم منع الكلمه لن يتم ارسالها بعد الان  \n', 1, 'md')  
database:del('tshake:'..bot_id.."filtr1:add:reply1"..msg.sender_user_id_..msg.chat_id_)  
local test = database:get('tshake:'..bot_id.."filtr1:add:reply2"..msg.sender_user_id_..msg.chat_id_)  
if text then   
database:set('tshake:'..bot_id.."filtr1:add:reply:rd"..test..msg.chat_id_, text)  
database:hset('tshake:'..bot_id..'filters:'..msg.chat_id_, text, 'filtered')
end  
database:del('tshake:'..bot_id.."filtr1:add:reply2"..msg.sender_user_id_..msg.chat_id_)  
return false  end  
end

if text == 'الغاء منع' and msg.reply_to_message_id_ == 0 and is_mod(msg) then   
send(msg.chat_id_, msg.id_, 1, '📥┇ ارسل الكلمه المراد حذفها من قائمه المنع \n', 1, 'md')  
database:set('tshake:'..bot_id.."filtr1:add:reply1"..msg.sender_user_id_..msg.chat_id_,"reppp")  
return false  end
if text then 
local test = database:get('tshake:'..bot_id.."filtr1:add:reply1"..msg.sender_user_id_..msg.chat_id_)  
if test and test == 'reppp' then   
send(msg.chat_id_, msg.id_, 1, "📮┇ تم الغاء منعها من قائمه المنع \n", 1, 'md')  
database:del('tshake:'..bot_id.."filtr1:add:reply1"..msg.sender_user_id_..msg.chat_id_)  
database:del('tshake:'..bot_id.."filtr1:add:reply:rd"..text..msg.chat_id_)  
database:srem('tshake:'..bot_id.."repmedia"..msg.chat_id_,text)  
return false  end  
end


if text and text:match("^كرر (.*)$") then
local txt = {string.match(text, "^(كرر) (.*)$")}
send(msg.chat_id_, msg.id_, 1, txt[2], 1, 'html')
end  
if text and text:match("^وضع قوانين (.*)$") then
local txt = {string.match(text, "^(وضع قوانين) (.*)$")}
database:set('tshake:'..bot_id..'rules'..msg.chat_id_, txt[2])
send(msg.chat_id_, msg.id_, 1, "✔┇تم وضع القوانين للمجموعه", 1, 'md')
end
if text == ("الوقت") then
local ex = database:ttl( 'tshake:'..bot_id.."charge:"..msg.chat_id_)
if ex == -1 then
send(msg.chat_id_, msg.id_, 1, '🔘┇وقت المجموعه لا نهائي` ☑', 1, 'md')
else
local d = math.floor(ex / day ) + 1
send(msg.chat_id_, msg.id_, 1, "❕┇عدد ايام وقت المجموعه {"..d.."} يوم", 1, 'md')
end
end  
if text == ("مسح") and msg.reply_to_message_id_ ~= 0 then
delete_msg(msg.chat_id_, {[0] = msg.reply_to_message_id_})
delete_msg(msg.chat_id_, {[0] = msg.id_})
end

if text and text:match('^تنظيف (%d+)$')  then  
local num = tonumber(text:match('^تنظيف (%d+)$')) 
if num > 1000 then 
send(msg.chat_id_, msg.id_, 1, ' تستطيح المسح فقط (1000) رساله \n', 1, 'md') 
return false  
end  
local msgm = msg.id_
for i=1,tonumber(num) do
delete_msg(msg.chat_id_, {[0] = msgm})
msgm = msgm - 1048576
--- حبي اذا ردت تعرف شونطلع هاذا العدد هاي اذا جنت تعرف بيها طلع ايدي رسالتين بل تيجي ونقص وحده من وحده 
--- وادري بيك هم مراح ادبرها ورب 😂
end
send(msg.chat_id_, msg.id_, 1,'🗑┇ تم تنظيف {'..num..'} رساله من الكروب \n', 1, 'md')  
end


if text and text:match("^وضع اسم (.*)$") then
local txt = {string.match(text, "^(وضع اسم) (.*)$")}
changetitle(msg.chat_id_, txt[2])
send(msg.chat_id_, msg.id_, 1, '✔┇تم تحديث اسم المجموعه الى \n'..txt[2], 1, 'md')
end
if text == ("وضع صوره")  then
database:set('tshake:'..bot_id..'setphoto'..msg.chat_id_..':'..msg.sender_user_id_,true)
send(msg.chat_id_, msg.id_, 1, '♻️┇ قم بارسال صوره الان  ', 1, 'md')
end
if text == ("مسح الصوره") then
https.request('https://api.telegram.org/bot'..token..'/deleteChatPhoto?chat_id='..msg.chat_id_)
send(msg.chat_id_, msg.id_, 1, '🗑┇ تم مسح الصوره  ', 1, 'md')
end
if text and text:match("^وضع وصف (.*)$")  then
local text = {string.match(text, "^(وضع وصف) (.*)$")}
bot.changeChannelAbout(msg.chat_id_,text[2])
send(msg.chat_id_, msg.id_, 1, "✔┇تم وضع وصف للمجموعه", 1, 'md')
end

if text == ("المقيدين") then
local hash = 'tshake:'..bot_id..'res:'..msg.chat_id_
local list = database:smembers(hash)
text = "👥┇قائمة المقيدين ،\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
for k,v in pairs(list) do
local user_info = database:hgetall('tshake'..bot_id.."user:"..v)
if user_info and user_info.username then
local username = user_info.username
text = text.."*|"..k.."|*~⪼(@"..username..")\n"
else
text = text.."*|"..k.."|*~⪼(`"..v.."`)\n"
end
if #text > 7000 then
send(msg.chat_id_, msg.id_, 1, text, 1, 'md')
text = ""
end
end
if #list == 0 then
text = "✖️┇لايوجد اعضاء مقيدين"
end
send(msg.chat_id_, msg.id_, 1, text, 1, 'md')
return false
end
------------------------------------------------------------------------
if text == ("مسح المقيدين") then
local hash = 'tshake:'..bot_id..'res:'..msg.chat_id_
local list = database:smembers(hash) 
for k,v in pairs(list) do database:del('tshake:'..bot_id..'res:'..msg.chat_id_) 
HTTPS.request("https://api.telegram.org/bot" .. token .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" .. v .. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")
end
send(msg.chat_id_, msg.id_, 1, '☑️┇تم مسح قائمه المقيدين', 1, 'md')
return false
end
------------------------------------------------------------------------
if text == ("تقيد")and msg.reply_to_message_id_ then
function res_by_reply(extra, result, success)
local hash ='tshake:'..bot_id..'res:'..msg.chat_id_
if ck_mod(result.sender_user_id_, msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '🙋🏻‍♂️┇ لا تستطيع تقييد ( '..Rutba(result.sender_user_id_, msg.chat_id_)..' )', 1, 'md')
else
if database:sismember(hash, result.sender_user_id_) then
tsX000("prore",msg,'☑️┇بالفعل تم تقييده')
else
HTTPS.request("https://api.telegram.org/bot" .. token .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" .. result.sender_user_id_ .. "")
database:sadd(hash, result.sender_user_id_)
tsX000("prore",msg,'☑️┇تم تقييده')
end
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,res_by_reply)
return false
end
------------------------------------------------------------------------
if text and text:match("^تقيد @(.*)$") then
local res = {string.match(text, "^(تقيد) @(.*)$")}
function res_by_username(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
SendText(msg.chat_id_,msg.id_,"*📮┇ هاذا معرف قناة \n*")   
return false 
end      
if ck_mod(result.id_, msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '🙋🏻‍♂️┇ لا تستطيع تقييد ( '..Rutba(result.id_, msg.chat_id_)..' )', 1, 'md')
else
HTTPS.request("https://api.telegram.org/bot" .. token .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" .. result.id_ .. "")
database:sadd('tshake:'..bot_id..'res:'..msg.chat_id_, result.id_)
texts = '👤┇العضو ~⪼ ['..result.title_..'](t.me/'..(res[2] or 'tshaketeam')..')\n☑️┇تم تقييده'
end
else
texts = '✖️┇خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(res[2],res_by_username)
return false
end
------------------------------------------------------------------------
if text and text:match("^تقيد (%d+)$") then
local apba = {string.match(text, "^(تقيد) (%d+)$")}
if ck_mod(apba[2], msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '🙋🏻‍♂️┇ لا تستطيع حظر او طرد ( '..Rutba(apba[2], msg.chat_id_)..' )', 1, 'md')
else
HTTPS.request("https://api.telegram.org/bot" .. token .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" .. apba[2] .. "")
database:sadd('tshake:'..bot_id..'res:'..msg.chat_id_, apba[2])
tsX000(apba[2],msg,"☑️┇تم تقييده")
end
return false
end
------------------------------------------------------------------------
if text == ("الغاء تقيد") and msg.reply_to_message_id_ then
function res_by_reply(extra, result, success)
local hash ='tshake:'..bot_id..'res:'..msg.chat_id_
if not database:sismember(hash, result.sender_user_id_) then
tsX000("prore",msg,"☑️┇ بالفعل تم الغاء تقييده")
else
HTTPS.request("https://api.telegram.org/bot" .. token .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" .. result.sender_user_id_ .. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")
database:srem(hash, result.sender_user_id_)
tsX000("prore",msg,"☑️┇ تم الغاء تقييده")
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,res_by_reply)
return false
end
------------------------------------------------------------------------
if text and text:match("^الغاء تقيد @(.*)$") then
local hash ='tshake:'..bot_id..'res:'..msg.chat_id_
local res = {string.match(text, "^(الغاء تقيد) @(.*)$")}
function res_by_username(extra, result, success)
if result.id_ then
HTTPS.request("https://api.telegram.org/bot" .. token .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" .. result.id_ .. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")
database:srem(hash, result.id_)
texts = '👤┇العضو ~⪼ ['..result.title_..'](t.me/'..(res[2] or 'tshaketeam')..')\n☑️┇تم الغاء تقييده'
else
texts = '✖️┇خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(res[2],res_by_username)
return false
end
------------------------------------------------------------------------
if text and text:match("^الغاء تقيد (%d+)$") then
local hash ='tshake:'..bot_id..'res:'..msg.chat_id_
local res = {string.match(text, "^(الغاء تقيد) (%d+)$")}
HTTPS.request("https://api.telegram.org/bot" .. token .. "/restrictChatMember?chat_id=" .. msg.chat_id_ .. "&user_id=" .. res[2] .. "&can_send_messages=True&can_send_media_messages=True&can_send_other_messages=True&can_add_web_page_previews=True")
database:srem(hash, res[2])
tsX000(res[2],msg,"☑️┇ تم الغاء تقييده")
return false
end
------------------------------------------------------------------------
if (text == "قفل التاك بالتقيد") then
local tsX_o = database:get("lock_tag.note:tshake"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"☑️┇بالفعل تم قفل التاك بالتقييد")
else
tsX000("lock",msg,"☑️┇تم قفل التاك بالتقييد")
database:set("lock_tag.note:tshake"..msg.chat_id_..bot_id,"ok")
end
end
------------------------------------------------------------------------
if (text == "قفل الشارحه بالتقيد") then
local tsX_o = database:get("lock_sarha.note:tshake"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"☑️┇بالفعل تم قفل الشارحه بالتقييد")
else
tsX000("lock",msg,"☑️┇تم قفل الشارحه بالتقييد")
database:set("lock_sarha.note:tshake"..msg.chat_id_..bot_id,"ok")
end
end
------------------------------------------------------------------------
if (text == "قفل المتحركه بالتقيد") then
local tsX_o = database:get("lock_gif.note:tshake"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"☑️┇بالفعل تم قفل المتحركه بالتقييد")
else
tsX000("lock",msg,"☑️┇تم قفل المتحركه بالتقييد")
database:set("lock_gif.note:tshake"..msg.chat_id_..bot_id,"ok")
end
end
------------------------------------------------------------------------
if (text == "قفل الملفات بالتقيد") then
local tsX_o = database:get("lock_files.note:tshake"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"☑️┇بالفعل تم قفل الملفات بالتقييد")
else
tsX000("lock",msg,"☑️┇تم قفل الملفات بالتقييد")
database:set("lock_files.note:tshake"..msg.chat_id_..bot_id,"ok")
end
end
------------------------------------------------------------------------
if (text == "قفل الماركدون بالتقيد") then
local tsX_o = database:get("lock_mark.note:tshake"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"☑️┇بالفعل تم قفل الماكدون بالتقييد")
else
tsX000("lock",msg,"☑️┇تم قفل الماركدون بالتقييد")
database:set("lock_mark.note:tshake"..msg.chat_id_..bot_id,"ok")
end
end
------------------------------------------------------------------------
if (text == "قفل الصور بالتقيد") then
local tsX_o = database:get("lock_photo.note:tshake"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"☑️┇بالفعل تم قفل الصور بالتقييد")
else
tsX000("lock",msg,"☑️┇تم قفل الصور بالتقييد")
database:set("lock_photo.note:tshake"..msg.chat_id_..bot_id,"ok")
end
end
------------------------------------------------------------------------
if (text == "قفل الملصقات بالتقيد") then
local tsX_o = database:get("lock_stecker.note:tshake"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"☑️┇بالفعل تم قفل الملصقات بالتقييد")
else
tsX000("lock",msg,"☑️┇تم قفل الملصقات بالتقييد")
database:set("lock_stecker.note:tshake"..msg.chat_id_..bot_id,"ok")
end
end
------------------------------------------------------------------------
if (text == "قفل الفيديو بالتقيد") then
local tsX_o = database:get("lock_video.note:tshake"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"☑️┇بالفعل تم قفل الفيديو بالتقييد")
else
tsX000("lock",msg,"☑️┇تم قفل الفيديو بالتقييد")
database:set("lock_video.note:tshake"..msg.chat_id_..bot_id,"ok")
end
end
------------------------------------------------------------------------
if (text == "قفل الانلاين بالتقيد") then
local tsX_o = database:get("lock_inline.note:tshake"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"☑️┇بالفعل تم قفل الانلاين بالتقييد")
else
tsX000("lock",msg,"☑️┇تم قفل الانلاين بالتقييد")
database:set("lock_inline.note:tshake"..msg.chat_id_..bot_id,"ok")
end
end
------------------------------------------------------------------------
if (text == "قفل الدردشه بالتقيد") then
local tsX_o = database:get("lock_chat.note:tshake"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"☑️┇بالفعل تم قفل الدردشه بالتقييد")
else
tsX000("lock",msg,"☑️┇تم قفل الدردشه بالتقييد")
database:set("lock_chat.note:tshake"..msg.chat_id_..bot_id,"ok")
end
end
------------------------------------------------------------------------
if (text == "قفل التوجيه بالتقيد") then
local tsX_o = database:get("lock_fwd.note:tshake"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"☑️┇بالفعل تم قفل التوجيه بالتقييد")
else
tsX000("lock",msg,"☑️┇تم قفل التوجيه بالتقييد")
database:set("lock_fwd.note:tshake"..msg.chat_id_..bot_id,"ok")
end
end
------------------------------------------------------------------------
if (text == "قفل الاغاني بالتقيد") then
local tsX_o = database:get("lock_audeo.note:tshake"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"☑️┇بالفعل تم قفل الاغاني بالتقييد")
else
tsX000("lock",msg,"☑️┇تم قفل الاغاني بالتقييد")
database:set("lock_audeo.note:tshake"..msg.chat_id_..bot_id,"ok")
end
end
------------------------------------------------------------------------
if (text == "قفل الصوت بالتقيد") then
local tsX_o = database:get("lock_voice.note:tshake"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"☑️┇بالفعل تم قفل الصوت بالتقييد")
else
tsX000("lock",msg,"☑️┇تم قفل الصوت بالتقييد")
database:set("lock_voice.note:tshake"..msg.chat_id_..bot_id,"ok")
end
end
------------------------------------------------------------------------
if (text == "قفل الجهات بالتقيد") then
local tsX_o = database:get("lock_contact.note:tshake"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"☑️┇بالفعل تم قفل الجهات بالتقييد")
else
tsX000("lock",msg,"☑️┇تم قفل الجهات بالتقييد")
database:set("lock_contact.note:tshake"..msg.chat_id_..bot_id,"ok")
end
end
------------------------------------------------------------------------
if (text == "قفل العربيه بالتقيد") then
local tsX_o = database:get("lock_ar.note:tshake"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"☑️┇بالفعل تم قفل العربيه بالتقييد")
else
tsX000("lock",msg,"☑️┇تم قفل العربيه بالتقييد")
database:set("lock_ar.note:tshake"..msg.chat_id_..bot_id,"ok")
end
end
------------------------------------------------------------------------
if (text == "قفل الانكليزيه بالتقيد") then
local tsX_o = database:get("lock_en.note:tshake"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"☑️┇بالفعل تم قفل الانكليزيه بالتقييد")
else
tsX000("lock",msg,"☑️┇تم قفل الانكليزيه بالتقييد")
database:set("lock_en.note:tshake"..msg.chat_id_..bot_id,"ok")
end
end
------------------------------------------------------------------------
if (text == "قفل الروابط بالتقيد") then
local tsX_o = database:get("lock_link.note:tshake"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"☑️┇بالفعل تم قفل الروابط بالتقييد")
else
tsX000("lock",msg,"☑️┇تم قفل الروابط بالتقييد")
database:set("lock_link.note:tshake"..msg.chat_id_..bot_id,"ok")
end
end
------------------------------------------------------------------------
if (text == "قفل المعرف بالتقيد") then
local tsX_o = database:get("lock_username.note:tshake"..msg.chat_id_..bot_id)
if tsX_o then
 tsX000("lock",msg,"☑️┇بالفعل تم قفل المعرف بالتقييد")
else
tsX000("lock",msg,"☑️┇تم قفل المعرف بالتقييد")
database:set("lock_username.note:tshake"..msg.chat_id_..bot_id,"ok")
end
end
------------------------------------------------------------------------
if (text == "قفل بصمه الفيديو بالتقيد") then
local tsX_o = database:get("lock_note.note:tshake"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"☑️┇بالفعل تم قفل بصمه الفيديو بالتقييد")
else
tsX000("lock",msg,"☑️┇تم قفل بصمه الفيديو بالتقييد")
database:set("lock_note.note:tshake"..msg.chat_id_..bot_id,"ok")
end
end
------------------------------------------------------------------------
if (text == "فتح التاك بالتقيد") then
local tsX_o = database:get("lock_tag.note:tshake"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"☑️┇بالفعل تم فتح التاك بالتقييد")
else
tsX000("lock",msg,"☑️┇تم فتح التاك بالتقييد")
database:del("lock_tag.note:tshake"..msg.chat_id_..bot_id,"ok")
end
end
------------------------------------------------------------------------
if (text == "فتح الشارحه بالتقيد") then
local tsX_o = database:get("lock_sarha.note:tshake"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"☑️┇بالفعل تم فتح الشارحه بالتقييد")
else
tsX000("lock",msg,"☑️┇تم فتح الشارحه بالتقييد")
database:del("lock_sarha.note:tshake"..msg.chat_id_..bot_id,"ok")
end
end
------------------------------------------------------------------------
if (text == "فتح المتحركه بالتقيد") then
local tsX_o = database:get("lock_gif.note:tshake"..msg.chat_id_..bot_id)
if not tsX_o then
 tsX000("lock",msg,"☑️┇بالفعل تم فتح المتحركه بالتقييد")
else
tsX000("lock",msg,"☑️┇تم فتح المتحركه بالتقييد")
database:del("lock_gif.note:tshake"..msg.chat_id_..bot_id,"ok")
end
end
------------------------------------------------------------------------
if (text == "فتح الملفات بالتقيد") then
local tsX_o = database:get("lock_files.note:tshake"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"☑️┇بالفعل تم فتح الملفات بالتقييد")
else
tsX000("lock",msg,"☑️┇تم فتح الملفات بالتقييد")
database:del("lock_files.note:tshake"..msg.chat_id_..bot_id,"ok")
end
end
------------------------------------------------------------------------
if (text == "فتح الماركدون بالتقيد") then
local tsX_o = database:get("lock_mark.note:tshake"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"☑️┇بالفعل تم فتح الماركدون بالتقييد")
else
tsX000("lock",msg,"☑️┇تم فتح الماركدون بالتقييد")
database:del("lock_mark.note:tshake"..msg.chat_id_..bot_id,"ok")
end
end
------------------------------------------------------------------------
if (text == "فتح الصور بالتقيد") then
local tsX_o = database:get("lock_photo.note:tshake"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"☑️┇بالفعل تم فتح الصور بالتقييد")
else
tsX000("lock",msg,"☑️┇تم فتح الصور بالتقييد")
database:del("lock_photo.note:tshake"..msg.chat_id_..bot_id,"ok")
end
end
------------------------------------------------------------------------
if (text == "فتح الملصقات بالتقيد") then
local tsX_o = database:get("lock_stecker.note:tshake"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"☑️┇بالفعل تم فتح الملصقات بالتقييد")
else
tsX000("lock",msg,"☑️┇تم فتح الملصقات بالتقييد")
database:del("lock_stecker.note:tshake"..msg.chat_id_..bot_id,"ok")
end
end
------------------------------------------------------------------------
if (text == "فتح الفيديو بالتقيد") then
local tsX_o = database:get("lock_video.note:tshake"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"☑️┇بالفعل تم فتح الفيديو بالتقييد")
else
tsX000("lock",msg,"☑️┇تم فتح الفيديو بالتقييد")
database:del("lock_video.note:tshake"..msg.chat_id_..bot_id,"ok")
end
end
------------------------------------------------------------------------
if (text == "فتح الانلاين بالتقيد") then
local tsX_o = database:get("lock_inline.note:tshake"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"☑️┇بالفعل تم فتح الانلاين بالتقييد")
else
tsX000("lock",msg,"☑️┇تم فتح الانلاين بالتقييد")
database:del("lock_inline.note:tshake"..msg.chat_id_..bot_id,"ok")
end
end
------------------------------------------------------------------------
if (text == "فتح الدردشه بالتقيد") then
local tsX_o = database:get("lock_chat.note:tshake"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"☑️┇بالفعل تم فتح الدردشه بالتقييد")
else
tsX000("lock",msg,"☑️┇تم فتح الدردشه بالتقييد")
database:del("lock_chat.note:tshake"..msg.chat_id_..bot_id,"ok")
end
end
------------------------------------------------------------------------
if (text == "فتح التوجيه بالتقيد") then
local tsX_o = database:get("lock_fwd.note:tshake"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"☑️┇بالفعل تم فتح التوجيه بالتقييد")
else
tsX000("lock",msg,"☑️┇تم فتح التوجيه بالتقييد")
database:del("lock_fwd.note:tshake"..msg.chat_id_..bot_id,"ok")
end
end
------------------------------------------------------------------------
if (text == "فتح الاغاني بالتقيد") then
local tsX_o = database:get("lock_audeo.note:tshake"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"☑️┇بالفعل تم فتح الاغاني بالتقييد")
else
tsX000("lock",msg,"☑️┇تم فتح الاغاني بالتقييد")
database:del("lock_audeo.note:tshake"..msg.chat_id_..bot_id,"ok")
end
end
------------------------------------------------------------------------
if (text == "فتح الصوت بالتقيد") then
local tsX_o = database:get("lock_voice.note:tshake"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"☑️┇بالفعل تم فتح الصوت بالتقييد")
else
tsX000("lock",msg,"☑️┇تم فتح الصوت بالتقييد")
database:del("lock_voice.note:tshake"..msg.chat_id_..bot_id,"ok")
end
end
------------------------------------------------------------------------
if (text == "فتح الجهات بالتقيد") then
local tsX_o = database:get("lock_contact.note:tshake"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"☑️┇بالفعل تم فتح الجهات بالتقييد")
else
tsX000("lock",msg,"☑️┇تم فتح الجهات بالتقييد")
database:del("lock_contact.note:tshake"..msg.chat_id_..bot_id,"ok")
end
end
------------------------------------------------------------------------
if (text == "فتح العربيه بالتقيد") then
local tsX_o = database:get("lock_ar.note:tshake"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"☑️┇بالفعل تم فتح العربيه بالتقييد")
else
tsX000("lock",msg,"☑️┇تم فتح العربيه بالتقييد")
database:del("lock_ar.note:tshake"..msg.chat_id_..bot_id,"ok")
end
end
------------------------------------------------------------------------
if (text == "فتح الانكليزيه بالتقيد") then
local tsX_o = database:get("lock_en.note:tshake"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"☑️┇بالفعل تم فتح الانكليزيه بالتقييد")
else
tsX000("lock",msg,"☑️┇تم فتح الانكليزيه بالتقييد")
database:del("lock_en.note:tshake"..msg.chat_id_..bot_id,"ok")
end
end
------------------------------------------------------------------------
if (text == "فتح المعرف بالتقيد") then
local tsX_o = database:get("lock_username.note:tshake"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"☑️┇بالفعل تم فتح المعرف بالتقييد")
else
tsX000("lock",msg,"☑️┇تم فتح المعرف بالتقييد")
database:del("lock_username.note:tshake"..msg.chat_id_..bot_id,"ok")
end
end
------------------------------------------------------------------------
if (text == "فتح بصمه الفيديو بالتقيد") then
local tsX_o = database:get("lock_note.note:tshake"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"☑️┇بالفعل تم فتح بصمه الفيديو بالتقييد")
else
tsX000("lock",msg,"☑️┇تم فتح بصمه الفيديو بالتقييد")
database:del("lock_note.note:tshake"..msg.chat_id_..bot_id,"ok")
end
end
------------------------------------------------------------------------
if (text == "فتح الروابط بالتقيد") then
local tsX_o = database:get("lock_link.note:tshake"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"☑️┇بالفعل تم فتح الروابط بالتقييد")
else
tsX000("lock",msg,"☑️┇تم فتح الروابط بالتقييد")
database:del("lock_link.note:tshake"..msg.chat_id_..bot_id,"ok")
end
end
------------------------------------------------------------------------
if text == ("اعدادات التقيد") then
if database:get("lock_chat.note:tshake"..msg.chat_id_..bot_id) then
 mute_text = '✔┇'
else
 mute_text = '✖┇'
 end
 ------------
if database:get("lock_photo.note:tshake"..msg.chat_id_..bot_id) then
 mute_photo = '✔┇'
else
 mute_photo = '✖┇'
 end
 ------------
if database:get("lock_video.note:tshake"..msg.chat_id_..bot_id) then
 mute_video = '✔┇'
else
 mute_video = '✖┇'
 end
if database:get("lock_note.note:tshake"..msg.chat_id_..bot_id) then
 mute_note = '✔┇'
else
 mute_note = '✖┇'
 end
 ------------
if database:get("lock_gif.note:tshake"..msg.chat_id_..bot_id) then
 mute_gifs = '✔┇'
else
 mute_gifs = '✖┇'
 end
 ------------
if database:get("lock_audeo.note:tshake"..msg.chat_id_..bot_id) then
 mute_music = '✔┇'
else
 mute_music = '✖┇'
 end
 ------------
if database:get("lock_inline.note:tshake"..msg.chat_id_..bot_id) then
 mute_in = '✔┇'
else
 mute_in = '✖┇'
 end
 ------------
if database:get("lock_voice.note:tshake"..msg.chat_id_..bot_id) then
 mute_voice = '✔┇'
else
 mute_voice = '✖┇'
 end
 ------------
if database:get("lock_link.note:tshake"..msg.chat_id_..bot_id) then
 mute_links = '✔┇'
else
 mute_links = '✖┇'
 end
 ------------
if database:get("lock_files.note:tshake"..msg.chat_id_..bot_id) then
 mute_doc = '✔┇'
else
 mute_doc = '✖┇'
 end
if database:get("lock_mark.note:tshake"..msg.chat_id_..bot_id) then
 mute_mdd = '✔┇'
else
 mute_mdd = '✖┇'
 end
 ------------
if database:get("lock_stecker.note:tshake"..msg.chat_id_..bot_id) then
lock_sticker = '✔┇'
else
lock_sticker = '✖┇'
 end
 ------------
if database:get("lock_tag.note:tshake"..msg.chat_id_..bot_id) then
lock_htag = '✔┇'
else
lock_htag = '✖┇'
 end

if database:get("lock_sarha.note:tshake"..msg.chat_id_..bot_id) then
lock_cmd = '✔┇'
else
lock_cmd = '✖┇'
 end
 ------------
if database:get("lock_username.note:tshake"..msg.chat_id_..bot_id) then
lock_tag = '✔┇'
else
lock_tag = '✖┇'
 end
 ------------
if database:get("lock_contact.note:tshake"..msg.chat_id_..bot_id) then
lock_contact = '✔┇'
else
lock_contact = '✖┇'
 end
 ------------
if database:get("lock_en.note:tshake"..msg.chat_id_..bot_id) then
lock_english = '✔┇'
else
lock_english = '✖┇'
 end
 ------------
if database:get("lock_ar.note:tshake"..msg.chat_id_..bot_id) then
lock_arabic = '✔┇'
else
lock_arabic = '✖┇'
 end
 ------------
if database:get("lock_fwd.note:tshake"..msg.chat_id_..bot_id) then
lock_forward = '✔┇'
else
lock_forward = '✖┇'
 end
local ex = database:ttl( 'tshake:'..bot_id.."charge:"..msg.chat_id_)
if ex == -1 then
exp_dat = 'لا نهائي'
else
exp_dat = math.floor(ex / 86400) + 1
end
 ------------
local TXT = "🗑┇اعدادات المجموعه بالتقييد\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n✔┇~⪼ مفعل\n✖┇~⪼ معطل\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
..mute_links.." الروابط".."\n"
..lock_english.." اللغه الانكليزيه".."\n"
..lock_forward.." اعاده التوجيه".."\n"
..lock_arabic.." اللغه العربيه".."\n"
..lock_htag.." التاكات".."\n"
..lock_tag.." المعرفات".."\n"
..mute_text.." الدردشه".."\n"
..mute_gifs.." الصور المتحركه".."\n"
..mute_voice.." الصوتيات".."\n\n"
..mute_music.." الاغاني".."\n"
..mute_in.." الانلاين".."\n"
..lock_sticker.." الملصقات".."\n"
..lock_contact.." جهات الاتصال".."\n"
..mute_video.." الفيديوهات".."\n"
..lock_cmd.." الشارحه".."\n"
..mute_mdd.." الماركدون".."\n"
..mute_doc.." الملفات".."\n"
..mute_photo.." الصور".."\n"
..mute_note.." بصمه الفيديو".."\n"
.."┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉\n"
..'🔗┇انقضاء البوت: '..exp_dat..' يوم \n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉'
send(msg.chat_id_, msg.id_, 1, TXT, 1, 'md')
end


if text == 'مسح المحظورين' then
database:del('tshake:'..bot_id..'banned:'..msg.chat_id_)
send(msg.chat_id_, msg.id_, 1, '🚷┇ تم مسح المحظورين من البوت  ', 1, 'md')
end
if text == 'مسح البوتات' then
local function cb(extra,result,success)
local bots = result.members_
for i=0 , #bots do
if tonumber(bots[i].user_id_) ~= tonumber(bot_id) then 
chat_kick(msg.chat_id_,bots[i].user_id_)
end
end
end
bot.channel_get_bots(msg.chat_id_,cb)
send(msg.chat_id_, msg.id_, 1, '🗑┇تم مسح جميع البوتات', 1, 'md')
end
if text == 'مسح المميزين' and is_mod(msg) then
database:del('tshake:'..bot_id..'vipgp:'..msg.chat_id_)
send(msg.chat_id_, msg.id_, 1, '🗑┇ تم مسح  قائمة الاعضاء المميزين  ', 1, 'md')
end
if text == 'مسح القوانين' then
database:del('tshake:'..bot_id..'rules'..msg.chat_id_)
send(msg.chat_id_, msg.id_, 1, '🗑┇تم مسح القوانين المحفوظه', 1, 'md')
end
if text == 'مسح الرابط' then
database:del('tshake:'..bot_id..'group:link'..msg.chat_id_)
send(msg.chat_id_, msg.id_, 1, '🗑┇تم مسح الرابط المحفوظ', 1, 'md')
end
if text == 'مسح المكتومين' then
database:del('tshake:'..bot_id..'muted:'..msg.chat_id_)
send(msg.chat_id_, msg.id_, 1, '🗑┇ تم مسح قائمه المكتومين ', 1, 'md')
end



end -- if is_mod(msg) then
------------------------------------------------------------------------
------------------------------------------------------------------------
if text and text:match("^كشف القيود @(.*)$") then
local ap = {string.match(text, "^(كشف القيود) @(.*)$")}
function kewd_by_username(extra, result, success)
if result.id_ then
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
SendText(msg.chat_id_,msg.id_,"*📮┇ هاذا معرف قناة \n*")   
return false 
end      
if database:sismember('tshake:'..bot_id..'gbanned:',result.id_) then
kewd = 'محظور عام'
elseif database:sismember('tshake:'..bot_id..'banned:'..msg.chat_id_,result.id_) then
kewd = 'محظور'
elseif database:sismember('tshake:'..bot_id..'muted:'..msg.chat_id_,result.id_) then
kewd = 'مكتوم'
elseif database:sismember('tshake:'..bot_id..'res'..msg.chat_id_,result.id_) then
kewd = 'مقيد'
else
kewd = ' لا يوجد'
end
texts = "\n⛓ ┇ القيود *("..kewd..")*"
else
texts = ""..result.id_..""
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(ap[2],kewd_by_username)
return false
end
------------------------------------------------------------------------
if text and text:match("^تنزيل الكل @(.*)$") and is_owner(msg) then
local res = {string.match(text, "^(تنزيل الكل) @(.*)$")}
function by_username(extra, result, success)
if result.id_ then
if is_devabass(result.id_) == true then
send(msg.chat_id_, msg.id_, 1, "📮┇ لا تستطيع تنزيل المطور الاساسي", 1, 'md')
return false 
end
if (result and result.type_ and result.type_.ID == "ChannelChatInfo") then
SendText(msg.chat_id_,msg.id_,"*📮┇ هاذا معرف قناة \n*")   
return false 
end      
if redis:sismember('tshake:'..bot_id..'dev',result.id_) then
dev = 'المطور ،' else dev = '' end
if database:sismember('tshake:'..bot_id..'creatorbasic:'..msg.chat_id_, result.id_) then
crr = 'منشئ اساسي ،' else crr = '' end
if database:sismember('tshake:'..bot_id..'creator:'..msg.chat_id_, result.id_) then
cr = 'منشئ ،' else cr = '' end
if database:sismember('tshake:'..bot_id..'owners:'..msg.chat_id_, result.id_) then
own = 'مدير ،' else own = '' end
if database:sismember('tshake:'..bot_id..'mods:'..msg.chat_id_, result.id_) then
mod = 'ادمن ،' else mod = '' end
if database:sismember('tshake:'..bot_id..'vipgp:'..msg.chat_id_, result.id_) then
vip = 'مميز ،' else vip = ''
end
if ck_mod(result.id_,msg.chat_id_) ~= false then
send(msg.chat_id_, msg.id_, 1, "\n🔖┇ تم تنزيل الشخص من الرتب التاليه \n📥┇ { "..dev..''..crr..''..cr..''..own..''..mod..''..vip.." } \n", 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, "\n🚸┇ليس لديه رتب حتى استطيع تنزيله \n", 1, 'md')
end
if RemBot(msg.sender_user_id_,msg.chat_id_) == 'sudo1' then
database:srem('tshake:'..bot_id..'dev', result.id_)
database:del('tshake:'..bot_id..'sudoo'..result.id_..'', 'no')
database:srem('tshake:'..bot_id..'creatorbasic:'..msg.chat_id_,result.id_)
database:srem('tshake:'..bot_id..'creator:'..msg.chat_id_, result.id_)
database:srem('tshake:'..bot_id..'owners:'..msg.chat_id_, result.id_)
database:srem('tshake:'..bot_id..'mods:'..msg.chat_id_, result.id_)
database:srem('tshake:'..bot_id..'vipgp:'..msg.chat_id_, result.id_)
elseif RemBot(msg.sender_user_id_,msg.chat_id_) == 'sudo' then
database:srem('tshake:'..bot_id..'mods:'..msg.chat_id_, result.id_)
database:srem('tshake:'..bot_id..'vipgp:'..msg.chat_id_, result.id_)
database:srem('tshake:'..bot_id..'owners:'..msg.chat_id_, result.id_)
database:srem('tshake:'..bot_id..'creator:'..msg.chat_id_, result.id_)
database:srem('tshake:'..bot_id..'creatorbasic:'..msg.chat_id_,result.id_)
elseif RemBot(msg.sender_user_id_,msg.chat_id_) == 'creato1' then
database:srem('tshake:'..bot_id..'mods:'..msg.chat_id_, result.id_)
database:srem('tshake:'..bot_id..'vipgp:'..msg.chat_id_, result.id_)
database:srem('tshake:'..bot_id..'owners:'..msg.chat_id_, result.id_)
database:srem('tshake:'..bot_id..'creator:'..msg.chat_id_, result.id_)
elseif RemBot(msg.sender_user_id_,msg.chat_id_) == 'creato' then
database:srem('tshake:'..bot_id..'mods:'..msg.chat_id_, result.id_)
database:srem('tshake:'..bot_id..'vipgp:'..msg.chat_id_, result.id_)
database:srem('tshake:'..bot_id..'owners:'..msg.chat_id_, result.id_)
elseif RemBot(msg.sender_user_id_,msg.chat_id_) == 'owner' then
database:srem('tshake:'..bot_id..'mods:'..msg.chat_id_, result.id_)
database:srem('tshake:'..bot_id..'vipgp:'..msg.chat_id_, result.id_)
end
else
texts = '✖️┇خطاء'
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
end
resolve_username(res[2],by_username)
end
if text == ("تنزيل الكل") and msg.reply_to_message_id_ ~= 0 and is_owner(msg) then
function promote_by_reply(extra, result, success)
if is_devabass(result.sender_user_id_) == true then
send(msg.chat_id_, msg.id_, 1, "📮┇ لا تستطيع تنزيل المطور الاساسي", 1, 'md')
return false 
end
if redis:sismember('tshake:'..bot_id..'dev',result.sender_user_id_) then
dev = 'المطور ،' else dev = '' end
if database:sismember('tshake:'..bot_id..'creatorbasic:'..msg.chat_id_, result.sender_user_id_) then
crr = 'منشئ اساسي ،' else crr = '' end
if database:sismember('tshake:'..bot_id..'creator:'..msg.chat_id_, result.sender_user_id_) then
cr = 'منشئ ،' else cr = '' end
if database:sismember('tshake:'..bot_id..'owners:'..msg.chat_id_, result.sender_user_id_) then
own = 'مدير ،' else own = '' end
if database:sismember('tshake:'..bot_id..'mods:'..msg.chat_id_, result.sender_user_id_) then
mod = 'ادمن ،' else mod = '' end
if database:sismember('tshake:'..bot_id..'vipgp:'..msg.chat_id_, result.sender_user_id_) then
vip = 'مميز ،' else vip = ''
end
if ck_mod(result.sender_user_id_,msg.chat_id_) ~= false then
send(msg.chat_id_, msg.id_, 1, "\n🔖┇ تم تنزيل الشخص من الرتب التاليه \n📥┇ { "..dev..''..crr..''..cr..''..own..''..mod..''..vip.." } \n", 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, "\n🚸┇ليس لديه رتب حتى استطيع تنزيله \n", 1, 'md')
end
if RemBot(msg.sender_user_id_,msg.chat_id_) == 'sudo1' then
database:srem('tshake:'..bot_id..'dev', result.sender_user_id_)
database:del('tshake:'..bot_id..'sudoo'..result.sender_user_id_..'', 'no')
database:srem('tshake:'..bot_id..'creatorbasic:'..msg.chat_id_,result.sender_user_id_)
database:srem('tshake:'..bot_id..'creator:'..msg.chat_id_, result.sender_user_id_)
database:srem('tshake:'..bot_id..'owners:'..msg.chat_id_, result.sender_user_id_)
database:srem('tshake:'..bot_id..'mods:'..msg.chat_id_, result.sender_user_id_)
database:srem('tshake:'..bot_id..'vipgp:'..msg.chat_id_, result.sender_user_id_)
elseif RemBot(msg.sender_user_id_,msg.chat_id_) == 'sudo' then
database:srem('tshake:'..bot_id..'mods:'..msg.chat_id_, result.sender_user_id_)
database:srem('tshake:'..bot_id..'vipgp:'..msg.chat_id_, result.sender_user_id_)
database:srem('tshake:'..bot_id..'owners:'..msg.chat_id_, result.sender_user_id_)
database:srem('tshake:'..bot_id..'creator:'..msg.chat_id_, result.sender_user_id_)
database:srem('tshake:'..bot_id..'creatorbasic:'..msg.chat_id_,result.sender_user_id_)
elseif RemBot(msg.sender_user_id_,msg.chat_id_) == 'creato1' then
database:srem('tshake:'..bot_id..'mods:'..msg.chat_id_, result.sender_user_id_)
database:srem('tshake:'..bot_id..'vipgp:'..msg.chat_id_, result.sender_user_id_)
database:srem('tshake:'..bot_id..'owners:'..msg.chat_id_, result.sender_user_id_)
database:srem('tshake:'..bot_id..'creator:'..msg.chat_id_, result.sender_user_id_)
elseif RemBot(msg.sender_user_id_,msg.chat_id_) == 'creato' then
database:srem('tshake:'..bot_id..'mods:'..msg.chat_id_, result.sender_user_id_)
database:srem('tshake:'..bot_id..'vipgp:'..msg.chat_id_, result.sender_user_id_)
database:srem('tshake:'..bot_id..'owners:'..msg.chat_id_, result.sender_user_id_)
elseif RemBot(msg.sender_user_id_,msg.chat_id_) == 'owner' then
database:srem('tshake:'..bot_id..'mods:'..msg.chat_id_, result.sender_user_id_)
database:srem('tshake:'..bot_id..'vipgp:'..msg.chat_id_, result.sender_user_id_)
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,promote_by_reply)
end
------------------------------------------------------------------------
if (text and text == "ابلاغ" and msg.reply_to_message_id_ ~= 0 and (not database:get("tshake:mute:deleta:msg:"..bot_id..msg.chat_id_))) then 
b = database:get("tshake:user:deleteL:msg:"..msg.chat_id_..bot_id..msg.sender_user_id_)
if b and b == os.date("%x") then 
send(msg.chat_id_, msg.id_, 1, "👤┇ لا يمكنك الابلاغ اكثر من مره في اليوم", 1, 'html')
else
database:set("tshake:user:deleteL:msg:"..msg.chat_id_..bot_id..msg.sender_user_id_,os.date("%x"))
y = database:get("tsahke:fel:o:me:"..bot_id..msg.chat_id_) or 10
x = database:get("tsahke:fel:msg:me:"..bot_id..msg.chat_id_..msg.reply_to_message_id_) or 0
send(msg.chat_id_, msg.reply_to_message_id_, 1, "⚠┇تم الابلاغ على الرساله\n⚠┇تبقى {"..(y-(x+1)).."} حتى يتم حذف الرساله", 1, 'html')
database:incr("tsahke:fel:msg:me:"..bot_id..msg.chat_id_..msg.reply_to_message_id_)
if (database:get("tsahke:fel:msg:me:"..bot_id..msg.chat_id_..msg.reply_to_message_id_)) then 
x = database:get("tsahke:fel:msg:me:"..bot_id..msg.chat_id_..msg.reply_to_message_id_)
y = database:get("tsahke:fel:o:me:"..bot_id..msg.chat_id_) or 10
if tonumber(x) >= tonumber(y) then 
send(msg.chat_id_, 0, 1, "⚠┇تم حذف الرساله", 1, 'html')
delete_msg(msg.chat_id_, {[0] = msg.reply_to_message_id_})
end
end
end 
end
------------------------------------------------------------------------
if (text and text == "رتبتي") then
if msg.sender_user_id_ == tonumber(sudo_add) then
t = 'المطور الاساسي'
elseif is_sudo(msg) then
t = database:get("tshake:name_sudo"..bot_id..msg.chat_id_)  or 'مطور البوت '
elseif is_creatorbasic(msg) then
t = database:get("tshake:name_cre"..bot_id..msg.chat_id_) or 'منشئ اساسي '
elseif (database:get("tshake:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_) and database:get("tshake:all_sl:"..database:get("tshake:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_) ..bot_id..msg.chat_id_)) then 
t = database:get("tshake:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_)
elseif is_creator(msg) then
t = database:get("tshake:name_cre"..bot_id..msg.chat_id_) or 'منشئ  الكروب '
elseif (database:get("tshake:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_) and database:get("tshake:all_sl:"..database:get("tshake:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_) ..bot_id..msg.chat_id_)) then 
t = database:get("tshake:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_)
elseif is_owner(msg) then
t = database:get("tshake:name_own"..bot_id..msg.chat_id_) or 'مدير الكروب '
elseif is_mod(msg) then
t = database:get("tshake:name_adm"..bot_id..msg.chat_id_) or ' ادمن الكروب خالي '
elseif is_vip(msg) then
t = database:get("tshake:name_vipp"..bot_id..msg.chat_id_) or 'عضو مميز '
else
t = database:get("tshake:name_nk"..bot_id..msg.chat_id_) or 'عضو محد يحترمك' 
end
send(msg.chat_id_, msg.id_, 1,"👤┇رتبتك >> "..t.."", 1, 'md')
end
------------------------------------------------------------------------
if text and text:match("^ايدي$") and msg.reply_to_message_id_ ~= 0 then
function id_by_reply(extra, result, success)
if not database:get('tshake:'..bot_id..'id:mute'..msg.chat_id_) then 
local tahna = (database:get('tshake:'..bot_id..'nummsg'..msg.chat_id_..result.sender_user_id_) or 0)
if tonumber((database:get('tshake:'..bot_id..'add:numall'..msg.chat_id_..result.sender_user_id_) or 0)) == 0 then
nko = '0'
else
nko = (database:get('tshake:'..bot_id..'add:numall'..msg.chat_id_..result.sender_user_id_))
end
local msgs = ((database:get('tshake:'..bot_id..'user:msgs'..msg.chat_id_..':'..result.sender_user_id_) or 0) + tahna)
local edit = database:get('tshake:'..bot_id..'user:editmsg'..msg.chat_id_..':'..result.sender_user_id_) or 0
local msg2 = msg
local user_msgs = msgs
local ikeko_text = "غير متفاعل"
if user_msgs then 
if tonumber(user_msgs) < 50 then 
ikeko_text = "غير متفاعل"
elseif tonumber(user_msgs) < 100 then 
ikeko_text = "آستمر بطل"
elseif tonumber(user_msgs) < 1000 then 
ikeko_text = "متفآعل "
elseif tonumber(user_msgs) < 2000 then 
ikeko_text = "عضو نشط"
elseif tonumber(user_msgs) < 3000 then 
ikeko_text = "اقوئ تفاعل"
elseif tonumber(user_msgs) < 4000 then 
ikeko_text = "عضو متفاعل قوي"
elseif tonumber(user_msgs) < 5000 then 
ikeko_text = "جيد بتفاعل"
elseif tonumber(user_msgs) > 5000 then 
ikeko_text = "متفاعل كلش"
end
keko = database:smembers('keko:all:pppp:tt:'..bot_id) or 0
if (keko or keko[1]) then 
for i=1, #keko do
local tttee = database:get("keko:set:text:p"..bot_id..keko[i])
if tonumber(user_msgs) >= tonumber(keko[i]) then 
ikeko_text = tttee
end
end
end
end
msg2.sender_user_id_ = result.sender_user_id_
if msg.sender_user_id_ == tonumber(sudo_add) then
tshake_oop = 'المطور الاساسي'
elseif is_sudo(msg2) then
tshake_oop = database:get("tshake:name_sudo"..bot_id..msg.chat_id_)  or 'مطور البوت '
elseif is_creatorbasic(msg) then
tshake_oop = database:get("tshake:name_cre"..bot_id..msg.chat_id_) or 'منشئ اساسي '
elseif (database:get("tshake:name_user:"..bot_id..msg.chat_id_..result.id_) and database:get("tshake:all_sl:"..database:get("tshake:name_user:"..bot_id..msg.chat_id_..result.id_) ..bot_id..msg.chat_id_)) then 
tshake_oop = database:get("tshake:name_user:"..bot_id..msg.chat_id_..result.id_)
elseif is_creator(msg) then
tshake_oop = database:get("tshake:name_cre"..bot_id..msg.chat_id_) or 'منشئ الكروب '
elseif (database:get("tshake:name_user:"..bot_id..msg.chat_id_..result.sender_user_id_) and database:get("tshake:all_sl:"..database:get("tshake:name_user:"..bot_id..msg.chat_id_..result.sender_user_id_) ..bot_id..msg.chat_id_)) then 
tshake_oop = database:get("tshake:name_user:"..bot_id..msg.chat_id_..result.sender_user_id_)
elseif is_owner(msg2) then
tshake_oop = database:get("tshake:name_own"..bot_id..msg.chat_id_) or 'مدير الكروب '
elseif is_mod(msg2) then
tshake_oop = database:get("tshake:name_adm"..bot_id..msg.chat_id_) or 'ادمن الكروب'
elseif is_vip(msg2) then
tshake_oop = database:get("tshake:name_vipp"..bot_id..msg.chat_id_) or ' عضو مميز '
else
tshake_oop = database:get("tshake:name_nk"..bot_id..msg.chat_id_) or 'عضو فقط ' 
end
send(msg.chat_id_, msg.id_, 1,"🎟 ┇ ايدي • `("..result.sender_user_id_..")`\n🗳 ┇ موقعه • ("..tshake_oop..")\n💌 ┇ عدد رسائل •`("..msgs..")`\n📧┇عدد السحكات • `("..edit..")`\n📩 ┇ تفاعلك • `("..ikeko_text..")`\n📥 ┇ مجوهرآتك •*("..nko..")*", 1, 'md')
else
send(msg.chat_id_, msg.id_, 1,"`"..result.sender_user_id_.."`", 1, 'md')
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,id_by_reply)
end  
if text and text:match("^ايدي @(.*)$") then
local ap = {string.match(text, "^(ايدي) @(.*)$")}
function id_by_username(extra, result, success)
if result.id_ then
if not database:get('tshake:'..bot_id..'id:mute'..msg.chat_id_) then 
local tahna = (database:get('tshake:'..bot_id..'nummsg'..msg.chat_id_..result.id_) or 0)
if tonumber((database:get('tshake:'..bot_id..'add:numall'..msg.chat_id_..result.id_) or 0)) == 0 then
nko = '0'
else
nko = (database:get('tshake:'..bot_id..'add:numall'..msg.chat_id_..result.id_))
end
local msgs = ((database:get('tshake:'..bot_id..'user:msgs'..msg.chat_id_..':'..result.id_) or 0) + tahna)
local edit = database:get('tshake:'..bot_id..'user:editmsg'..msg.chat_id_..':'..result.id_) or 0
local msg2 = msg
msg2.sender_user_id_ = result.id_
local user_msgs = ((database:get('tshake:'..bot_id..'user:msgs'..msg.chat_id_..':'..result.id_) or 0) + tahna)
local ikeko_text = "غير متفاعل"
if user_msgs then 
if tonumber(user_msgs) < 50 then 
ikeko_text = "غير متفاعل"
elseif tonumber(user_msgs) < 100 then 
ikeko_text = "آستمر بطل"
elseif tonumber(user_msgs) < 1000 then 
ikeko_text = "متفآعل "
elseif tonumber(user_msgs) < 2000 then 
ikeko_text = "عضو نشط"
elseif tonumber(user_msgs) < 3000 then 
ikeko_text = "اقوئ تفاعل"
elseif tonumber(user_msgs) < 4000 then 
ikeko_text = "عضو متفاعل قوي"
elseif tonumber(user_msgs) < 5000 then 
ikeko_text = "جيد بتفاعل"
elseif tonumber(user_msgs) > 5000 then 
ikeko_text = "متفاعل كلش"
end
keko = database:smembers('keko:all:pppp:tt:'..bot_id) or 0
if (keko or keko[1]) then 
for i=1, #keko do
local tttee = database:get("keko:set:text:p"..bot_id..keko[i])
if tonumber(user_msgs) >= tonumber(keko[i]) then 
ikeko_text = tttee
end
end
end
end
if msg.sender_user_id_ == tonumber(sudo_add) then
tshake_oop = 'المطور الاساسي'
elseif is_sudo(msg2) then
tshake_oop = database:get("tshake:name_sudo"..bot_id..msg.chat_id_)  or 'مطور البوت '
elseif is_creatorbasic(msg) then
tshake_oop = database:get("tshake:name_cre"..bot_id..msg.chat_id_) or 'منشئ اساسي '
elseif (database:get("tshake:name_user:"..bot_id..msg.chat_id_..result.id_) and database:get("tshake:all_sl:"..database:get("tshake:name_user:"..bot_id..msg.chat_id_..result.id_) ..bot_id..msg.chat_id_)) then 
tshake_oop = database:get("tshake:name_user:"..bot_id..msg.chat_id_..result.id_)
elseif is_creator(msg) then
tshake_oop = database:get("tshake:name_cre"..bot_id..msg.chat_id_) or 'منشئ الكروب '
elseif (database:get("tshake:name_user:"..bot_id..msg.chat_id_..result.id_) and database:get("tshake:all_sl:"..database:get("tshake:name_user:"..bot_id..msg.chat_id_..result.id_) ..bot_id..msg.chat_id_)) then 
tshake_oop = database:get("tshake:name_user:"..bot_id..msg.chat_id_..result.id_)
elseif is_owner(msg2) then
tshake_oop = database:get("tshake:name_own"..bot_id..msg.chat_id_) or 'مدير الكروب '
elseif is_mod(msg2) then
tshake_oop = database:get("tshake:name_adm"..bot_id..msg.chat_id_) or 'ادمن الكروب'
elseif is_vip(msg2) then
tshake_oop = database:get("tshake:name_vipp"..bot_id..msg.chat_id_) or ' عضو مميز '
else
tshake_oop = database:get("tshake:name_nk"..bot_id..msg.chat_id_) or 'عضو فقط ' 
end
texts = "🎟 ┇ ايدي • `("..result.id_..")`\n🗳 ┇ موقعه •("..tshake_oop..")\n💌 ┇ عدد رسائل •`("..msgs..")`\n📔 ┇ عدد السحكات • `("..edit..")`\n📩 ┇ تفاعلك •`("..ikeko_text..")`\n📥 ┇ مجوهرآتك •*("..nko..")*"
else
texts = "`"..result.id_.."`"
end
else
texts = '✖┇خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(ap[2],id_by_username)
end  
------------------------------------------------------------------------
if text == ("الرابط") then
if not database:get("tshake:mute:link:gr:"..bot_id..msg.chat_id_) then 
function dl_cb222( t1,t2 )
if (database:get('tshake:'..bot_id.."group:link"..msg.chat_id_) and database:get('tshake:'..bot_id.."group:link"..msg.chat_id_) ~= "Error") then 
send(msg.chat_id_, msg.id_, 1, '🔘┇ *Group Link* \n['..database:get('tshake:'..bot_id.."group:link"..msg.chat_id_)..']', 1, "md")
elseif t2.invite_link_ ~= false then 
send(msg.chat_id_, msg.id_, 1, '🔘┇ *Group Link* \n['..(t2.invite_link_ or "Error")..']', 1, "md")
else
local getlink = 'https://api.telegram.org/bot'..token..'/exportChatInviteLink?chat_id='..msg.chat_id_
local req = https.request(getlink)
local link = json:decode(req)
if link.ok == true then 
send(msg.chat_id_, msg.id_, 1, '🔘┇ *Group Link* \n['..(link.result or "Error")..']', 1, "md")
database:set('tshake:'..bot_id.."group:link"..msg.chat_id_,link.result)
else 
send(msg.chat_id_, msg.id_, 1, '⚠️┇لا يمكني الوصل الى الرابط عليك منحي صلاحيه {دعوه المستخدمين من خلال الرابط}', 1, "html")
end
end
end
tdcli_function ({
ID = "GetChannelFull",
channel_id_ = getChatId(msg.chat_id_).ID
}, dl_cb222, nil)
else 
send(msg.chat_id_, msg.id_, 1, '🖲┇جلب الرابط معطل', 1, "html") 
end
end
-----------------------------------------------------------
if (text == ("رسائلي") or text == ("^msg$")) and msg.reply_to_message_id_ == 0  then
local user_msgs = database:get('tshake:'..bot_id..'user:msgs'..msg.chat_id_..':'..msg.sender_user_id_)
local tahna = (database:get('tshake:'..bot_id..'nummsg'..msg.chat_id_..msg.sender_user_id_) or 0)
if not database:get('tshake:'..bot_id..'id:mute'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "💌 ┇ رسائلك  *("..(user_msgs + tahna)..")*", 1, 'md')
else
end
end
------------------------------------------------------------------------
if text == ("جهاتي") then
add = (tonumber(database:get('tshake:'..bot_id..'user:add'..msg.chat_id_..':'..msg.sender_user_id_)) or 0)
send(msg.chat_id_, msg.id_, 1, "📨┇عدد اضافه جهاتك ~⪼ *{"..add.."}*\n📨┇سيتم حذف العدد بعد هذه الرساله", 1, 'md')
database:del('tshake:'..bot_id..'user:add'..msg.chat_id_..':'..msg.sender_user_id_)
end
if text == ("عدد السحكات") or text == ("سحكاتي") then
local edit = database:get('tshake:'..bot_id..'user:editmsg'..msg.chat_id_..':'..msg.sender_user_id_) or 0
send(msg.chat_id_, msg.id_, 1, "📮┇ سحكاتك   *("..edit..")*", 1, 'md')
end
if text == 'حذف سحكاتي' then 
database:del('tshake:'..bot_id..'user:editmsg'..msg.chat_id_..':'..msg.sender_user_id_)
local tshake = '🗑 ┇ تم حذف سحكاتك '
send(msg.chat_id_, msg.id_, 1, tshake, 1, 'md')
end
------------------------------------------------------------------------
if text == ("اطردني") then
if not database:get('tshake:'..bot_id..'kickme:mute'..msg.chat_id_) then
redis:set('tshake:'..bot_id..'kickyess'..msg.sender_user_id_..'', 'kickyes')
redis:set('tshake:'..bot_id..'kicknoo'..msg.sender_user_id_..'', 'kickno')
send(msg.chat_id_, msg.id_, 1, '🚯┇ ارسل : نعم ، ليتم طردك  \n‼️┇ ارسل ؛ لا ، لالغاء الامر  ', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '🚳┇ امر اطردني معطل ', 1, 'md')
end
end
local yess = redis:get('tshake:'..bot_id..'kickyess'..msg.sender_user_id_..'')
if yess == 'kickyes' then
if text and text:match("^نعم$") then
if is_vip(msg) then
send(msg.chat_id_, msg.id_, 1, '🙋🏻‍♂️┇ لا تستطيع طرد (مدراء، ادمنية،مميزين)البوت   ', 1, 'md')
else
local yess = redis:get('tshake:'..bot_id..'kickyess'..msg.sender_user_id_..'')
if yess == 'kickyes' then
chat_kick(msg.chat_id_, msg.sender_user_id_)
redis:del('tshake:'..bot_id..'kickyess'..msg.sender_user_id_..'', 'kickyes')
redis:del('tshake:'..bot_id..'kicknoo'..msg.sender_user_id_..'', 'kickno')
send(msg.chat_id_, msg.id_, 1, '🕺🏿┇ لقد تم طردك   ', 1, 'md')
end
end
end
if text and text:match("^لا$") then
local noo = redis:get('tshake:'..bot_id..'kicknoo'..msg.sender_user_id_..'')
if noo == 'kickno' then
redis:del('tshake:'..bot_id..'kickyess'..msg.sender_user_id_..'', 'kickyes')
redis:del('tshake:'..bot_id..'kicknoo'..msg.sender_user_id_..'', 'kickno')
send(msg.chat_id_, msg.id_, 1, '🙋🏻‍♂️┇ تم الغاء الامر  ', 1, 'md')
end
end
end
------------------------------------------------------------------------
if (text and text == (redis:get('tshake:'..bot_id..'name_bot') or 'تشاكي'))then
name_bot = (redis:get('tshake:'..bot_id..'name_bot') or 'تشاكي')
local namebot = {
"عمري فداك "..name_bot.. " كول حب ",
"كول حبيبي ؟ اني "..name_bot,
'ها حبي وياك مكتب ئلسيد .',
'الو الو رد مخنوك',
'ها يحلو كول',
'عمري الحلو',
'صاعد اتصال ويا الحب دقيقة وجيك 😘💘',
'مشغول حالياً 🌚🌸',
'لابسك لتلح',
" هايروحي؟ "..name_bot,
}
name = math.random(#namebot)
send(msg.chat_id_, msg.id_, 1, namebot[name] , 1, 'md') 
return false end
--------------------------------------
if text == ("[Dd][Ee][Vv]")or text == ("مطور بوت") or text == ("مطورين") or text == ("مطور البوت") or text == ("مطور") or text == ("المطور") and msg.reply_to_message_id_ == 0 then
local text_sudo = redis:get('tshake:'..bot_id..'text_sudo')
local nkeko = redis:get('tshake:'..bot_id..'nmkeko')
local nakeko = redis:get('tshake:'..bot_id..'nakeko')
if text_sudo then
send(msg.chat_id_, msg.id_, 1, text_sudo, 1, 'md') 
else
send(msg.chat_id_, msg.id_, 1, "🗃┇ عذراً لم يتم وضع كليشة المطور \n اذا كنت المطور الاساسي للبوت\n قم بارسال (تغير امر المطور بالكليشه) لوضع الكليشة 🎚", 1, 'md') 
end
end
------------------------------------------------------------------------
if text == ("القوانين") then
local rules = database:get('tshake:'..bot_id..'rules'..msg.chat_id_)
if rules then
send(msg.chat_id_, msg.id_, 1, '⚜┇قوانين المجموعه هي\n'..rules, 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '⚜┇لم يتم حفظ قوانين للمجموعه', 1, 'md')
end
end  
------------------------------------------------------------------------
if text == ("ايدي المجموعه") then
send(msg.chat_id_, msg.id_, 1, "*"..msg.chat_id_.."*", 1, 'md')
end
------------------------------------------------------------------------
if (text == ("ايدي") or text == ("id") ) and msg.reply_to_message_id_ == 0 then
if not database:sismember('tshake:'..bot_id..'spam:id'..msg.sender_user_id_..':'..msg.chat_id_,'ايدي') then
database:sadd('tshake:'..bot_id..'spam:id'..msg.sender_user_id_..':'..msg.chat_id_,'ايدي')
local keko_info = nil
function keko333(extra,result,success)
keko_info = '@'..(result.username_ or 'لا يوجد')..''
local function getpro(extra, result, success)
local all_photo_tshake = result.total_count_ 
local tahna = (database:get('tshake:'..bot_id..'nummsg'..msg.chat_id_..msg.sender_user_id_) or 0)
if tonumber((database:get('tshake:'..bot_id..'add:numall'..msg.chat_id_..msg.sender_user_id_) or 0)) == 0 then
nko = '0'
else
nko = (database:get('tshake:'..bot_id..'add:numall'..msg.chat_id_..msg.sender_user_id_))
end
local user_msgs = ((database:get('tshake:'..bot_id..'user:msgs'..msg.chat_id_..':'..msg.sender_user_id_) or 0) + tahna)
local ikeko_text = "غير متفاعل"
if user_msgs then 
if tonumber(user_msgs) < 50 then 
ikeko_text = "غير متفاعل"
elseif tonumber(user_msgs) < 100 then 
ikeko_text = "آستمر بطل"
elseif tonumber(user_msgs) < 1000 then 
ikeko_text = "متفآعل "
elseif tonumber(user_msgs) < 2000 then 
ikeko_text = "عضو نشط"
elseif tonumber(user_msgs) < 3000 then 
ikeko_text = "اقوئ تفاعل"
elseif tonumber(user_msgs) < 4000 then 
ikeko_text = "عضو متفاعل قوي"
elseif tonumber(user_msgs) < 5000 then 
ikeko_text = "جيد بتفاعل"
elseif tonumber(user_msgs) > 5000 then 
ikeko_text = "متفاعل كلش"
end
keko = database:smembers('keko:all:pppp:tt:'..bot_id) or 0
if (keko or keko[1] and end032) then 
for i=1, #keko do
local tttee = database:get("keko:set:text:p"..bot_id..keko[i])
if tonumber(user_msgs) >= tonumber(keko[i]) then 
ikeko_text = tttee
end
end
end
end
local edit = database:get('tshake:'..bot_id..'user:editmsg'..msg.chat_id_..':'..msg.sender_user_id_) or 0
if result.photos_[0] then
if msg.sender_user_id_ == tonumber(sudo_add) then
t = 'المطور الاساسي 👨🏻‍🔧'
elseif is_sudo(msg) then
t = database:get("tshake:name_sudo"..bot_id..msg.chat_id_)  or 'مطور البوت 👨🏻‍💻'
elseif is_creatorbasic(msg) then
t =  database:get("tshake:name_cre"..bot_id..msg.chat_id_) or 'منشئ اساسي 👨🏻‍🚀'
elseif (database:get("tshake:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_) and database:get("tshake:all_sl:"..database:get("tshake:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_) ..bot_id..msg.chat_id_)) then 
t = database:get("tshake:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_)
elseif is_creator(msg) then
t =  database:get("tshake:name_cre"..bot_id..msg.chat_id_) or 'منشئ الكروب 👨🏻‍✈️'
elseif (database:get("tshake:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_) and database:get("tshake:all_sl:"..database:get("tshake:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_) ..bot_id..msg.chat_id_)) then 
t = database:get("tshake:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_)
elseif is_owner(msg) then
t = database:get("tshake:name_own"..bot_id..msg.chat_id_) or 'مدير الكروب 🏻'   
elseif is_mod(msg) then
t = database:get("tshake:name_adm"..bot_id..msg.chat_id_) or 'ادمن الكروب👩🏿‍🚒'  
elseif is_vip(msg) then
t = database:get("tshake:name_vipp"..bot_id..msg.chat_id_) or ' عضو مميز 🧙🏻‍♂'
else
t = database:get("tshake:name_nk"..bot_id..msg.chat_id_) or 'عضو فقط 👶🏻' 
end
if not database:get('tshake:'..bot_id..'id:mute'..msg.chat_id_) then
if not database:get('tshake:'..bot_id..'id:photo'..msg.chat_id_) then
if not database:get("tshake:gr:id:text:"..bot_id..msg.chat_id_) then 
local keko_text = {
'صورتك فدشي 😘😔❤️  ',
"صارلك شكد مخليه ",
"وفالله 😔💘",
"كشخه برب 😉💘",
"دغيره شبي هذ 😒",
"عمري الحلوين 🙈💘",
}
keko3 = math.random(#keko_text)
sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, result.photos_[0].sizes_[1].photo_.persistent_id_,"🎥┇ "..keko_text[keko3].."\n🎟┇ ايديك • "..msg.sender_user_id_.."\n🎫┇ يوزرك • "..keko_info.."\n🛰┇ موقعك • "..t.."\n📖┇ رسائلك •("..user_msgs..")\n🗃┇ سحكاتك •("..edit..")\n📓┇ تفاعلك • ("..ikeko_text..")\n🤹🏻‍♂️┇ مجوهراتك • ("..nko..")\nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ",msg.id_,msg.id_.."")
else 
local tshake_new_text = database:get("tshake:gr:id:text:"..bot_id..msg.chat_id_)
local tshake_new_text = tshake_new_text:gsub('#username',(keko_info or 'لا يوجد'))
local tshake_new_text = tshake_new_text:gsub('#id',(msg.sender_user_id_ or 'لا يوجد'))
local tshake_new_text = tshake_new_text:gsub('#edit',(edit or 'لا يوجد'))
local tshake_new_text = tshake_new_text:gsub('#msgs',(user_msgs or 'لا يوجد'))
local tshake_new_text = tshake_new_text:gsub('#stast',(t or 'لا يوجد'))
local tshake_new_text = tshake_new_text:gsub('#auto',(ikeko_text or 'لا يوجد'))
local tshake_new_text = tshake_new_text:gsub('#photos',(all_photo_tshake or 'لا يوجد'))
local tshake_new_text = tshake_new_text:gsub('#game',(nko or 'لا يوجد'))
sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, result.photos_[0].sizes_[1].photo_.persistent_id_,tshake_new_text,msg.id_,msg.id_.."")
end
else
if msg.sender_user_id_ == tonumber(sudo_add) then
t = 'المطور الاساسي 👨🏻‍🔧'
elseif is_sudo(msg) then
t = database:get("tshake:name_sudo"..bot_id..msg.chat_id_)  or 'مطور البوت 👨🏻‍💻'
elseif is_creatorbasic(msg) then
t = database:get("tshake:name_cre"..bot_id..msg.chat_id_) or 'منشئ اساسي 👨🏻‍🚀'
elseif (database:get("tshake:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_) and database:get("tshake:all_sl:"..database:get("tshake:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_) ..bot_id..msg.chat_id_)) then 
t = database:get("tshake:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_)
elseif is_creator(msg) then
t = database:get("tshake:name_cre"..bot_id..msg.chat_id_) or 'منشئ الكروب 👨🏻‍✈️'
elseif (database:get("tshake:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_) and database:get("tshake:all_sl:"..database:get("tshake:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_) ..bot_id..msg.chat_id_)) then 
t = database:get("tshake:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_)
elseif is_owner(msg) then
t = database:get("tshake:name_own"..bot_id..msg.chat_id_) or 'مدير الكروب 🤵🏻'
elseif is_mod(msg) then
t = database:get("tshake:name_adm"..bot_id..msg.chat_id_) or 'ادمن الكروب👩🏿‍🚒'
elseif is_vip(msg) then
t = database:get("tshake:name_vipp"..bot_id..msg.chat_id_) or ' عضو مميز 🧙🏻‍♂'
else
t = database:get("tshake:name_nk"..bot_id..msg.chat_id_) or 'عضو فقط 👶🏻' 
end
if not database:get("tshake:gr:id:text:"..bot_id..msg.chat_id_) then 
send(msg.chat_id_, msg.id_, 1, "🎟┇ ايديك • ("..msg.sender_user_id_..")\n🎫┇ يوزرك • "..keko_info.."\n📌┇ موقعك • "..t.."\n📖┇ رسائلك • ("..user_msgs..")\n🗃┇ سحكاتك • ("..edit..")\n📓┇ تفاعلك • "..ikeko_text.."\n🤹🏻‍♂️┇ مجوهراتك •  ("..nko..")\nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ ", 1, 'html')
else 
local tshake_new_text = database:get("tshake:gr:id:text:"..bot_id..msg.chat_id_)
local tshake_new_text = tshake_new_text:gsub('#username',(keko_info or 'لا يوجد'))
local tshake_new_text = tshake_new_text:gsub('#id',(msg.sender_user_id_ or 'لا يوجد'))
local tshake_new_text = tshake_new_text:gsub('#edit',(edit or 'لا يوجد'))
local tshake_new_text = tshake_new_text:gsub('#msgs',(user_msgs or 'لا يوجد'))
local tshake_new_text = tshake_new_text:gsub('#stast',(t or 'لا يوجد'))   
local tshake_new_text = tshake_new_text:gsub('#auto',(ikeko_text or 'لا يوجد'))
local tshake_new_text = tshake_new_text:gsub('#photos',(all_photo_tshake or 'لا يوجد'))
local tshake_new_text = tshake_new_text:gsub('#game',(nko or 'لا يوجد'))
send(msg.chat_id_, msg.id_, 1, tshake_new_text, 1, 'html')
end   
end
else
end
else
if msg.sender_user_id_ == tonumber(sudo_add) then
t = 'المطور الاساسي 👨🏻‍🔧'
elseif is_sudo(msg) then
t = database:get("tshake:name_sudo"..bot_id..msg.chat_id_)  or 'مطور البوت 👨🏻‍💻'
elseif is_creatorbasic(msg) then
t = database:get("tshake:name_cre"..bot_id..msg.chat_id_) or 'منشئ اساسي 👨🏻‍🚀'
elseif (database:get("tshake:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_) and database:get("tshake:all_sl:"..database:get("tshake:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_) ..bot_id..msg.chat_id_)) then 
t = database:get("tshake:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_)
elseif is_creator(msg) then
t = database:get("tshake:name_cre"..bot_id..msg.chat_id_) or 'منشئ الكروب 👨🏻‍✈️'
elseif (database:get("tshake:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_) and database:get("tshake:all_sl:"..database:get("tshake:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_) ..bot_id..msg.chat_id_)) then 
t = database:get("tshake:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_)
elseif is_owner(msg) then
t = database:get("tshake:name_own"..bot_id..msg.chat_id_) or 'مدير الكروب 🤵🏻'
elseif is_mod(msg) then
t = database:get("tshake:name_adm"..bot_id..msg.chat_id_) or 'ادمن الكروب👩🏿‍🏿‍'
elseif is_vip(msg) then
t = database:get("tshake:name_vipp"..bot_id..msg.chat_id_) or ' عضو مميز 🧙🏻‍♂'
else
t = database:get("tshake:name_nk"..bot_id..msg.chat_id_) or 'عضو فقط 👶🏻' 
end
if not database:get('tshake:'..bot_id..'id:mute'..msg.chat_id_) then
if not database:get('tshake:'..bot_id..'id:photo'..msg.chat_id_) then
if not database:get("tshake:gr:id:text:"..bot_id..msg.chat_id_) then 
send(msg.chat_id_, msg.id_, 1,"🎥┇ انت لا تملك صوره لحسابك !\n🎟┇ ايديك • "..msg.sender_user_id_.."\n🎫┇ يوزرك • "..keko_info.."\n🛰┇ موقعك •   "..t.."\n📖┇ رسائلك •  ("..user_msgs..")\n🗃┇ سحكاتك • ("..edit..")\n📓┇ تفاعلك • "..ikeko_text.."\n🤹🏻‍♂️┇ مجوهراتك • ("..nko..")\nꔹ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ꔹ", 1, 'html')
else 
local tshake_new_text = database:get("tshake:gr:id:text:"..bot_id..msg.chat_id_)
local tshake_new_text = tshake_new_text:gsub('#username',(keko_info or 'لا يوجد'))
local tshake_new_text = tshake_new_text:gsub('#id',(msg.sender_user_id_ or 'لا يوجد'))
local tshake_new_text = tshake_new_text:gsub('#edit',(edit or 'لا يوجد'))
local tshake_new_text = tshake_new_text:gsub('#msgs',(user_msgs or 'لا يوجد'))
local tshake_new_text = tshake_new_text:gsub('#stast',(t or 'لا يوجد'))   
local tshake_new_text = tshake_new_text:gsub('#auto',(ikeko_text or 'لا يوجد'))
local tshake_new_text = tshake_new_text:gsub('#photos',(all_photo_tshake or 'لا يوجد'))
local tshake_new_text = tshake_new_text:gsub('#game',(nko or 'لا يوجد'))
send(msg.chat_id_, msg.id_, 1, tshake_new_text, 1, 'html')
end
else
if msg.sender_user_id_ == tonumber(sudo_add) then
t = 'المطور الاساسي 👨🏻‍🔧'
elseif is_sudo(msg) then
t = database:get("tshake:name_sudo"..bot_id..msg.chat_id_)  or 'مطور البوت 👨🏻‍💻'
elseif is_creatorbasic(msg) then
t = database:get("tshake:name_cre"..bot_id..msg.chat_id_) or 'منشئ اساسي 👨🏻‍🚀'
elseif (database:get("tshake:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_) and database:get("tshake:all_sl:"..database:get("tshake:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_) ..bot_id..msg.chat_id_)) then 
t = database:get("tshake:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_)
elseif is_creator(msg) then
t = database:get("tshake:name_cre"..bot_id..msg.chat_id_) or 'منشئ الكروب 🏻‍✈️'
elseif (database:get("tshake:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_) and database:get("tshake:all_sl:"..database:get("tshake:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_) ..bot_id..msg.chat_id_)) then 
t = database:get("tshake:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_)
elseif is_owner(msg) then
t = database:get("tshake:name_own"..bot_id..msg.chat_id_) or 'مدير الكروب 🤵🏻'
elseif is_mod(msg) then
t = database:get("tshake:name_adm"..bot_id..msg.chat_id_) or 'ادمن الكروب👩🏿‍🚒'
elseif is_vip(msg) then
t = database:get("tshake:name_vipp"..bot_id..msg.chat_id_) or ' عضو مميز 🧙🏻‍♂'
else
t = database:get("tshake:name_nk"..bot_id..msg.chat_id_) or 'عضو فقط 👶🏻' 
end
if not database:get("tshake:gr:id:text:"..bot_id..msg.chat_id_) then 
send(msg.chat_id_, msg.id_, 1,"🎟┇ ايديك •  ("..msg.sender_user_id_..")\n🎫┇ يوزرك • "..keko_info.."\n🛰┇ موقعك • "..t.."\n📖┇ رسائلك • {"..user_msgs..")\n🗃┇ سحكاتك • ("..edit..")\n📓┇ تفاعلك • "..ikeko_text.."\n🤹🏻‍♂️┇ مجوهراتك •  ("..nko..")\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ", 1, 'html')
else 
local tshake_new_text = database:get("tshake:gr:id:text:"..bot_id..msg.chat_id_)
local tshake_new_text = tshake_new_text:gsub('#username',(keko_info or 'لا يوجد'))
local tshake_new_text = tshake_new_text:gsub('#id',(msg.sender_user_id_ or 'لا يوجد'))
local tshake_new_text = tshake_new_text:gsub('#edit',(edit or 'لا يوجد'))
local tshake_new_text = tshake_new_text:gsub('#msgs',(user_msgs or 'لا يوجد'))
local tshake_new_text = tshake_new_text:gsub('#stast',(t or 'لا يوجد'))   
local tshake_new_text = tshake_new_text:gsub('#auto',(ikeko_text or 'لا يوجد'))
local tshake_new_text = tshake_new_text:gsub('#photos',(all_photo_tshake or 'لا يوجد'))
local tshake_new_text = tshake_new_text:gsub('#game',(nko or 'لا يوجد'))
send(msg.chat_id_, msg.id_, 1, tshake_new_text, 1, 'html') 
end 
end
else
end
end
end
tdcli_function ({
ID = "GetUserProfilePhotos",
user_id_ = msg.sender_user_id_,
offset_ = 0,
limit_ = 1
}, getpro, nil)
end
getUser(msg.sender_user_id_, keko333)
end
end
------------------------------------------------------------------------
if text then
if database:sismember('tshake:'..bot_id..'spam:id'..msg.sender_user_id_..':'..msg.chat_id_,text) then
else
database:del('tshake:'..bot_id..'spam:id'..msg.sender_user_id_..':'..msg.chat_id_) 
end
end

if text and text:match('^الحساب (%d+)$') then
local id = text:match('^الحساب (%d+)$')
local text = 'اضغط لمشاهده الحساب'
tdcli_function ({ID="SendMessage", chat_id_=msg.chat_id_, reply_to_message_id_=msg.id_, disable_notification_=0, from_background_=1, reply_markup_=nil, input_message_content_={ID="InputMessageText", text_=text, disable_web_page_preview_=1, clear_draft_=0, entities_={[0] = {ID="MessageEntityMentionName", offset_=0, length_=19, user_id_=id}}}}, dl_cb, nil)
end
local function oChat(chat_id,cb)
tdcli_function ({
ID = "OpenChat",
chat_id_ = chat_id
}, cb, nil)
end
------------------------------------------------------------------------
if text and text:match("^معلومات (.*)$") then
local memb = {string.match(text, "^(معلومات) (.*)$")}
function whois(extra,result,success)
if result.username_ then
result.username_ = '@'..result.username_
else
result.username_ = 'لا يوجد معرف'
end
send(msg.chat_id_, msg.id_, 1, '📜┇معرف ~⪼ ('..(result.username_..')\n🔘┇الاسم ~⪼ ('..result.first_name_ or "tshake")..')', 1, 'md')
end
getUser(memb[2],whois)
end
------------------------------------------------------------------------
if text == ("مشاهده منشور") then
database:set('tshake:'..bot_id..'viewget'..msg.sender_user_id_,true)
send(msg.chat_id_, msg.id_, 1, '📥┇قم بارسال المنشور الان ',1, 'md')
end
------------------------------------------------------------------------
if text == "صلاحياته" and tonumber(msg.reply_to_message_id_) > 0 then    
if tonumber(msg.reply_to_message_id_) ~= 0 then 
function prom_reply(extra, result, success) 
Get_Info(msg,msg.chat_id_,result.sender_user_id_)
end  
tdcli_function ({ID = "GetMessage",chat_id_=msg.chat_id_,message_id_=tonumber(msg.reply_to_message_id_)},prom_reply, nil)
end
end
------------------------------------------------------------------------
if text == "صلاحياتي" then 
if tonumber(msg.reply_to_message_id_) == 0 then 
Get_Info(msg,msg.chat_id_,msg.sender_user_id_)
end  
end
------------------------------------------------------------------------
if text and text:match('^صلاحياته @(.*)') then   
local username = text:match('صلاحياته @(.*)')   
if tonumber(msg.reply_to_message_id_) == 0 then 
function prom_username(extra, result, success) 
if (result and result.code_ == 400 or result and result.message_ == "USERNAME_NOT_OCCUPIED") then
SendText(msg.chat_id_,msg.id_,"*📮┇ المعرف غير صحيح \n*")   
return false  end   

Get_Info(msg,msg.chat_id_,result.id_)
end  
tdcli_function ({ID = "SearchPublicChat",username_ = username},prom_username,nil) 
end 
end

------------------------------------------------------------------------
if text == 'سمايلات' and database:get('tshake:'..bot_id..'lock_geam'..msg.chat_id_) then
database:del('tshake:'..bot_id..'l:ids'..msg.chat_id_)
katu = {'🍏','🍎','🍐','🍊','🍋','🍉','🍇','🍓','🍈','🍒','🍑','🍍','🥥','🥝','🍅','🍆','🥑','🥦','🥒','🌶','🌽','🥕','🥔','🥖','🥐','🍞','🥨','🍟','🧀','🥚','🍳','🥞','🥓','🥩','🍗','🍖','🌭','🍔','🍠','🍕','🥪','🥙','🍼','☕️','🍵','🥤','🍶','🍺','🍻','🏀','⚽️','🏈','⚾️','🎾','🏐','🏉','🎱','🏓','🏸','🥅','🎰','🎮','🎳','🎯','🎲','🎻','🎸','🎺','🥁','🎹','🎼','🎧','🎤','🎬','🎨','🎭','🎪','🎟','🎫','🎗','🏵','🎖','🏆','🥌','🛷','🚗','🚙','🚌','🚎','🏎','🚓','🚑','🚚','🚛','🚜','🇮🇶','⚔','🛡','🔮','🌡','💣','📌','📍','📓','📗','📂','📅','📪','📫','📬','📭','⏰','📺','🎚','☎️','📡'}
name = katu[math.random(#katu)]
database:set('tshake:'..bot_id..'klmos'..msg.chat_id_,name)
taha = '🚀┇اسرع واحد يدز » {`'..name..'`}'
send(msg.chat_id_, msg.id_, 1,taha, 1, 'md')
end
------------------------------------------------------------------------
if text == ''..(database:get('tshake:'..bot_id..'klmos'..msg.chat_id_) or 'لفاتع')..'' and not database:get('tshake:'..bot_id..'l:ids'..msg.chat_id_) then
if not database:get('tshake:'..bot_id..'l:ids'..msg.chat_id_) then 
taha = '*👾| مبروك لقد فزت ,\n🎮| للعب مره اخرى ارسل سمايلات ,*'
send(msg.chat_id_, msg.id_, 1,taha, 1, 'md')
database:incrby('tshake:'..bot_id..'add:num'..msg.chat_id_..msg.sender_user_id_, 1)  
database:incrby('tshake:'..bot_id..'add:numall'..msg.chat_id_..msg.sender_user_id_, 1)    
end
database:set('tshake:'..bot_id..'l:ids'..msg.chat_id_,true)
end 
------------------------------------------------------------------------
if text == 'الاسرع' and database:get('tshake:'..bot_id..'lock_geam'..msg.chat_id_) then
database:del('tshake:'..bot_id..'l:id'..msg.chat_id_)
katu = {'سحور','سياره','استقبال','قنفه','ايفون','بزونه','مطبخ','كرستيانو','دجاجه','مدرسه','الوان','غرفه','ثلاجه','كهوه','سفينه','العراق','محطه','طياره','رادار','منزل','مستشفى','كهرباء','تفاحه','اخطبوط','سلمون','فرنسا','برتقاله','تفاح','مطرقه','بتيته','لهانه','شباك','باص','سمكه','ذباب','تلفاز','حاسوب','انترنيت','ساحه','جسر'};
name = katu[math.random(#katu)]
database:set('tshake:'..bot_id..'klmo'..msg.chat_id_,name)
name = string.gsub(name,'سحور','س ر و ح')
name = string.gsub(name,'سياره','ه ر س ي ا')
name = string.gsub(name,'استقبال','ل ب ا ت ق س ا')
name = string.gsub(name,'قنفه','ه ق ن ف')
name = string.gsub(name,'ايفون','و ن ف ا')
name = string.gsub(name,'بزونه','ز و ه ن')
name = string.gsub(name,'مطبخ','خ ب ط م')
name = string.gsub(name,'كرستيانو','س ت ا ن و ك ر ي')
name = string.gsub(name,'دجاجه','ج ج ا د ه')
name = string.gsub(name,'مدرسه','ه م د ر س')
name = string.gsub(name,'الوان','ن ا و ا ل')
name = string.gsub(name,'غرفه','غ ه ر ف')
name = string.gsub(name,'ثلاجه','ج ه ت ل ا')
name = string.gsub(name,'كهوه','ه ك ه و')
name = string.gsub(name,'سفينه','ه ن ف ي س')
name = string.gsub(name,'العراق','ق ع ا ل ر ا')
name = string.gsub(name,'محطه','ه ط م ح')
name = string.gsub(name,'طياره','ر ا ط ي ه')
name = string.gsub(name,'رادار','ر ا ر ا د')
name = string.gsub(name,'منزل','ن ز م ل')
name = string.gsub(name,'مستشفى','ى ش س ف ت م')
name = string.gsub(name,'كهرباء','ر ب ك ه ا ء')
name = string.gsub(name,'تفاحه','ح ه ا ت ف')
name = string.gsub(name,'اخطبوط','ط ب و ا خ ط')
name = string.gsub(name,'سلمون','ن م و ل س')
name = string.gsub(name,'فرنسا','ن ف ر س ا')
name = string.gsub(name,'برتقاله','ر ت ق ب ا ه ل')
name = string.gsub(name,'تفاح','ح ف ا ت')
name = string.gsub(name,'مطرقه','ه ط م ر ق')
name = string.gsub(name,'بتيته','ب ت ت ي ه')
name = string.gsub(name,'لهانه','ه ن ل ه ل')
name = string.gsub(name,'شباك','ب ش ا ك')
name = string.gsub(name,'باص','ص ا ب')
name = string.gsub(name,'سمكه','ك س م ه')
name = string.gsub(name,'ذباب','ب ا ب ذ')
name = string.gsub(name,'تلفاز','ت ف ل ز ا')
name = string.gsub(name,'حاسوب','س ا ح و ب')
name = string.gsub(name,'انترنيت','ا ت ن ر ن ي ت')
name = string.gsub(name,'ساحه','ح ا ه س')
name = string.gsub(name,'جسر','ر ج س')
taha = '🚀┇اسرع واحد يرتبها » {'..name..'}'
send(msg.chat_id_, msg.id_, 1,taha, 1, 'md')
end
------------------------------------------------------------------------
if text == ''..(database:get('tshake:'..bot_id..'klmo'..msg.chat_id_) or 'لفاتع')..'' and not database:get('tshake:'..bot_id..'l:id'..msg.chat_id_) then
if not database:get('tshake:'..bot_id..'l:id'..msg.chat_id_) then 
taha = '*👾| مبروك لقد فزت ,\n🎮| للعب مره اخرى ارسل الاسرع ,*'
send(msg.chat_id_, msg.id_, 1,taha, 1, 'md')
database:incrby('tshake:'..bot_id..'add:num'..msg.chat_id_..msg.sender_user_id_, 1) 
database:incrby('tshake:'..bot_id..'add:numall'..msg.chat_id_..msg.sender_user_id_, 1)    
end
database:set('tshake:'..bot_id..'l:id'..msg.chat_id_,true)
end 
------------------------------------------------------------------------
if text == 'حزوره' and database:get('tshake:'..bot_id..'lock_geam'..msg.chat_id_) then
database:del('tshake:'..bot_id..'l:id1'..msg.chat_id_)
katu = {'الجرس','عقرب الساعه','السمك','المطر','5','الكتاب','البسمار','7','الكعبه','بيت الشعر','لهانه','انا','امي','الابره','الساعه','22','غلط','كم الساعه','البيتنجان','البيض','المرايه','الضوء','الهواء','الضل','العمر','القلم','المشط','الحفره','البحر','الثلج','الاسفنج','الصوت','بلم'};
name = katu[math.random(#katu)]
database:set('tshake:'..bot_id..'klmoa'..msg.chat_id_,name)
name = string.gsub(name,'الجرس','شيئ اذا لمسته صرخ ما هوه ؟')
name = string.gsub(name,'عقرب الساعه','اخوان لا يستطيعان تمضيه اكثر من دقيقه معا فما هما ؟')
name = string.gsub(name,'السمك','ما هو الحيوان الذي لم يصعد الى سفينة نوح عليه السلام ؟')
name = string.gsub(name,'المطر','شيئ يسقط على رأسك من الاعلى ولا يجرحك فما هو ؟')
name = string.gsub(name,'5','ما العدد الذي اذا ضربته بنفسه واضفت عليه 5 يصبح ثلاثين ')
name = string.gsub(name,'الكتاب','ما الشيئ الذي له اوراق وليس له جذور ؟')
name = string.gsub(name,'البسمار','ما هو الشيئ الذي لا يمشي الا بالضرب ؟')
name = string.gsub(name,'7','عائله مؤلفه من 6 بنات واخ لكل منهن .فكم عدد افراد العائله ')
name = string.gsub(name,'الكعبه','ما هو الشيئ الموجود وسط مكة ؟')
name = string.gsub(name,'بيت الشعر','ما هو البيت الذي ليس فيه ابواب ولا نوافذ ؟ ')
name = string.gsub(name,'لهانه','وحده حلوه ومغروره تلبس مية تنوره .من هيه ؟ ')
name = string.gsub(name,'انا','ابن امك وابن ابيك وليس باختك ولا باخيك فمن يكون ؟')
name = string.gsub(name,'امي','اخت خالك وليست خالتك من تكون ؟ ')
name = string.gsub(name,'الابره','ما هو الشيئ الذي كلما خطا خطوه فقد شيئا من ذيله ؟ ')
name = string.gsub(name,'الساعه','ما هو الشيئ الذي يقول الصدق ولكنه اذا جاع كذب ؟')
name = string.gsub(name,'22','كم مره ينطبق عقربا الساعه على بعضهما في اليوم الواحد ')
name = string.gsub(name,'غلط','ما هي الكلمه الوحيده التي تلفض غلط دائما ؟ ')
name = string.gsub(name,'كم الساعه','ما هو السؤال الذي تختلف اجابته دائما ؟')
name = string.gsub(name,'البيتنجان','جسم اسود وقلب ابيض وراس اخظر فما هو ؟')
name = string.gsub(name,'البيض','ماهو الشيئ الذي اسمه على لونه ؟')
name = string.gsub(name,'المرايه','ارى كل شيئ من دون عيون من اكون ؟ ')
name = string.gsub(name,'الضوء','ما هو الشيئ الذي يخترق الزجاج ولا يكسره ؟')
name = string.gsub(name,'الهواء','ما هو الشيئ الذي يسير امامك ولا تراه ؟')
name = string.gsub(name,'الضل','ما هو الشيئ الذي يلاحقك اينما تذهب ؟ ')
name = string.gsub(name,'العمر','ما هو الشيء الذي كلما طال قصر ؟ ')
name = string.gsub(name,'القلم','ما هو الشيئ الذي يكتب ولا يقرأ ؟')
name = string.gsub(name,'المشط','له أسنان ولا يعض ما هو ؟ ')
name = string.gsub(name,'الحفره','ما هو الشيئ اذا أخذنا منه ازداد وكبر ؟')
name = string.gsub(name,'البحر','ما هو الشيئ الذي يرفع اثقال ولا يقدر يرفع مسمار ؟')
name = string.gsub(name,'الثلج','انا ابن الماء فان تركوني في الماء مت فمن انا ؟')
name = string.gsub(name,'الاسفنج','كلي ثقوب ومع ذالك احفض الماء فمن اكون ؟')
name = string.gsub(name,'الصوت','اسير بلا رجلين ولا ادخل الا بالاذنين فمن انا ؟')
name = string.gsub(name,'بلم','حامل ومحمول نصف ناشف ونصف مبلول فمن اكون ؟ ')
taha = '🕐┇اسرع واحد يحلها » {'..name..'}'
send(msg.chat_id_, msg.id_, 1,taha, 1, 'md')
end
------------------------------------------------------------------------
if text == ''..(database:get('tshake:'..bot_id..'klmoa'..msg.chat_id_) or 'لفاتع')..'' and not database:get('tshake:'..bot_id..'l:id1'..msg.chat_id_) then
if not database:get('tshake:'..bot_id..'l:id1'..msg.chat_id_) then 
taha = '*👾| مبروك لقد فزت ,\n🎮| للعب مره اخرى ارسل حزوره ,*'
send(msg.chat_id_, msg.id_, 1,taha, 1, 'md')
database:incrby('tshake:'..bot_id..'add:num'..msg.chat_id_..msg.sender_user_id_, 1)
database:incrby('tshake:'..bot_id..'add:numall'..msg.chat_id_..msg.sender_user_id_, 1)    
end
database:set('tshake:'..bot_id..'l:id1'..msg.chat_id_,true)
end 
------------------------------------------------------------------------
if text == 'المعاني' and database:get('tshake:'..bot_id..'lock_geam'..msg.chat_id_) then
database:del('tshake:'..bot_id..'l:id2'..msg.chat_id_)
katu = {'قرد','دجاجه','بطريق','ضفدع','بومه','نحله','ديك','جمل','بقره','دولفين','تمساح','قرش','نمر','اخطبوط','سمكه','خفاش','اسد','فأر','ذئب','فراشه','عقرب','زرافه','قنفذ','تفاحه','باذنجان'}
name = katu[math.random(#katu)]
database:set('tshake:'..bot_id..'means'..msg.chat_id_,name)
name = string.gsub(name,'قرد','🐒')
name = string.gsub(name,'دجاجه','🐔')
name = string.gsub(name,'بطريق','🐧')
name = string.gsub(name,'ضفدع','🐸')
name = string.gsub(name,'بومه','🦉')
name = string.gsub(name,'نحله','🐝')
name = string.gsub(name,'ديك','🐓')
name = string.gsub(name,'جمل','🐫')
name = string.gsub(name,'بقره','🐄')
name = string.gsub(name,'دولفين','🐬')
name = string.gsub(name,'تمساح','🐊')
name = string.gsub(name,'قرش','🦈')
name = string.gsub(name,'نمر','🐅')
name = string.gsub(name,'اخطبوط','🐙')
name = string.gsub(name,'سمكه','🐟')
name = string.gsub(name,'خفاش','🦇')
name = string.gsub(name,'اسد','🦁')
name = string.gsub(name,'فأر','🐭')
name = string.gsub(name,'ذئب','🐺')
name = string.gsub(name,'فراشه','🦋')
name = string.gsub(name,'عقرب','🦂')
name = string.gsub(name,'زرافه','🦒')
name = string.gsub(name,'قنفذ','🦔')
name = string.gsub(name,'تفاحه','🍎')
name = string.gsub(name,'باذنجان','🍆')
taha = '🔵┇اول واحد يكتب معنئ السمايل » {'..name..'}'
send(msg.chat_id_, msg.id_, 1,taha, 1, 'md')
end
------------------------------------------------------------------------
if text == ''..(database:get('tshake:'..bot_id..'means'..msg.chat_id_) or 'لفاتع')..'' and not database:get('tshake:'..bot_id..'l:id2'..msg.chat_id_) then
if not database:get('tshake:'..bot_id..'l:id2'..msg.chat_id_) then 
taha = '*👾| مبروك لقد فزت ,\n🎮| للعب مره اخرى ارسل المعاني ,*'
send(msg.chat_id_, msg.id_, 1,taha, 1, 'md')
database:incrby('tshake:'..bot_id..'add:num'..msg.chat_id_..msg.sender_user_id_, 1)
database:incrby('tshake:'..bot_id..'add:numall'..msg.chat_id_..msg.sender_user_id_, 1)    
end
database:set('tshake:'..bot_id..'l:id2'..msg.chat_id_,true)
end 
------------------------------------------------------------------------
if text == 'العكس' and database:get('tshake:'..bot_id..'lock_geam'..msg.chat_id_) then
database:del('tshake:'..bot_id..'l:id3'..msg.chat_id_)
katu = {'باي','فهمت','موزين','اسمعك','احبك','موحلو','نضيف','حاره','ناصي','جوه','سريع','ونسه','طويل','سمين','ضعيف','شريف','شجاع','رحت','عدل','نشيط','شبعان','موعطشان','خوش ولد','اني','هادئ'}
name = katu[math.random(#katu)]
database:set('tshake:'..bot_id..'aks'..msg.chat_id_,name)
name = string.gsub(name,'باي','هلو')
name = string.gsub(name,'فهمت','مافهمت')
name = string.gsub(name,'موزين','زين')
name = string.gsub(name,'اسمعك','ماسمعك')
name = string.gsub(name,'احبك','ماحبك')
name = string.gsub(name,'موحلو','حلو')
name = string.gsub(name,'نضيف','وصخ')
name = string.gsub(name,'حاره','بارده')
name = string.gsub(name,'ناصي','عالي')
name = string.gsub(name,'جوه','فوك')
name = string.gsub(name,'سريع','بطيء')
name = string.gsub(name,'ونسه','ضوجه')
name = string.gsub(name,'طويل','قزم')
name = string.gsub(name,'سمين','ضعيف')
name = string.gsub(name,'ضعيف','قوي')
name = string.gsub(name,'شريف','كواد')
name = string.gsub(name,'شجاع','جبان')
name = string.gsub(name,'رحت','اجيت')
name = string.gsub(name,'عدل','ميت')
name = string.gsub(name,'نشيط','كسول')
name = string.gsub(name,'شبعان','جوعان')
name = string.gsub(name,'موعطشان','عطشان')
name = string.gsub(name,'خوش ولد','موخوش ولد')
name = string.gsub(name,'اني','مطي')
name = string.gsub(name,'هادئ','عصبي')
taha = '✖️┇عكس كلمه » {'..name..'} ⚜️'
send(msg.chat_id_, msg.id_, 1,taha, 1, 'md')
end
------------------------------------------------------------------------
if text == ''..(database:get('tshake:'..bot_id..'aks'..msg.chat_id_) or 'لفاتع')..'' and not database:get('tshake:'..bot_id..'l:id3'..msg.chat_id_) then
if not database:get('tshake:'..bot_id..'l:id3'..msg.chat_id_) then 
taha = '*👾| مبروك لقد فزت ,\n🎮| للعب مره اخرى ارسل العكس ,*'
send(msg.chat_id_, msg.id_, 1,taha, 1, 'md')
database:incrby('tshake:'..bot_id..'add:num'..msg.chat_id_..msg.sender_user_id_, 1)
database:incrby('tshake:'..bot_id..'add:numall'..msg.chat_id_..msg.sender_user_id_, 1)    
end
database:set('tshake:'..bot_id..'l:id3'..msg.chat_id_,true)
end 
------------------------------------------------------------------------
if database:get('tshake:'..bot_id.."GAME:TKMEN" .. msg.chat_id_ .. "" .. msg.sender_user_id_) then  
if text and text:match("^(%d+)$") then
local NUM = text:match("^(%d+)$")
if tonumber(NUM) > 20 then
taha = "*📬┇ عذرآ لا يمكنك تخمين عدد اكبر من ال { 20 } خمن رقم ما بين ال{ 1 و 20 } *\n"
send(msg.chat_id_, msg.id_, 1,taha, 1, 'md')
return false  end 
local GETNUM = database:get('tshake:'..bot_id.."GAMES:NUM"..msg.chat_id_)
if tonumber(NUM) == tonumber(GETNUM) then
database:del('tshake:'..bot_id..'SADD:NUM'..msg.chat_id_..msg.sender_user_id_)
database:del('tshake:'..bot_id.."GAME:TKMEN" .. msg.chat_id_ .. "" .. msg.sender_user_id_)   
database:incrby('tshake:'..bot_id..'add:num'..msg.chat_id_..msg.sender_user_id_, 5)  
database:incrby('tshake:'..bot_id..'add:numall'..msg.chat_id_..msg.sender_user_id_, 5)    
taha = '*🔖┇ مبروك فزت ويانه وخمنت الرقم الصحيح\n🚸┇ تم اضافة { 5 } من النقاط *\n'
send(msg.chat_id_, msg.id_, 1,taha, 1, 'md')
elseif tonumber(NUM) ~= tonumber(GETNUM) then
database:incrby('tshake:'..bot_id..'SADD:NUM'..msg.chat_id_..msg.sender_user_id_,1)
if tonumber(database:get('tshake:'..bot_id..'SADD:NUM'..msg.chat_id_..msg.sender_user_id_)) >= 3 then
database:del('tshake:'..bot_id..'SADD:NUM'..msg.chat_id_..msg.sender_user_id_)
database:del('tshake:'..bot_id.."GAME:TKMEN" .. msg.chat_id_ .. "" .. msg.sender_user_id_)   
taha = '\n*📮┇ اوبس لقد خسرت في اللعبه \n📬┇ حظآ اوفر في المره القادمه \n🔰┇ كان الرقم الذي تم تخمينه { '..GETNUM..' }\n*'
send(msg.chat_id_, msg.id_, 1,taha, 1, 'md')
else
taha = '\n*📛┇ اوبس تخمينك غلط \n📌┇ ارسل رقم تخمنه مره اخرى \n*'
send(msg.chat_id_, msg.id_, 1,taha, 1, 'md')
end
end
end
end
------------------------------------------------------------------------
if database:get('tshake:'..bot_id.."SET:GAME" .. msg.chat_id_ .. "" .. msg.sender_user_id_) then  
if text and text:match("^(%d+)$") then
local NUM = text:match("^(%d+)$")
if tonumber(NUM) > 6 then
taha = "*📬┇ عذرا لا يوجد سواء { 6 } اختيارات فقط ارسل اختيارك مره اخرى*\n"
send(msg.chat_id_, msg.id_, 1,taha, 1, 'md')
return false  end 
local GETNUM = database:get('tshake:'..bot_id.."GAMES"..msg.chat_id_)
if tonumber(NUM) == tonumber(GETNUM) then
database:del('tshake:'..bot_id.."SET:GAME" .. msg.chat_id_ .. "" .. msg.sender_user_id_)   
taha = '*📮┇ مبروك فزت وطلعت المحيبس بل ايد رقم { '..NUM..' }\n🎊┇ لقد حصلت على { 3 }من نقاط يمكنك استبدالهن برسائل *'
send(msg.chat_id_, msg.id_, 1,taha, 1, 'md')
database:incrby('tshake:'..bot_id..'add:num'..msg.chat_id_..msg.sender_user_id_, 3)  
database:incrby('tshake:'..bot_id..'add:numall'..msg.chat_id_..msg.sender_user_id_, 3)    
elseif tonumber(NUM) ~= tonumber(GETNUM) then
database:del('tshake:'..bot_id.."SET:GAME" .. msg.chat_id_ .. "" .. msg.sender_user_id_)   
taha = '\n*📮┇ للاسف لقد خسرت \n📬┇ المحيبس بل ايد رقم { '..GETNUM..' }\n💥┇ حاول مره اخرى للعثور على المحيبس *'
send(msg.chat_id_, msg.id_, 1,taha, 1, 'md')
end
end
end
------------------------------------------------------------------------
if text == 'المختلف' and database:get('tshake:'..bot_id..'lock_geam'..msg.chat_id_) then
katu = {'😸','☠','🐼','🐇','🌑','🌚','⭐️','✨','⛈','🌥','⛄️','👨‍🔬','👨‍💻','👨‍🔧','👩‍🍳','🧚‍♀','🧜‍♂','🧝‍♂','🙍‍♂','🧖‍♂','👬','👨‍👨‍👧','🕒','🕤','⌛️','📅',
};
name = katu[math.random(#katu)]
database:del('tshake:'..bot_id..'l:idss'..msg.chat_id_)
database:set('tshake:'..bot_id..':Set_alii:'..msg.chat_id_,name)
name = string.gsub(name,'😸','😹😹😹😹😹😹😹😹😸😹😹😹😹')
name = string.gsub(name,'☠','💀💀💀💀💀💀💀☠💀💀💀💀💀')
name = string.gsub(name,'🐼','👻👻👻👻👻👻👻🐼👻👻👻👻👻')
name = string.gsub(name,'🐇','🕊🕊🕊🕊🕊🐇🕊🕊🕊🕊')
name = string.gsub(name,'🌑','🌚🌚🌚🌚🌚🌑🌚🌚🌚')
name = string.gsub(name,'🌚','🌑🌑🌑🌑🌑🌚🌑🌑🌑')
name = string.gsub(name,'⭐️','🌟🌟🌟🌟🌟🌟🌟🌟⭐️🌟🌟🌟')
name = string.gsub(name,'✨','💫💫💫💫💫✨💫💫💫💫')
name = string.gsub(name,'⛈','🌨🌨🌨🌨🌨⛈🌨🌨🌨🌨')
name = string.gsub(name,'🌥','⛅️⛅️⛅️⛅️⛅️⛅️🌥⛅️⛅️⛅️⛅️')
name = string.gsub(name,'⛄️','☃☃☃☃☃☃⛄️☃☃☃☃')
name = string.gsub(name,'👨‍🔬','👩‍🔬👩‍🔬👩‍🔬👩‍🔬👩‍🔬👩‍🔬👩‍🔬👩‍🔬👨‍🔬👩‍🔬👩‍🔬👩‍🔬')
name = string.gsub(name,'👨‍💻','👩‍💻👩‍💻👩‍‍💻👩‍‍💻👩‍💻👨‍💻👩‍💻👩‍💻👩‍💻')
name = string.gsub(name,'👨‍🔧','👩‍🔧👩‍🔧👩‍🔧👩‍🔧👩‍🔧👩‍🔧👨‍🔧👩‍🔧')
name = string.gsub(name,'👩‍🍳','👨‍🍳👨‍🍳👨‍🍳👨‍🍳👨‍🍳👩‍🍳👨‍🍳👨‍🍳👨‍🍳')
name = string.gsub(name,'🧚‍♀','🧚‍♂🧚‍♂🧚‍♂🧚‍♂🧚‍♀🧚‍♂🧚‍♂')
name = string.gsub(name,'🧜‍♂','🧜‍♀🧜‍♀🧜‍♀🧜‍♀🧜‍♀🧚‍♂🧜‍♀🧜‍♀🧜‍♀')
name = string.gsub(name,'🧝‍♂','🧝‍♀🧝‍♀🧝‍♀🧝‍♀🧝‍♀🧝‍♂🧝‍♀🧝‍♀🧝‍♀')
name = string.gsub(name,'🙍‍♂️','🙎‍♂️🙎‍♂️🙎‍♂️🙎‍♂️🙎‍♂️🙍‍♂️🙎‍♂️🙎‍♂️🙎‍♂️')
name = string.gsub(name,'🧖‍♂️','🧖‍♀️🧖‍♀️🧖‍♀️🧖‍♀️🧖‍♀️🧖‍♂️🧖‍♀️🧖‍♀️🧖‍♀️🧖‍♀️')
name = string.gsub(name,'👬','👭👭👭👭👭👬👭👭👭')
name = string.gsub(name,'👨‍👨‍👧','👨‍👨‍👦👨‍👨‍👦👨‍👨‍👦👨‍👨‍👦👨‍👨‍👧👨‍👨‍👦👨‍👨‍👦')
name = string.gsub(name,'🕒','🕒🕒🕒🕒🕒🕒🕓🕒🕒🕒')
name = string.gsub(name,'🕤','🕥🕥🕥🕥🕥🕤🕥🕥🕥')
name = string.gsub(name,'⌛️','⏳⏳⏳⏳⏳⏳⌛️⏳⏳')
name = string.gsub(name,'📅','📆📆📆📆📆📆📅📆📆')
TEST = '  اول واحد يطلع المختلف » {* '..name..' * } ' 
send(msg.chat_id_, msg.id_, 1,TEST, 1, 'md')
end
------------------------------------------------------------------------
if text == 'امثله' and database:get('tshake:'..bot_id..'lock_geam'..msg.chat_id_) then
katu = {
'جوز','ضراطه','الحبل','الحافي','شقره','بيدك','سلايه','النخله','الخيل','حداد','المبلل','يركص','قرد','العنب','العمه','الخبز','بالحصاد','شهر','شكه','يكحله',
};
name = katu[math.random(#katu)]
database:set('tshake:'..bot_id..':Set_Amthlh:'..msg.chat_id_,name)
database:del('tshake:'..bot_id..'l:idst'..msg.chat_id_)
name = string.gsub(name,'جوز','ينطي____للماعده سنون')
name = string.gsub(name,'ضراطه','الي يسوق المطي يتحمل___')
name = string.gsub(name,'بيدك','اكل___محد يفيدك')
name = string.gsub(name,'الحافي','تجدي من___نعال')
name = string.gsub(name,'شقره','مع الخيل يا___')
name = string.gsub(name,'النخله','الطول طول___والعقل عقل الصخلة')
name = string.gsub(name,'سلايه','بالوجه امراية وبالظهر___')
name = string.gsub(name,'الخيل','من قلة___شدو على الچلاب سروج')
name = string.gsub(name,'حداد','موكل من صخم وجهه كال آني___')
name = string.gsub(name,'المبلل','___ما يخاف من المطر')
name = string.gsub(name,'الحبل','اللي تلدغة الحية يخاف من جرة___')
name = string.gsub(name,'يركص','المايعرف___يكول الكاع عوجه')
name = string.gsub(name,'العنب','المايلوح___يكول حامض')
name = string.gsub(name,'العمه','___إذا حبت الچنة ابليس يدخل الجنة')
name = string.gsub(name,'الخبز','انطي___للخباز حتى لو ياكل نصه')
name = string.gsub(name,'باحصاد','اسمة___ومنجله مكسور')
name = string.gsub(name,'شهر','امشي__ولا تعبر نهر')
name = string.gsub(name,'شكه','يامن تعب يامن__يا من على الحاضر لكة')
name = string.gsub(name,'القرد','__بعين امه غزال')
name = string.gsub(name,'يكحله','اجه___عماها')
TEST = 'اكمل المثل التالي {* '..name..' *}'
send(msg.chat_id_, msg.id_, 1,TEST, 1, 'md')
end
------------------------------------------------------------------------
if text == ''..(database:get('tshake:'..bot_id..':Set_alii:'..msg.chat_id_) or '57999')..'' then -- // المختلف
if not database:get('tshake:'..bot_id..'l:idss'..msg.chat_id_) then 
database:incrby('tshake:'..bot_id..'add:num'..msg.chat_id_..msg.sender_user_id_, 1)  
database:incrby('tshake:'..bot_id..'add:numall'..msg.chat_id_..msg.sender_user_id_, 1)    
database:del('tshake:'..bot_id..':Set_alii:'..msg.chat_id_)
taha = '*  🎁  احسنت اجابتك صحيحه   \n* '
send(msg.chat_id_, msg.id_, 1,taha, 1, 'md')
end
database:set('tshake:'..bot_id..'l:idss'..msg.chat_id_,true)
end
------------------------------------------------------------------------
if text == ''..(database:get('tshake:'..bot_id..':Set_Amthlh:'..msg.chat_id_) or '6499')..'' then -- // امثله
if not database:get('tshake:'..bot_id..'l:idst'..msg.chat_id_) then 
database:incrby('tshake:'..bot_id..'add:num'..msg.chat_id_..msg.sender_user_id_, 1)  
database:incrby('tshake:'..bot_id..'add:numall'..msg.chat_id_..msg.sender_user_id_, 1)    
database:del('tshake:'..bot_id..':Set_Amthlh:'..msg.chat_id_)
taha = '*  🎁  احسنت اجابتك صحيحه   \n* '
send(msg.chat_id_, msg.id_, 1,taha, 1, 'md')
end
database:set('tshake:'..bot_id..'l:idst'..msg.chat_id_,true)
end
------------------------------------------------------------------------
if text == 'محيبس' or text == 'بات' then
if database:get('tshake:'..bot_id..'lock_geam'..msg.chat_id_) then   
Num = math.random(1,6)
database:set('tshake:'..bot_id.."GAMES"..msg.chat_id_,Num) 
TEST = [[
*➀       ➁     ➂      ➃      ➄     ➅
↓      ↓     ↓      ↓     ↓     ↓
👊 ‹› 👊 ‹› 👊 ‹› 👊 ‹› 👊 ‹› 👊
📮┇ اختر لأستخراج المحيبس الايد التي تحمل المحيبس 
🎁┇ الفائز يحصل على { 3 } من النقاط *
]]
send(msg.chat_id_, msg.id_, 1,TEST, 1, 'md')
database:setex('tshake:'..bot_id.."SET:GAME" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 100, true)  
return false  
end
end
------------------------------------------------------------------------
if text == 'خمن' or text == 'تخمين' then   
if database:get('tshake:'..bot_id..'lock_geam'..msg.chat_id_) then
Num = math.random(1,20)
database:set('tshake:'..bot_id.."GAMES:NUM"..msg.chat_id_,Num) 
TEST = '*\n🎮┇ اهلا بك عزيزي في لعبة التخمين :\nٴ━━━━━━━━━━\n'..'⚠┇ ملاحظه لديك { 3 } محاولات فقط فكر قبل ارسال تخمينك \n\n'..'🔖┇ سيتم تخمين عدد ما بين ال {1 و 20} اذا تعتقد انك تستطيع الفوز جرب واللعب الان ؟ \n💥*'
send(msg.chat_id_, msg.id_, 1,TEST, 1, 'md')
database:setex('tshake:'..bot_id.."GAME:TKMEN" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 100, true)  
return false  
end
end
------------------------------------------------------------------------
if text =='مجوهراتي' then 
if tonumber((database:get('tshake:'..bot_id..'add:num'..msg.chat_id_..msg.sender_user_id_) or 0)) == 0 then
taha = '*💎┇ ليس لديك مجوهرات \n📬┇ للحصول على مجوهرات ارسل الاسرع وابدأ اللعب*\n'
send(msg.chat_id_, msg.id_, 1,taha, 1, 'md')
else
taha = '*💎┇ عدد مجوهراتك الحاليه  ('..(database:get('tshake:'..bot_id..'add:num'..msg.chat_id_..msg.sender_user_id_))..')*'
taha1 = '*💎┇ مجموع مجوهراتك  ('..(database:get('tshake:'..bot_id..'add:numall'..msg.chat_id_..msg.sender_user_id_))..')*'
send(msg.chat_id_, msg.id_, 1,''..taha..'\n'..taha1..'', 1, 'md')
end
end
------------------------------------------------------------------------
if text == 'بيع مجوهراتي' then
if tonumber((database:get('tshake:'..bot_id..'add:num'..msg.chat_id_..msg.sender_user_id_) or 0)) == 0 then
taha = '*💠┇ ليس لديك مجوهرات \n📬┇ للحصول على مجوهرات ارسل الاسرع وابدأ اللعب*\n'
send(msg.chat_id_, msg.id_, 1,taha, 1, 'md')
else
taha = (database:get('tshake:'..bot_id..'add:num'..msg.chat_id_..msg.sender_user_id_) * tonumber(database:get('tshake:'..bot_id..'gamepoint' .. msg.chat_id_)or 50))
database:incrby('tshake:'..bot_id..'nummsg'..msg.chat_id_..msg.sender_user_id_,taha)  
database:del('tshake:'..bot_id..'add:num'..msg.chat_id_..msg.sender_user_id_)
taha = tonumber((database:get('tshake:'..bot_id..'gamepoint' .. msg.chat_id_) or 50))
send(msg.chat_id_, msg.id_, 1,'💎┇ تم بيع جواهرك كل مجوهره تساوي '..taha..' رساله', 'md')
end
end
------------------------------------------------------------------------
if text == 'حذف مجوهراتي' then
database:del('tshake:'..bot_id..'add:num'..msg.chat_id_..msg.sender_user_id_)  
database:del('tshake:'..bot_id..'add:numall'..msg.chat_id_..msg.sender_user_id_)  
send(msg.chat_id_, msg.id_, 1, "تم حذف جميع مجوهراتك", 1, "md") 
end
------------------------------------------------------------------------
if text == 'حذف رسائلي' then
database:del('tshake:'..bot_id..'nummsg'..msg.chat_id_..msg.sender_user_id_)
database:del('tshake:'..bot_id..'user:msgs'..msg.chat_id_..':'..msg.sender_user_id_)
send(msg.chat_id_, msg.id_, 1, "🗑 ┇ تم حذف رسائلك  ", 1, "md") 
end
------------------------------------------------------------------------
if text == ("الاوامر") and (is_mod(msg) or is_creatorbasic(msg)) then
local help = redis:get('tshake:'..bot_id..'help')
local text =  [[
📮┇هناك {4} اوامر لعرضها
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
🗑┇م1 ~⪼ لعرض اوامر الحمايه
📚┇م2 ~⪼ لعرض اوامر الادمنيه
🗓┇م3 ~⪼ لعرض اوامر المدراء
🎖┇م4 ~⪼ لعرض اوامر المطورين
🔖┇ اوامر التقيد
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
‏📡┇Ch ~⪼ @Zx_xx
]]
send(msg.chat_id_, msg.id_, 1, (help or text), 1, 'html')
end
------------------------------------------------------------------------
if (text == ("م1") or text == "م١") and (is_mod(msg) or is_creatorbasic(msg)) then
local h1 = redis:get('tshake:'..bot_id..'h1')
local text =  [[
📮┇ اوامر حمايه المجموعه
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
⏺┇قفل/فتح + الاوامر الادناه
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
🔐┇الكل
🔐┇الروابط
🔐┇المعرف
🔐┇التاك
🔐┇الشارحه
🔐┇التعديل
🔐┇التثبيت
🔐┇المتحركه
🔐┇الملفات
🔐┇الصور
🔐┇الملصقات
🔐┇الفيديو
🔐┇الانلاين
🔐┇الدردشه
🔐┇التوجيه
🔐┇الاغاني
🔐┇الصوت
🔐┇الجهات
🔐┇الاشعارات
🔐┇الماركدون
🔐┇البوتات
🔐┇العربيه
🔐┇الانكليزية
🔐┇الميديا
🔐┇الكانسر
🔐┇التكرار
🔐┇الكلايش
🔐┇الدخول
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
📡┇Ch ~⪼ @Zx_xx
]]
send(msg.chat_id_, msg.id_, 1, (h1 or text), 1, 'html')
end
------------------------------------------------------------------------
if (text == ("م2") or text == "م٢") and (is_mod(msg) or is_creatorbasic(msg)) then
local h2 = redis:get('tshake:'..bot_id..'h2')
local text =  [[
🥈┇اوامر الادمنيه
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
🚫┇كتم
🚷┇حظر
🚷┇طرد
🚫┇منع ثم ارسل الكلمه والتحذير
🚫┇منع بالرد على الميديا
⏺┇الغاء حظر
⏺┇الغاء كتم
⏺┇الغاء منع ثم ارسل الكلمه
⏺┇الغاء منع بالرد على الميديا
📋┇المحظورين  
📋┇المكتومين
📋┇قائمه المنع
ℹ️┇تثبيت
⏺┇الغاء تثبيت
📄┇الاعدادات
🗳┇الرابط
📃┇القوانين
📫┇ وضع عدد الكانسر
👋🏻┇وضع/حذف/جلب الترحيب
👋🏻┇تفعيل/تعطيل الترحيب
⚠️┇تفعيل/تعطيل الابلاغ
⚠️┇تعين عدد الابلاغ + العدد
📡┇معلومات + ايدي
📲┇الحساب + ايدي
📣┇كرر + الكلمه
💭┇ايدي
💭┇جهاتي
💭┇سحكاتي
💭┇رسائلي
💭┇ابلاغ
💭┇عدد الكروب
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
🔘┇وضع + الاوامر الادناه
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
📝┇اسم
📝┇رابط
📝┇صوره
📝┇وصف
📝┇قوانين
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
🗑┇مسح + الاوامر الادناه
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
📮┇قائمه المنع
📮┇المحظورين
📮┇المكتومين
📮┇القوانين
📮┇البوتات
📮┇الصوره
📮┇الرابط
📮┇قائمه منع المتحركات
📮┇قائمه منع الملصقات
📮┇قائمه منع الصور
📮┇الاوامر الاضافيه 
📮┇مسح الاوامر المضافه
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
📡┇Ch ~⪼ @Zx_xx
]]
send(msg.chat_id_, msg.id_, 1, (h2 or text), 1, 'html')
end
------------------------------------------------------------------------
if (text == ("م3") or text == "م٣") and (is_mod(msg) or is_creatorbasic(msg)) then
local h3 = redis:get('tshake:'..bot_id..'h3')
local text =  [[
🥇┇ اوامر المدراء
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
🔘┇وضع :- مع الاوامر ادناه
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
🔢┇تكرار + العدد
⏺┇زمن التكرار + العدد
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
↕️┇رفع/تنزيل ادمن
↕️┇رفع/تنزيل عضو مميز
↕️┇منح/الغاء منح الحظر
💬┇تفعيل/تعطيل الايدي بالصوره
💬┇تفعيل/تعطيل الايدي
💬┇تفعيل/تعطيل ردود المطور
💬┇تفعيل/تعطيل ردود المدير
💬┇تفعيل/تعطيل التثبيت
💬┇تفعيل/تعطيل اطردني
🖇┇رفع الادمنيه
🖇┇اضف/حذف رد
📋┇الادمنيه
📋┇قائمه صلاحيه الحظر
📋┇ردود المدير
📋┇ادمنيه المجموعه
📋┇الاعضاء المميزين
🗑┇تنظيف + عدد
🗑┇مسح الادمنيه
🗑┇مسح ردود المدير
🗑┇مسح الاعضاء المميزين
🗑┇مسح صلاحية الحظر
🗑┇تنظيف قائمه المحظورين
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
🏅┇اوامر المنشئين
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
↕️┇رفع/تنزيل مدير
📋┇المدراء
🗑┇مسح المدراء
🚫┇طرد المحذوفين
🚫┇طرد المتروكين
🗑┇تنظيف قائمه المحظورين
🔘┇تعين/مسح الايدي
📎┇اضف/مسح صلاحيه
➕┇اضف/مسح امر + اسم الامر
🖲┇تفعيل/تعطيل الاعلانات
🚸┇تفعيل/تعطيل الطرد/الحظر
💭┇اضف/حذف امر + اسم الامر
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
📡┇Ch ~⪼ @ZX_XX
]]
send(msg.chat_id_, msg.id_, 1, (h3 or text), 1, 'html')
end
------------------------------------------------------------------------
if text == "اوامر التقيد" or text == "اوامر التقييد" and is_mod(msg) then
local hres = redis:get('tshake:'..bot_id..'hres')
local text =[[
📮┇ اوامر حمايه المجموعه بالتقييد
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
🔒┇قفل ~⪼ لقفل امر
🔓┇فتح ~⪼ لفتح امر
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
🔐┇الروابط بالتقيد
🔐┇المعرف بالتقيد
🔐┇التاك بالتقيد
🔐┇الشارحه بالتقيد
🔐┇المتحركه بالتقيد
🔐┇الملفات بالتقيد
🔐┇الصور بالتقيد
🔐┇الملصقات بالتقيد
🔐┇الفيديو بالتقيد

🔐┇الانلاين بالتقيد
🔐┇الدردشه بالتقيد
🔐┇التوجيه بالتقيد
🔐┇الاغاني بالتقيد
🔐┇الصوت بالتقيد
🔐┇الجهات بالتقيد
🔐┇الماركدون بالتقيد
🔐┇العربيه بالتقيد
🔐┇الانكليزية بالتقيد
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
🚹┇تقيد
🚹┇الغاء تقيد
🚹┇المقيدين
🚹┇مسح المقيدين
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
📡┇Ch ~⪼ @TshakeTeam
]]
send(msg.chat_id_, msg.id_, 1, (hres or text), 1, 'md')
end
------------------------------------------------------------------------
if (text == ("م4") or text == "م٤") and is_sudo(msg) then
local h4 = redis:get('tshake:'..bot_id..'h4')
local text =  [[
🎖┇اوامر المطور
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
✳️┇تفعيل/تعطيل
⏺┇تفعيل/تعطيل المغادره
⏺┇تفعيل/تعطيل الاذاعه
⏺┇تفعيل/تعطيل التفعيل التلقائي
⏺┇تعين عدد الاعضاء + عدد
🔘┇وضع وقت + عدد
🔘┇المده1 + id
🔘┇المده2 + id
🔘┇المده3 + id
🔘┇وقت المجموعه + id
🔘┇مغادره + id
🔘┇مغادره
🔘┇اضف/مسح رد للكل
📋┇ردود المطور
🔘┇تغير اسم البوت 
🔘┇تغير/مسح امر المطور بالكليشه
🔘┇تعين/مسح مجموعه المطور
📄┇عدد الكروبات/الاحصائيات
📋┇روابط الكروبات
🚫┇حظر عام
⏺┇الغاء العام
🚫┇كتم عام
⏺┇الغاء كتم العام
📋┇قائمه العام
📋┇المكتومين عام
↕️┇اضف/حذف مطور
↕️┇رفع/تنزيل مدير
↕️┇رفع/تنزيل منشئ اساسي 
📋┇المدراء
📋┇المنشئين
📋┇المنشئين الاساسين
📋┇المطورين
🗑┇استعاده الاوامر
🗑┇مسح ردود المطور
🗑┇مسح المطورين
🗑┇مسح قائمه العام
🗑┇مسح المدراء
🗑┇مسح المنشئين
🗑┇مسح الاساسين
🗑┇مسح المكتومين عام
🏷┇تغير امر {الاوامر ، م1 ، م2 ، م3 ، م4}
🏷┇مشاهده منشور
🏷┇اذاعه+ توجيه للكل بلرد 
🏷┇اذاعه بالتثبيت
🏷┇اذاعه خاص 
🏷┇تنظيف المشتركين
🏷┇تنظيف المجموعات
🗂┇الملفات
🗂┇تفعيل/تعطيل ملف + اسم الملف
🗂┇المتجر - متجر الملفات
🗂┇جلب نسخه احتياطيه 
🗂┇رفع النسخه الاحتياطيه 
🗂┇مسح جميع الملفات
🗯┇تغير نص الانلاين + النص
🗯┇تغير رابط الانلاين + الرابط
🗯┇تفعيل/تعطيل الانلاين
🗯┇فحص البوت
🗯┇تغير اسم البوت
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
‏📡┇Ch ~⪼ @ZX_XX
]]
send(msg.chat_id_, msg.id_, 1, (h4 or text), 1, 'html')
end
------------------------------------------------------------------------
if text == ("اصدار") or text == ("الاصدار") or text == ("السورس") or text == ("سورس") then
local text =  [[
👋┇اهلا بك في سورس تشاكي 

🌐┇TshAkE TEAM

🦁┇[قناه السورس](t.me/ZX_XX)

📜┇[قناه شروحات سورس](http://t.me/TSHAKETEAM)

📥┇[قناه ملفات السورس](t.me/TSHAKETEAM)

🔎┇[طريقه التنصيب](https://t.me/ZX_XX/648)

📮┇[لـ تواصل](t.me/A_5bot)
]]
send(msg.chat_id_, msg.id_, 1, text, 1, 'md')
end
------------------------------------------------------------------------
if text == ("اريد رابط حذف") or text == ("رابط حذف") or text == ("رابط الحذف") or text == ("الرابط حذف") or text == ("اريد رابط الحذف") then
local text =  [[
🗑┇رابط حذف التلي ، ⬇
‼┇احذف ولا ترجع عيش حياتك'
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
🔎┇<a href="https://telegram.org/deactivate">اضغط هنا للحذف الحساب" </a>
]]
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end
end


function tdcli_update_callback(data)
if data.ID == "UpdateChannel" then 
if data.channel_.status_.ID == "ChatMemberStatusKicked" then 
database:del( 'tshake:'..bot_id.."charge:"..'-100'..data.channel_.id_)
database:srem("thsake:gog"..bot_id, '-100'..data.channel_.id_)
database:sadd( 'tshake:'..bot_id.."groups",'-100'..data.channel_.id_)
end
end
local chat = {}
if (data.ID == "UpdateNewMessage") then
local Data_Tshake = data
local msg = data.message_
local text = msg.content_.text_
------------------------------------------------------------------------
if msg.date_ and msg.date_ < tonumber(os.time() - 30) then
print('OLD MESSAGE')
return false
end
------------------------------------------------------------------------
tdcli_function ({ID = "GetUser",user_id_ = msg.sender_user_id_},function(arg,data) 
if data.username_ ~= false then
database:hset('tshake:'..bot_id..'user:'..msg.sender_user_id_,'username',(data.username_ or msg.sender_user_id_))
print('Save User : @'..data.username_ or '')
end;end,nil)   
------------------------------------------------------------------------
if msg.content_.members_ then
if is_banned(msg.content_.members_[0].id_, msg.chat_id_) then
chat_kick(msg.chat_id_, msg.content_.members_[0].id_)
return false
end
end
------------------------------------------------------------------------
if msg.content_.members_ then
if is_gbanned(msg.content_.members_[0].id_, msg.chat_id_) then
chat_kick(msg.chat_id_, msg.content_.members_[0].id_)
return false
end
end
------------------------------------------------------------------------
if is_gbanned(msg.sender_user_id_, msg.chat_id_) then
chat_kick(msg.chat_id_, msg.sender_user_id_)
delete_msg(msg.chat_id_,{[0] = msg.id_})
return false
end
------------------------------------------------------------------------
if is_gmuted(msg.sender_user_id_, msg.chat_id_) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return false
end
------------------------------------------------------------------------
if is_banned(msg.sender_user_id_, msg.chat_id_) then
chat_kick(msg.chat_id_, msg.sender_user_id_)
delete_msg(msg.chat_id_,{[0] = msg.id_})
return false
end
------------------------------------------------------------------------
if is_muted(msg.sender_user_id_, msg.chat_id_) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return false
end
------------------------------------------------------------------------
if is_muted(msg.sender_user_id_, msg.chat_id_) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return false
end
------------------------------------------------------------------------
if msg.content_.ID == "MessageChatAddMembers" then  
local mem_id = msg.content_.members_  
local Bots = database:get("lock_bot:tshake"..msg.chat_id_..bot_id)
for i=0,#mem_id do  
if msg.content_.members_[i].type_.ID == "UserTypeBot" and not is_mod(msg) and Bots then   
taha = HTTPS.request("https://api.telegram.org/bot"..token.."/kickChatMember?chat_id="..msg.chat_id_.."&user_id="..mem_id[i].id_)
local Json_Info = JSON.decode(taha)
if Json_Info.ok == true and #mem_id == i then
local Msgs = {}
Msgs[0] = msg.id_
msgs_id = msg.id_-1048576
for i=1 ,(100) do 
msgs_id = msgs_id+1048576
table.insert(Msgs,msgs_id)
end
tdcli_function ({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = Msgs},function(arg,data);MsgsDel = {};for i=0 ,data.total_count_ do;if not data.messages_[i] then;if not MsgsDel[0] then;MsgsDel[0] = Msgs[i];end;table.insert(MsgsDel,Msgs[i]);end;end;if MsgsDel[0] then;tdcli_function({ID="DeleteMessages",chat_id_ = arg.chat_id_,message_ids_=MsgsDel},function(arg,data)end,nil);end;end,{chat_id_=msg.chat_id_})
tdcli_function({ID = "GetChannelMembers",channel_id_ = getChatId(msg.chat_id_).ID,filter_ = {ID = "ChannelMembersBots"},offset_ = 0,limit_ = 100 },function(arg,tah) local admins = tah.members_ for i=0 , #admins do if tah.members_[i].status_.ID ~= "ChatMemberStatusEditor" and not is_mod(msg) then tdcli_function ({ID = "ChangeChatMemberStatus",chat_id_ = msg.chat_id_,user_id_ = admins[i].user_id_,status_ = {ID = "ChatMemberStatusKicked"},}, function(arg,f) end, nil) end end end,nil)  
end
end     
end
end
if msg.content_.ID == "MessageChatAddMembers" then  
local mem_id = msg.content_.members_  
local Bots = database:get("lock_botAndBan:tshake"..msg.chat_id_..bot_id) 
for i=0,#mem_id do  
if msg.content_.members_[i].type_.ID == "UserTypeBot" and not is_mod(msg) and Bots then   
HTTPS.request("https://api.telegram.org/bot"..token.."/kickChatMember?chat_id="..msg.chat_id_.."&user_id="..msg.sender_user_id_)
taha = HTTPS.request("https://api.telegram.org/bot"..token.."/kickChatMember?chat_id="..msg.chat_id_.."&user_id="..mem_id[i].id_)
local Json_Info = JSON.decode(taha)
if Json_Info.ok == true and #mem_id == i then
local Msgs = {}
Msgs[0] = msg.id_
msgs_id = msg.id_-1048576
for i=1 ,(100) do 
msgs_id = msgs_id+1048576
table.insert(Msgs,msgs_id)
end
tdcli_function ({ID = "GetMessages",chat_id_ = msg.chat_id_,message_ids_ = Msgs},function(arg,data);MsgsDel = {};for i=0 ,data.total_count_ do;if not data.messages_[i] then;if not MsgsDel[0] then;MsgsDel[0] = Msgs[i];end;table.insert(MsgsDel,Msgs[i]);end;end;if MsgsDel[0] then;tdcli_function({ID="DeleteMessages",chat_id_ = arg.chat_id_,message_ids_=MsgsDel},function(arg,data)end,nil);end;end,{chat_id_=msg.chat_id_})
tdcli_function({ID = "GetChannelMembers",channel_id_ = getChatId(msg.chat_id_).ID,filter_ = {ID = "ChannelMembersBots"},offset_ = 0,limit_ = 100 },function(arg,tah) local admins = tah.members_ for i=0 , #admins do if tah.members_[i].status_.ID ~= "ChatMemberStatusEditor" and not is_mod(msg) then tdcli_function ({ID = "ChangeChatMemberStatus",chat_id_ = msg.chat_id_,user_id_ = admins[i].user_id_,status_ = {ID = "ChatMemberStatusKicked"},}, function(arg,f) end, nil) end end end,nil)  
end
end     
end
end
------------------------------------------------------------------------
if msg.content_.ID == "MessageChatJoinByLink" or msg.content_.ID == "MessageChatAddMembers" or msg.content_.ID == "MessageChatDeleteMember" then
if database:get("lock_new:tshake"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return false
end
end
------------------------------------------------------------------------
if data.message_.content_.text_ then   
if database:get("tshake:edit:text:su:newamr2:"..bot_id..data.message_.chat_id_..data.message_.content_.text_) then
local tshake_edit_text = database:get("tshake:edit:text:su:newamr2:"..bot_id..data.message_.chat_id_..data.message_.content_.text_)
print(tshake_edit_text)
if tshake_edit_text then
data.message_.content_.text_ = (tshake_edit_text or data.message_.content_.text_)
end
end
end
local Name_Bot = (redis:get('tshake:'..bot_id..'name_bot') or 'تشاكي')
if not database:get("Fun_Bots:"..bot_id..msg.chat_id_) then
if text ==  ""..Name_Bot..' شنو رئيك بهاذا' and tonumber(msg.reply_to_message_id_) > 0 then     
function FunBot(extra, result, success) 
local Fun = {'لوكي وزاحف من ساع زحفلي وحضرته 😒','خوش ولد و ورده مال الله 💋🙄','يلعب ع البنات 🙄', 'ولد زايعته الكاع 😶🙊','صاك يخبل ومعضل ','محلو وشواربه جنها مكناسه 😂🤷🏼‍♀️','اموت عليه 🌝','هوه غير الحب مال اني 🤓❤️','مو خوش ولد صراحه ☹️','ادبسز وميحترم البنات  ', 'فد واحد قذر 🙄😒','ماطيقه كل ما اكمشه ريحته جنها بخاخ بف باف مال حشرات 😂🤷‍♀️','مو خوش ولد 🤓' } 
send(msg.chat_id_, result.id_, 1,''..Fun[math.random(#Fun)]..'', 1, 'md')   
end   
getMessage(msg.chat_id_, msg.reply_to_message_id_,FunBot)
return false
end  
if text == ""..Name_Bot..' شنو رئيك بهاي' and tonumber(msg.reply_to_message_id_) > 0 then    
function FunBot(extra, result, success) 
local Fun = {'الكبد مال اني هيه ','ختولي ماحبها ','خانتني ويه صديقي 😔','بس لو الكفها اله اعضها 💔','خوش بنيه بس عده مكسرات زايده وناقصه منا ومنا وهيه تدري بنفسها 😒','جذابه ومنافقه سوتلي مشكله ويه الحب مالتي ','ئووووووووف اموت ع ربها ','ديرو بالكم منها تلعب ع الولد 😶 ضحكت ع واحد قطته ايفون 7 ','صديقتي وختي وروحي وحياتي ','فد وحده منحرفه 😥','ساكنه بالعلاوي ونته حدد بعد لسانها لسان دلاله 🙄🤐','ام سحوره سحرت اخويا وعلكته 6 سنوات 🤕','ماحبها 🙁','بله هاي جهره تسئل عليها ؟ ','بربك ئنته والله فارغ وبطران وماعدك شي تسوي جاي تسئل ع بنات العالم ولي يله 🏼','ياخي بنيه حبوبه بس لبعرك معمي عليها تشرب هواي 😹' } 
send(msg.chat_id_,result.id_,1,''..Fun[math.random(#Fun)]..'', 1, 'md') 
end  
getMessage(msg.chat_id_, msg.reply_to_message_id_,FunBot)
return false
end    
end
if text and text:match('^'..Name_Bot..' ') then
data.message_.content_.text_ = data.message_.content_.text_:gsub('^'..Name_Bot..' ','')
end
------------------------------------------------------------------------------------------------------------------------------------------------
tshake_run_(msg,data)
tshake_run_file(Data_Tshake)
------------------------------------------------------------------------
--         »»                 Start UpdateChat                         ««              --
elseif (data.ID == "UpdateChat") then
chat = data.chat_
chats[chat.id_] = chat
elseif (data.ID == "UpdateMessageEdited") then
local msg = data
function get_msg_contact(extra, result, success)
local msgg = result 
database:incr('tshake:'..bot_id..'user:editmsg'..msgg.chat_id_..':'..msgg.sender_user_id_)
if (result.content_.caption_ and not is_vip(msgg)) then 
if (result.content_.caption_:match("(.*)@(.*)") or result.content_.caption_:match("@")) then 
if database:get("lock_username:tshake"..msg.chat_id_..bot_id) then
local msgs = {[0] = data.message_id_}
delete_msg(msg.chat_id_,msgs) 
end 
end 
end
if database:get("lock_edit:tshake"..msg.chat_id_..bot_id) and not result.content_.text_ and not is_creator(msgg) and not is_creatorbasic(msgg) then
function get_edit(arg,data)
local username = data.username_
local name = data.first_name_
local iduser = data.id_
if data.username_ ~= false then
send(msg.chat_id_,0, 1, "⚠┇#تحذير \n🔖┇قام شخصآ ما في المجموعه بالتعديل على الميديا يرجى الانتباه \n📫┇الشخص الي قام بالتعديل \n (@"..data.username_..")" , 1, 'html') 
else
send(msg.chat_id_,0, 1, "[⚠┇#تحذير] \n🔖┇قام شخصآ ما في المجموعه بالتعديل على الميديا يرجى الانتباه \n📫┇الشخص الي قام بالتعديل \n ["..data.first_name_.."](T.ME/TSHAKETEAM)" , 1, 'md') 
end
end
getUser(result.sender_user_id_,get_edit)
delete_msg(msg.chat_id_,{[0] = msg.message_id_}) 
elseif database:get("lock_edit:tshake:kick"..msg.chat_id_..bot_id) and not result.content_.text_ and not is_creator(msgg) and not is_creatorbasic(msgg) then
function get_edit(arg,data)
local username = data.username_
local name = data.first_name_
local iduser = data.id_
if data.username_ ~= false then
send(msg.chat_id_,0, 1, "⚠┇#تحذير \n🔖┇قام شخصآ ما في المجموعه بالتعديل على الميديا يرجى الانتباه \n📫┇الشخص الي قام بالتعديل \n (@"..data.username_..")\n🚷┇ وتم طرده \n" , 1, 'html') 
else
send(msg.chat_id_,0, 1, "[⚠┇#تحذير] \n🔖┇قام شخصآ ما في المجموعه بالتعديل على الميديا يرجى الانتباه \n📫┇الشخص الي قام بالتعديل \n ["..data.first_name_.."](T.ME/TSHAKETEAM)\n🚷┇ وتم طرده \n" , 1, 'md') 
end
chat_kick(msg.chat_id_,data.id_)
end
getUser(result.sender_user_id_,get_edit)
delete_msg(msg.chat_id_,{[0] = msg.message_id_}) 
end
local text = result.content_.text_
if not is_mod(msgg) or not is_creatorbasic(msgg) then
------------------------------------------------------------------------
if text:match("[Jj][Oo][Ii][Nn][Cc][Hh][Aa][Tt]") or text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or text:match("[Tt].[Mm][Ee]") or text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or text:match("[Tt][Ee][Ll][Ee][Ss][Cc][Oo].[Pp][Ee]") then
if database:get("lock_link:tshake"..msg.chat_id_..bot_id) then
local msgs = {[0] = data.message_id_}
delete_msg(msg.chat_id_,msgs) 
end
end
------------------------------------------------------------------------
if text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or text:match("[Tt].[Mm][Ee]") or text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or text:match("[Tt][Ee][Ll][Ee][Ss][Cc][Oo].[Pp][Ee]") then
if database:get("lock_link.note:tshake"..msg.chat_id_..bot_id) then
local msgs = {[0] = data.message_id_}
delete_msg(msg.chat_id_,msgs) 
end
end
------------------------------------------------------------------------
if text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or text:match("[Tt].[Mm][Ee]") or text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or text:match("[Tt][Ee][Ll][Ee][Ss][Cc][Oo].[Pp][Ee]") then
if database:get("lock_link:tshake"..msg.chat_id_..bot_id) then
local msgs = {[0] = data.message_id_}
delete_msg(msg.chat_id_,msgs) 
end 
end
------------------------------------------------------------------------
if text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or text:match("[Tt].[Mm][Ee]") or text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or text:match("[Tt][Ee][Ll][Ee][Ss][Cc][Oo].[Pp][Ee]") then
if database:get("lock_link.note:tshake"..msg.chat_id_..bot_id) then
local msgs = {[0] = data.message_id_}
delete_msg(msg.chat_id_,msgs) 
end 
end 
------------------------------------------------------------------------
if text:match("[hH][tT][tT][pP][sT]") or text:match("[tT][eE][lL][eE][gG][rR][aA].[Pp][Hh]") or text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa].[Pp][Hh]") then
if database:get("lock_link.note:tshake"..msg.chat_id_..bot_id) then
local msgs = {[0] = data.message_id_}
delete_msg(msg.chat_id_,msgs) 
end 
end 
------------------------------------------------------------------------
if text:match("(.*)(@)(.*)") then
if database:get("lock_username:tshake"..msg.chat_id_..bot_id) then
local msgs = {[0] = data.message_id_}
delete_msg(msg.chat_id_,msgs) 
end 
end
------------------------------------------------------------------------
if text:match("@") then
if database:get("lock_username.note:tshake"..msg.chat_id_..bot_id) then
local msgs = {[0] = data.message_id_}
delete_msg(msg.chat_id_,msgs) 
end 
end 
------------------------------------------------------------------------
if text:match("#") then
if database:get("lock_tag:tshake"..msg.chat_id_..bot_id) then
local msgs = {[0] = data.message_id_}
delete_msg(msg.chat_id_,msgs) 
end 
end 
------------------------------------------------------------------------
if text:match("#") then
if database:get("lock_tag.note:tshake"..msg.chat_id_..bot_id) then
local msgs = {[0] = data.message_id_}
delete_msg(msg.chat_id_,msgs) 
end 
end 
------------------------------------------------------------------------
if text:match("/") then
local msgs = {[0] = data.message_id_}
delete_msg(msg.chat_id_,msgs)  
end 
if text:match("/") then
if database:get("lock_sarha.note:tshake"..msg.chat_id_..bot_id) then
local msgs = {[0] = data.message_id_}
delete_msg(msg.chat_id_,msgs) 
end 
end
------------------------------------------------------------------------
local taha = database:get('tshake:'..bot_id.."add:reply:rd"..text..msg.chat_id_)   
if taha and not is_mod(msgg) then    
function get_info(arg,data)
if data.username_ ~= false then
send(msg.chat_id_,0, 1, "⚠┇العضو : {["..data.first_name_.."](T.ME/"..data.username_..")}\n📛┇["..taha.."] \n" , 1, 'md') 
else
send(msg.chat_id_,0, 1, "⚠┇العضو : {["..data.first_name_.."](T.ME/TSHAKETEAM)}\n📛┇["..taha.."] \n" , 1, 'md') 
end
end
getUser(result.sender_user_id_,get_info)
delete_msg(msg.chat_id_, {[0] = data.message_id_}) 
return false   
end    
end
------------------------------------------------------------------------
end
getMessage(msg.chat_id_, msg.message_id_,get_msg_contact)
------------------------------------------------------------------------
--         »»                 End UpdateChat                          ««              --
elseif (data.ID == "UpdateOption" and data.name_ == "my_id") then  local list = database:smembers('tshake:'..bot_id.."userss") for k,v in pairs(list) do tdcli_function({ID='GetChat',chat_id_ = v},function(arg,data) end,nil) end 
local list = database:smembers('tshake:'..bot_id..'groups') 
for k,v in pairs(list) do 
tdcli_function({ID='GetChat',chat_id_ = v
},function(arg,data)
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusMember" then
print('\27[30;32m»» البوت عضو في المجموعه\nتم مغادرة المجموعه \n\27[1;37m')
changeChatMemberStatus(v, bot_id, "Left")
database:srem("thsake:gog"..bot_id,v) 
database:srem('tshake:'..bot_id..'pro:groups',v) 
database:srem( 'tshake:'..bot_id.."groups",v) 
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusLeft" then
database:srem("thsake:gog"..bot_id,v) 
database:srem('tshake:'..bot_id..'pro:groups',v) 
database:srem( 'tshake:'..bot_id.."groups",v) 
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusKicked" then
print('\27[30;32m»» البوت مطرود في المجموعه\nتم مسح بيانات المجموعه \n\27[1;37m')
database:srem("thsake:gog"..bot_id,v) 
database:srem('tshake:'..bot_id..'pro:groups',v) 
database:srem( 'tshake:'..bot_id.."groups",v) 
end
if data and data.code_ and data.code_ == 400 then
database:srem("thsake:gog"..bot_id,v) 
database:srem('tshake:'..bot_id..'pro:groups',v) 
database:srem( 'tshake:'..bot_id.."groups",v) 
end
if data and data.type_ and data.type_.channel_ and data.type_.channel_.status_ and data.type_.channel_.status_.ID == "ChatMemberStatusEditor" then
database:sadd("thsake:gog"..bot_id,v) 
database:sadd( 'tshake:'..bot_id.."groups",v) 
print('\27[30;32m»» البوت ادمن في المجموعه \n\27[1;37m')
end end,nil) end
tdcli_function ({ID="GetChats", offset_order_="9223372036854775807", offset_chat_id_=0, limit_=20}, dl_cb, nil)
end
if data.ID == "UpdateMessageSendSucceeded" then
local msg = data.message_
local text = msg.content_.text_
local Get_Msg_Pin = database:get('tshake:'..bot_id..'Msg_Text'..msg.chat_id_)
if Get_Msg_Pin ~= nil then
if text == Get_Msg_Pin then
tdcli_function ({ID = "PinChannelMessage",channel_id_ = msg.chat_id_:gsub('-100',''),message_id_ = msg.id_,disable_notification_ = 0},function(arg,d) if d.ID == 'Ok' then;database:del('tshake:'..bot_id..'Msg_Text'..msg.chat_id_);end;end,nil)   
elseif (msg.content_.sticker_) then 
print(msg.content_.sticker_.sticker_.persistent_id_)
if Get_Msg_Pin == msg.content_.sticker_.sticker_.persistent_id_ then
tdcli_function ({ID = "PinChannelMessage",channel_id_ = msg.chat_id_:gsub('-100',''),message_id_ = msg.id_,disable_notification_ = 0},function(arg,d) database:del('tshake:'..bot_id..'Msg_Text'..msg.chat_id_) end,nil)   
end
end
if (msg.content_.voice_) then
if msg.content_.voice_.voice_.persistent_id_ == Get_Msg_Pin then
tdcli_function ({ID = "PinChannelMessage",channel_id_ = msg.chat_id_:gsub('-100',''),message_id_ = msg.id_,disable_notification_ = 0},function(arg,d) database:del('tshake:'..bot_id..'Msg_Text'..msg.chat_id_) end,nil)   
end
end
if (msg.content_.video_) then 
if msg.content_.video_.video_.persistent_id_ == Get_Msg_Pin then
tdcli_function ({ID = "PinChannelMessage",channel_id_ = msg.chat_id_:gsub('-100',''),message_id_ = msg.id_,disable_notification_ = 0},function(arg,d) database:del('tshake:'..bot_id..'Msg_Text'..msg.chat_id_) end,nil)   
end
end
if (msg.content_.animation_) then 
if msg.content_.animation_.animation_.persistent_id_ == Get_Msg_Pin then
tdcli_function ({ID = "PinChannelMessage",channel_id_ = msg.chat_id_:gsub('-100',''),message_id_ = msg.id_,disable_notification_ = 0},function(arg,d) database:del('tshake:'..bot_id..'Msg_Text'..msg.chat_id_) end,nil)   
end
end
if (msg.content_.document_) then
if msg.content_.document_.document_.persistent_id_ == Get_Msg_Pin then
tdcli_function ({ID = "PinChannelMessage",channel_id_ = msg.chat_id_:gsub('-100',''),message_id_ = msg.id_,disable_notification_ = 0},function(arg,d) database:del('tshake:'..bot_id..'Msg_Text'..msg.chat_id_) end,nil)   
end
end
if (msg.content_.photo_) then
if msg.content_.photo_.sizes_[0] then
id_photo = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[1] then
id_photo = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[2] then
id_photo = msg.content_.photo_.sizes_[2].photo_.persistent_id_
end	
if msg.content_.photo_.sizes_[3] then
id_photo = msg.content_.photo_.sizes_[3].photo_.persistent_id_
end
if id_photo == Get_Msg_Pin then
tdcli_function ({ID = "PinChannelMessage",channel_id_ = msg.chat_id_:gsub('-100',''),message_id_ = msg.id_,disable_notification_ = 0},function(arg,d) database:del('tshake:'..bot_id..'Msg_Text'..msg.chat_id_) end,nil)   
end
end
end
end
end
--[[
 _____ ____  _   _    _    _  _______
|_   _/ ___|| | | |  / \  | |/ / ____|
  | | \___ \| |_| | / _ \ | ' /|  _|
  | |  ___) |  _  |/ ___ \| . \| |___
  |_| |____/|_| |_/_/   \_\_|\_\_____|
           CH > @TSHAKETEAM
--]]