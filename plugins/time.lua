function run(msg, matches)
local url , res = http.request('http://api.gpmod.ir/time/')
if res ~= 200 then return "No connection" end
local jdat = json:decode(url)
local stickurl = 'http://latex.codecogs.com/png.download?'
	..'\\dpi{300}%20\\LARGE%20'..jdat.ENtime
local file = download_to_file(stickurl,'time.webp')
send_document('channel#id'..msg.to.id,file,ok_cb,false)
return 'امروز📆:\n'..jdat.FAdate
end
return {
  patterns = {"^[/!]([Tt][iI][Mm][Ee])$"}, 
run = run 
}

--Created By Butler TM 
--@BUTLERTG
