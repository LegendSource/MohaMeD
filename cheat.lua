--[[
BY : TshAkETEAM
Channel Files : https://t.me/tshakeFiles
]]
local function keko_tshake(data)
    local msg = data.message_
    redis = (loadfile "./libs/redis.lua")()
    database = Redis.connect('127.0.0.1', 6379)
    sudos = dofile('sudo.lua')
    JSON = (loadfile  "./libs/dkjson.lua")()
    bot_id_keko = {string.match(token, "^(%d+)(:)(.*)")}
    bot_id = tonumber(bot_id_keko[1])

    function is_creator(msg)
    user_id = msg.sender_user_id_
    chat_id = msg.chat_id_
    local var = false
    local creator = database:sismember('tshake:'..bot_id..'creator:'..chat_id, user_id) 
    local admin = database:sismember('tshake:'..bot_id..'admins:', user_id)
    if creator then var = true end
    if admin then var = true end
    for k,v in pairs(sudo_users) do
    if user_id == v then var = true end end
    local keko_add_sudo = redis:get('tshake:'..bot_id..'sudoo'..user_id..'')
    if keko_add_sudo then var = true end
    return var
    end

    local function send(chat_id, reply_to_message_id, disable_notification, text, disable_web_page_preview, parse_mode)
    local TextParseMode = {ID = "TextParseModeMarkdown"}
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
    },
    }, dl_cb, nil)
    end
    local msg = data.message_
    text = msg.content_.text_
    if text and is_creator(msg) then 
        if database:get('tshake:'..bot_id.."numadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_) then 
if text and text:match("^الغاء$") then 
database:del('tshake:'..bot_id..'id:user'..msg.chat_id_)  
send(msg.chat_id_, msg.id_, 1, "*📬¦ تم الغاء الامر *\n✓", 1, "md") 
database:del('tshake:'..bot_id.."numadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
return false  end 
database:del('tshake:'..bot_id.."numadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
local numadded = string.match(text, "(%d+)") 
local iduserr = database:get('tshake:'..bot_id..'id:user'..msg.chat_id_)  
database:incrby('tshake:'..bot_id..'nummsg'..msg.chat_id_..iduserr,numadded)  
send(msg.chat_id_, msg.id_,  1, "📬*¦* تم اضافه له  *{ "..numadded..' }* رساله', 1, 'md')  
end
end

if text and text:match("^اضف رسائل (%d+)$") and is_sudo(msg) then  
taha = text:match("^اضف رسائل (%d+)$")
database:set('tshake:'..bot_id..'id:user'..msg.chat_id_,taha)  
database:setex('tshake:'..bot_id.."numadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 10000, true)  
local t = '*📊¦ ارسل لي عدد الرسائل الذي تريده*'  
send(msg.chat_id_, msg.id_, 1,t, 1, 'md') 
end
        if database:get('tshake:'..bot_id.."gemadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_) then 
if text and text:match("^الغاء$") then 
database:del('tshake:'..bot_id..'idgem:user'..msg.chat_id_)  
send(msg.chat_id_, msg.id_, 1, "*📬¦ تم الغاء الامر *\n✓", 1, "md") 
database:del('tshake:'..bot_id.."gemadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
return false  end 
database:del('tshake:'..bot_id.."gemadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_)  
local numadded = string.match(text, "(%d+)") 
local iduserr = database:get('tshake:'..bot_id..'idgem:user'..msg.chat_id_)  
database:incrby('tshake:'..bot_id..'add:num'..msg.chat_id_..iduserr,numadded)  
database:incrby('tshake:'..bot_id..'add:numall'..msg.chat_id_..iduserr,numadded)  
send(msg.chat_id_, msg.id_,  1, "✅*¦* روح خالي تم اضافه 😉  *{ "..numadded..' }* مجوهره 💎', 1, 'md')  
end

if text and text:match("^اضف مجوهرات (%d+)$") and is_sudo(msg) then  
taha = text:match("^اضف مجوهرات (%d+)$")
database:set('tshake:'..bot_id..'idgem:user'..msg.chat_id_,taha)  
database:setex('tshake:'..bot_id.."gemadd:user" .. msg.chat_id_ .. "" .. msg.sender_user_id_, 10000, true)  
local t = '*💎¦ ارسل عدد المجوهرات 😉*'  
send(msg.chat_id_, msg.id_, 1,t, 1, 'md') 
end
end
return {
    keko_tshake = keko_tshake,
}
--[[
BY : TshAkETEAM
Channel Files : https://t.me/tshakeFiles
]]
    