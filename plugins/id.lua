do

function run(msg, matches)
local reply_id = msg['id']

local info = '~This Is Your & Gp Info !\n~Your Name: -> '..msg.from.first_name..'\n'
..'~Your Id : -> '..msg.from.id..'\n'
..'~Your Username : -> @'..msg.from.username..'\n'
..'~Group Id : -> '..msg.to.id..'\n'
..'~Group name : -> '..msg.to.title..'\n'
..'~Your Special Link : -> https://telegram.me/'..msg.from.username..'\n'
..'~Your Phone : +'..msg.from.phone

reply_msg(reply_id, info, ok_cb, false)
end

return {
patterns = {
"^[!/#]([Ii][Dd])"

},
run = run
}

end
