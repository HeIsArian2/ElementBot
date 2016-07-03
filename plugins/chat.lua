local function run(msg)
if msg.text == "Bk" then
	return "Bk k Bk"
end
if msg.text == "bk" then
	return "Bk k Bk"
end
if msg.text == "Hi" then
	return "Zahr Mar Hi!"
end
if msg.text == "sik" then
	return "sak"
end
if msg.text == "Sik" then
	return "Sak"
end
if msg.text == "kickme" then
	return "nadaram revale?"
end
if msg.text == "zac" then
	return "Barash bezan sak"
end
if msg.text == "Zac" then
	return "Barash bezan sak"
end
if msg.text == "ZAC" then
	return "Barash bezan sak"
end
if msg.text == "Umbrella" then
	return "Yes?"
end
if msg.text == "umbrella" then
	return "What?"
end
if msg.text == "bot" then
	return "hum?"
end
if msg.text == "Bot" then
	return "Jan !"
end
if msg.text == "?" then
	return "Hum??"
end
if msg.text == "Bye" then
	return "Babay"
end
if msg.text == "bye" then
	return "Bye Bye"
end
end

return {
	description = "Chat With Robot Server", 
	usage = "chat with robot",
	patterns = {
		"^[Bb]k$",
		"^[Hh]i$",
		"^[Zz]ac$",
		"^ZAC$",
		"^[Bb]ot$",
		"^[Uu]mbrella$",
		"^[Bb]ye$",
		"^?$",
		"^[Ss]alam$",
		}, 
	run = run,
    --privileged = true,
	pre_process = pre_process
}
