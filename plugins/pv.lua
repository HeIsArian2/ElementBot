local function run(msg, matches)
    if matches[1] == 'pv' then
     if msg.to.type == 'chat' or msg.to.type == 'channel' then
        return "نمیام 😐!"
    else
   return "ha?! 😐"
end
end
end
return {
    patterns = {
        "^[!#/]([Pp]v)$"
    },
    run = run
}
