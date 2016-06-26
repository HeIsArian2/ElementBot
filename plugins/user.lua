do

local function set_pass(msg, pass, id)
  local hash = nil
  if msg.to.type == "channel" and is_owner(msg) then
    hash = 'setpass:'
  end
  local name = string.gsub(msg.to.print_name, '_', '')
  if hash then
    redis:hset(hash, pass, id)
      return send_large_msg("channel#id"..msg.to.id, "نام کاربری گروه تغییر یافت \nنام گروه : ["..name.."] \nنام کاربری گروه : "..pass.." \n\nاز این به بعد با نام کاربری زیر کاربران میتوانند  به گروه بیایند\njoin "..pass.."\n\n@cruel_channel", ok_cb, true)
  end
end

local function is_used(pass)
  local hash = 'setpass:'
  local used = redis:hget(hash, pass)
  return used or false
end
local function show_add(cb_extra, success, result)
  --vardump(result)
    local receiver = cb_extra.receiver
    local text = "من شما را به گروه اضافه کردم اگر دعوت نشدید شماره ربات را ذخیره کنید\n\nنام گروه : "..result.title.."\n\nتعداد کاربران : (👤"..result.participants_count..")"
    send_large_msg(receiver, text)
end
local function added(msg, target)
  local receiver = get_receiver(msg)
  channel_info("channel#id"..target, show_add, {receiver=receiver})
end
local function run(msg, matches)
  if matches[1] == "user" and msg.to.type == "channel" and matches[2] then
    local pass = matches[2]
    local id = msg.to.id
    if is_used(pass) then
      return "این یوزر نیم قابل استفاده نیست"
    end
    redis:del("setpass:", id)
    return set_pass(msg, pass, id)
  end
  if matches[1] == "join" and matches[2] then
    local hash = 'setpass:'
    local pass = matches[2]
    local id = redis:hget(hash, pass)
    local receiver = get_receiver(msg)
    if not id then
      return "گروهی با این یوزر نیم وجود ندارد"
    end
    channel_invite("channel#id"..id, "user#id"..msg.from.id, ok_cb, false) 
      return added(msg, id)
    end
  if matches[1] == "users" then
   local hash = 'setpass:'
   local chat_id = msg.to.id
   local pass = redis:hget(hash, chat_id)
   local receiver = get_receiver(msg)
   send_large_msg(receiver, chat_id, "لیست نام کاربری گروه ها :["..msg.to.print_name.."]\n\n > "..pass)
 end
end

return {
  patterns = {
    "^/(user) (.*)$",
    "^/(users)$",
    "^([Jj]oin) (.*)$"
  },
  run = run
}
end
