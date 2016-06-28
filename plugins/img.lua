local function mosy(msg, matches)
local url = "https://unsplash.it/200/200/?random"
local file = download_to_file(url)
send_photo(get_receiver(msg),file,OK_cb,true)
end
end
return {
patterns = {
"^[#!/]([Ii]mg)$",
},
run = mosy,
}
