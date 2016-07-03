local function run(msg, matches)
    if matches[1] == 'v' then
     if msg.to.type == 'chat' or msg.to.type == 'channel' then
        return "نمیام 😐!"
    else
   return "ha?! 😐"
end
end
end
return {
    patterns = {
        "^[Pp]([Vv])$"
    },
    run = run
}
