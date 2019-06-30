-- include useful files
execScript("utils.lua")
execScript("common.lua")
execScript("commonpatterns.lua")
execScript("KeyboardHelper1.2.lua")
execScript("commonpatternsv5.lua")

-- this function adds a pattern to the timeline based on a key
function addPattern(mKey)
		if mKey == 0 then pAltBarrage(math.random(2, 4), 2) 
	elseif mKey == 1 then pBarrageSpiral(math.random(0, 3), 1, 1)
	elseif mKey == 2 then pInverseBarrage(0)
	elseif mKey == 3 then pTunnel(math.random(1, 3))
	elseif mKey == 4 then pRandomBarrageNoRepeats(math.random(5, 8), barrageAdjust)
	end
end

-- shuffle the keys, and then call them to add all the patterns
-- shuffling is better than randomizing - it guarantees all the patterns will be called
keys = { 0, 0, 0, 1, 1, 2, 2, 3, 3, 4, 4 }
keys = shuffle(keys)
index = 0

-- onLoad is an hardcoded function that is called when the level is started/restarted
function onLoad()
	--eventExec("prevent_walls")
	input = ""
	cursor = "_"
	frame = 50
	
	styles = {"blacknwhite", "rainbowfill", "typicallevel", "colourwheel", "cancer"}
	barrageAdjust = 3.0
	wall_side_str = "Choose your side... count: \n(recommended 3-12)\n\n"
	wall_speed_str = "wall speed: \n(recommended 1-4)\n\n"
	rotation_speed_str = "rotation: \n(recommended 0-1.5)\n\n"
	pulse_min_str = "pulse enter min: \n(recommended x>10)\n\nif you don't want pulse, \njust put the same for min and max\n\n \tdon't put 0\n\n"
	pulse_max_str = "pulse enter max: \n(recommended not more than 2x min)\n\n"
	style_str = "pick a premade style: \n 1. Black n White \n 2. Rainbow Fill \n 3. The Current One \n 4. Random Colour Wheel \n 5. Cancer\n\n"

	questions = {wall_side_str, wall_speed_str, rotation_speed_str, pulse_min_str, pulse_max_str, style_str}
	answers = {}
	order = 1
	levelStarted = false
end

-- onStep is an hardcoded function that is called when the level timeline is empty
-- onStep should contain your pattern spawning logic
function onStep()
if levelStarted then
	addPattern(keys[index])
	index = index + 1

	if index - 1 == table.getn(keys) then
		index = 1
	end
end
end

-- onIncrement is an hardcoded function that is called when the level difficulty is incremented
function onIncrement()
end

-- onUnload is an hardcoded function that is called when the level is closed/restarted
function onUnload()
end


-- onUpdate is an hardcoded function that is called every frame
function onUpdate(mFrameTime)

	if levelStarted ~= true then
		
		--this is the cursor animation
		frame = frame + 1
		if frame % 750 == 0 then
			if cursor == " " then
				cursor = "_"
			else
				cursor = " "
			end	
		end
		--this is the cursor animation

		if order <= #questions then
			updateDisplay(questions[order])

			-- previews
			if questions[order] == rotation_speed_str then

				rotationNumber = tonumber(input)
				setLevelValueFloat("rotation_speed", rotationNumber)

			end

			if questions[order] == style_str then

				styleNumber = tonumber(input)

				if styleNumber ~= nil and styleNumber > 0 and styleNumber < 6 then
					execEvent(styles[styleNumber])
				else
					execEvent(styles[3])
				end
			end

			if questions[order] == wall_side_str then

				sideNumber = tonumber(input)

				setLevelValueInt("sides", sideNumber)
			end

			if isKeyDown(keyboard.ENTER) then
		
				value  = getValue()

				if value  ~= nil then
					answers[questions[order]] = value
					order = order  + 1 
					input = ""
			
				end
			end
		end

		

		if order > #questions then
			initialiseLevel(answers)
		end
		updateKeysPressed()
	end

	
end

function initialiseLevel(variables)

	
	setLevelValueInt("sides", variables[wall_side_str])
	setLevelValueFloat("speed_multiplier", variables[wall_speed_str])
	setLevelValueFloat("rotation_speed", variables[rotation_speed_str])
	setLevelValueFloat("pulse_min", variables[pulse_min_str])
	setLevelValueFloat("pulse_max", variables[pulse_max_str])
	execEvent(styles[variables[style_str]])
	barrageAdjust = barrageAdjust*(5/getSides())
		--5 at 3 sides, 3 at 5 sides, 1.875 at 8 sides
	execEvent("legendkeeperbegin")
	onStep()
	levelStarted = true
end

function getValue()

	if input ~= nil then

		number = tonumber(input)

		if (number > 5 or number < 1) and (questions[order] == style_str) then
			return nil
		end

		

		return number
	end


	return nil

end


function updateDisplay(question)

	if questions[order] == wall_speed_str or questions[order] == rotation_speed_str or questions[order] == pulse_min_str or questions[order] == pulse_max_str then
		input = typeStrNplus(input)
	else
		input = typeStrN(input)
	end
		
	messageImportantAdd(question..input..cursor, 0)
end

function typeStrNplus(str)
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
	elseif isKeyDown(keyboard.PERIOD) then return str.."."
	elseif str ~= "" and isKeyDown(keyboard.BACKSPACE) then return string.sub(str, 1, -2)
	else return str
	end
end