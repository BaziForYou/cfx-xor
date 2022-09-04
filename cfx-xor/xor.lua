local function BitXOR(a,b) -- https://stackoverflow.com/questions/5977654/how-do-i-use-the-bitwise-operator-xor-in-lua
  local p,c=1,0
  while a>0 and b>0 do
      local ra,rb=a%2,b%2
      if ra~=rb then c=c+p end
      a,b,p=(a-ra)/2,(b-rb)/2,p*2
  end
  if a<b then a=b end
  while a>0 do
      local ra=a%2
      if ra>0 then c=c+p end
      a,p=(a-ra)/2,p*2
  end
  return c
end

local function dec2Hex(val) -- https://gameguardian.net/forum/topic/31634-converting-decimal-to-hex/?do=findComment&comment=115371
	if val >= 0 and val < 16 then
		return string.format("0%X", tonumber(val))
	elseif val > 15 and val < 128 then
		return string.format("%X", tonumber(val))
	elseif val == 0 then
		return "00"
	elseif val < 0 and val > -128 then
	    return string.sub(string.format("%X", tostring(val)), 15)
	end
end

XOR_Ecode = function(sentString,sentKey,customSpace)
  local Answer = {}
  local Keys = {}
  local KeyIndex = 1
  for c in sentKey:gmatch"." do
    table.insert(Keys,string.byte(c))
  end
  for c in sentString:gmatch"." do
    local key = Keys[KeyIndex]
    KeyIndex = Keys[KeyIndex + 1] and KeyIndex + 1 or 1
    table.insert(Answer,dec2Hex(BitXOR(string.byte(c),key)))
  end
  return Answer, table.concat(Answer,customSpace or " ")
end
exports('XOR_Ecode', XOR_Ecode)

XOR_Decode = function(sentData,sentKey,customSpace)
  local Answer = {}
  local Keys = {}
  local KeyIndex = 1
  for c in sentKey:gmatch"." do
    table.insert(Keys,string.byte(c))
  end
  if type(sentData) == "string" then
    for c in (sentData .. (customSpace or " ")):gmatch("(.-)" .. (customSpace or " ")) do
      local key = Keys[KeyIndex]
      KeyIndex = Keys[KeyIndex + 1] and KeyIndex + 1 or 1
      table.insert(Answer,string.char(BitXOR(tonumber(c,16),key)))
    end
  else
    for i,c in ipairs(sentData) do
      local key = Keys[KeyIndex]
      KeyIndex = Keys[KeyIndex + 1] and KeyIndex + 1 or 1
      table.insert(Answer,string.char(BitXOR(tonumber(c,16),key)))
    end
  end
  return Answer, table.concat(Answer,"")
end
exports('XOR_Decode', XOR_Decode)