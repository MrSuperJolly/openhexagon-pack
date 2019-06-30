--[========[     ---      KEYBOARD - HELPER SCRIPT      ---     ]========]--
--                      ----[[  VERSION: 1.2  ]]----                      --
--     A few functions to help you use keyboard inputs in your level.     --
--	                                                                      --
--  Written by Oshisaure. Credit not necessary, but highly appreciated ♥  --
--[======================================================================]--

----------------------------------------------------------------------------
--[[
If the Open Hexagon 1.92 functions are not defined, make them be the 2.0 ones.
That means you can use this script in both 2.0 and 1.92 versions of the game!
Thanks to Zly for reminding me of the 2.0 name of the function cause I forgot.
]]
local version = 2.0
if isKeyPressed then version = 1.92 end
isKeyPressed = isKeyPressed or u_isKeyPressed
----------------------------------------------------------------------------


--[[
Defining a keyboard table to make an easier use of the isKeyPressed function.
Now, for example, if you want to check if the right key is pressed,
you just have to call isKeyPressed(keyboard.RIGHT).
]]
keyboard = {
	UNKNOWN = -1,
	A = 0,
	B = 1,
	C = 2,
	D = 3,
	E = 4,
	F = 5,
	G = 6,
	H = 7,
	I = 8,
	J = 9,
	K = 10,
	L = 11,
	M = 12,
	N = 13,
	O = 14,
	P = 15,
	Q = 16,
	R = 17,
	S = 18,
	T = 19,
	U = 20,
	V = 21,
	W = 22,
	X = 23,
	Y = 24,
	Z = 25,
	NUM0 = 26,
	NUM1 = 27,
	NUM2 = 28,
	NUM3 = 29,
	NUM4 = 30,
	NUM5 = 31,
	NUM6 = 32,
	NUM7 = 33,
	NUM8 = 34,
	NUM9 = 35,
	ESCAPE = 36,
	LCONTROL = 37,
	LSHIFT = 38,
	LALT = 39,
	LSYSTEM = 40,
	RCONTROL = 41,
	RSHIFT = 42,
	RALT = 43,
	RSYSTEM = 44,
	MENU = 45,
	LBRACKET = 46,
	RBRACKET = 47,
	SEMICOLON = 48,
	COMMA = 49,
	PERIOD = 50,
	QUOTE = 51,
	SLASH = 52,
	BACKSLASH = 53,
	TILDE = 54,
	EQUAL = 55,
	DASH = 56,
	SPACE = 57,
	RETURN = 58,    -- Using both names just in case
	ENTER = 58,
	BACKSPACE = 59,
	TAB = 60,
	PAGEUP = 61,
	PAGEDOWN = 62,
	END = 63,
	HOME = 64,
	INSERT = 65,
	DELETE = 66,
	ADD = 67,
	SUBTRACT = 68,
	MULTIPLY = 69,
	DIVIDE = 70,
	LEFT = 71,
	RIGHT = 72,
	UP = 73,
	DOWN = 74,
	NUMPAD0 = 75,
	NUMPAD1 = 76,
	NUMPAD2 = 77,
	NUMPAD3 = 78,
	NUMPAD4 = 79,
	NUMPAD5 = 80,
	NUMPAD6 = 81,
	NUMPAD7 = 82,
	NUMPAD8 = 83,
	NUMPAD9 = 84,
	F1 = 85,
	F2 = 86,
	F3 = 87,
	F4 = 88,
	F5 = 89,
	F6 = 90,
	F7 = 91,
	F8 = 92,
	F9 = 93,
	F10 = 94,
	F11 = 95,
	F12 = 96,
	F13 = 97,
	F14 = 98,
	F15 = 99,
	PAUSE = 100,
	KEY_COUNT = 101
}

--[[
Function used to decode the config file. Should work with any JSON file.
Except if for some reason one of the value names is true but who does that.
]]
function convertJSON(input_file)
	local file = io.open(input_file)
	local chr = " "
	local luaResult = "return "
	file:seek("set")
	local state = "     "
	while chr and chr ~= "" do
		if state:sub(-5) ~= "strng" then
			if chr == "{" then
				state = state..".table"
			elseif chr == "[" then
				state = state..".array"
				chr = "{"
			elseif chr == "}" then
				state = state:sub(1, -7)
			elseif chr == "]" then
				chr = "}"
				state = state:sub(1, -7)
			elseif chr == "\"" then
				if state:sub(-5) == "table" then
					chr = "_"
				else
					state = state..".strng"
				end
			elseif chr == ":" then
				chr = "="
			elseif chr == "/" and luaResult:sub(-1) == "/" then
				file:read("*l")
				luaResult = luaResult:sub(1, -2)
				chr = "\n"
			end
		elseif chr == "\"" and luaResult:sub(-1) ~= "\\" then
			state = state:sub(1, -7)
		end
		luaResult = luaResult..chr
		chr = file:read(1)
	end
	log(luaResult)
	file:close()
	local name = math.random()..".temporary_file"
	file = io.open(name, "w")
	file:write(luaResult)
	file:flush()
	file:close()
	luaResult = dofile(name)
	os.remove(name)
	local result = {}
	for k, v in pairs(luaResult) do
		result[k:sub(2, -2)] = v
	end
	return result
end

--[[
Since the keys can be modified, we gotta read them from the config file.
They are stored in the config table, same way as the keyboard one.
]]
config = {}
configfile = convertJSON("config.json")
for k, v in pairs(configfile) do
	if k:sub(1, 2) == "t_" then
		k = k:sub(3):upper()
		config[k] = {}
		for _, n in ipairs(v) do
			n = n[1]:upper()
			if n:sub(1, 1) == "K" then
				log(n)
				table.insert(config[k], keyboard[n:sub(2)])
			end
		end
	end
end


--[[
Function that returns a string with the name of the key of the specified ID.

ID: ID of the key to get.
]]
function getKey(id)
	for name, n in pairs(keyboard) do
		if n == id then return name end
	end
	return ""
end

--[[
Function that returns every single key pressed, in the form of an array of booleans.
This array has an offset, due to the fact of the first id for the keyboard (A key) is 0
and the first term of an array is at place 1. So if you want to get the X key from that,
it's at the place [keyboard.X + 1]
]]
function getEveryKeyPressed()
	a = {}
	for i = 1, keyboard.KEY_COUNT do
		a[i] = isKeyPressed(i-1)
	end
	return a
end

--[[
Declaring a list of keys in order to keep trace of which are or aren't pressed.
]]
__keys = {}

--[[
Function that refreshes the array of keys pressed.
Should be ran at the very end of onUpdate.
]]
function updateKeysPressed()
	__keys = getEveryKeyPressed()
end
updateKeysPressed()

--[[
Function that returns true if the specified key was pressed both at this frame and the 
one where updateKeysPressed was last called. Useful to see if a key 
is held during 2 frames. Don't forget to call updateKeysPressed() after.

id: id of the key to check
]]
function isKeyHeld(id)
	cur = getEveryKeyPressed()
	return cur[id+1] and __keys[id+1]
end


--[[
Function that returns true if the specified key was pressed at this frame and NOT at 
the one where updateKeysPressed was last called. Useful to see when a key just got pressed.

id: id of the key to check
]]
function isKeyDown(id)
	return (isKeyPressed(id) and not __keys[id+1])
end

--[[
Function that modifies a string depending of the key pressed, as if you were typing it.
Only works with letters.

str: string to modify
]]
function typeStrL(str)
	if isKeyDown(keyboard.A) then return str.."a"
	elseif isKeyDown(keyboard.B) then return str.."b"
	elseif isKeyDown(keyboard.C) then return str.."c"
	elseif isKeyDown(keyboard.D) then return str.."d"
	elseif isKeyDown(keyboard.E) then return str.."e"
	elseif isKeyDown(keyboard.F) then return str.."f"
	elseif isKeyDown(keyboard.G) then return str.."g"
	elseif isKeyDown(keyboard.H) then return str.."h"
	elseif isKeyDown(keyboard.I) then return str.."i"
	elseif isKeyDown(keyboard.J) then return str.."j"
	elseif isKeyDown(keyboard.K) then return str.."k"
	elseif isKeyDown(keyboard.L) then return str.."l"
	elseif isKeyDown(keyboard.M) then return str.."m"
	elseif isKeyDown(keyboard.N) then return str.."n"
	elseif isKeyDown(keyboard.O) then return str.."o"
	elseif isKeyDown(keyboard.P) then return str.."p"
	elseif isKeyDown(keyboard.Q) then return str.."q"
	elseif isKeyDown(keyboard.R) then return str.."r"
	elseif isKeyDown(keyboard.S) then return str.."s"
	elseif isKeyDown(keyboard.T) then return str.."t"
	elseif isKeyDown(keyboard.U) then return str.."u"
	elseif isKeyDown(keyboard.V) then return str.."v"
	elseif isKeyDown(keyboard.W) then return str.."w"
	elseif isKeyDown(keyboard.X) then return str.."x"
	elseif isKeyDown(keyboard.Y) then return str.."y"
	elseif isKeyDown(keyboard.Z) then return str.."z"
	elseif str ~= "" and isKeyDown(keyboard.BACKSPACE) then return string.sub(str, 1, -2)
	else return str
	end
end

--[[
Function that modifies a string depending of the key pressed, as if you were typing it.
Only works with numbers.

str: string to modify
]]
function typeStrN(str)
	if isKeyDown(keyboard.NUM0) or isKeyDown(keyboard.NUMPAD0) then return str.."0"
	elseif isKeyDown(keyboard.NUM1) or isKeyDown(keyboard.NUMPAD1) then return str.."1"
	elseif isKeyDown(keyboard.NUM2) or isKeyDown(keyboard.NUMPAD2) then return str.."2"
	elseif isKeyDown(keyboard.NUM3) or isKeyDown(keyboard.NUMPAD3) then return str.."3"
	elseif isKeyDown(keyboard.NUM4) or isKeyDown(keyboard.NUMPAD4) then return str.."4"
	elseif isKeyDown(keyboard.NUM5) or isKeyDown(keyboard.NUMPAD5) then return str.."5"
	elseif isKeyDown(keyboard.NUM6) or isKeyDown(keyboard.NUMPAD6) then return str.."6"
	elseif isKeyDown(keyboard.NUM7) or isKeyDown(keyboard.NUMPAD7) then return str.."7"
	elseif isKeyDown(keyboard.NUM8) or isKeyDown(keyboard.NUMPAD8) then return str.."8"
	elseif isKeyDown(keyboard.NUM9) or isKeyDown(keyboard.NUMPAD9) then return str.."9"
	elseif str ~= "" and isKeyDown(keyboard.BACKSPACE) then return string.sub(str, 1, -2)
	else return str
	end
end

--[[
Function that modifies a string depending of the key pressed, as if you were typing it.
Only letters and numbers.

str: string to modify
]]
function typeStr(str)
	local nstr = typeStrL(str)
	if str == nstr then
		str = typeStrN(str)
	else
		str = nstr
	end
	return str
end

--[[
Function that checks if the player is pressing a key linked some action
command: one of the following, not case sensitive:
	* "rotate_ccw":		rotate left, or counter-clockwise
	* "rotate_cw":		rotate right, or clockwise
	* "focus":			focus mode (slower moves)
	* "exit": 			exit the level
	* "force_restart": 	force restart the level
	* "restart":		restart the level (doesn't work mid-run)
	* "screenshot":		take a screenshot
	* "swap":			swap (OH 2.0 only)
]]
function isDoing(command)
	for i, v in ipairs(config[command:upper()]) do
		if isKeyPressed(v) then return true end
	end
	return false
end

--[[
Same as above, except with isKeyDown to see if the action just started
]]
function startedDoing(command)
	for i, v in ipairs(config[command:upper()]) do
		if isKeyDown(v) then return true end
	end
	return false
end

--[[
Functions to see if the player is moving left, right or any direction.
]]
function isMovingLeft()
	return isDoing("rotate_ccw")
end

function isMovingRight()
	return isDoing("rotate_cw")
end

function isMoving()
	return isMovingLeft() or isMovingRight()
end


--[[
Functions to see if the player is making a new move to the left, the right or any direction.
]]

function startedMovingLeft()
	return startedDoing("rotate_ccw")
end

function startedMovingRight()
	return startedDoing("rotate_cw")
end

function startedMoving()
	return startedMovingLeft() or startedMovingRight()
end