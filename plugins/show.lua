function run(msg, matches)
 local name = matches[3]
 local ad = matches[2]
 local adress = io.open("./"..ad.."/"..name, ok_cb, false)
 local adr = adress:read("*all")
  if matches[1] == 'show' and matches[2] and matches[3] then
    return adr
  end
  if adress ~= nil or adress ~= "" then
    return "File Not Found!"
  end
end
return {
patterns = {"([Ss][Hh][Oo][Ww]) (.*) (.*)"},
run = run,
}
