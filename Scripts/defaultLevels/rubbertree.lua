-- include useful files
execScript("utils.lua")
execScript("common.lua")
execScript("commonpatterns.lua")
execScript("commonpatternsv5.lua")
execScript("hxdstripatterns.lua")
execScript("hxdssquarepatterns.lua")
execScript("hxdspentpatterns.lua")
execScript("hxdshexpatterns.lua")
execScript("hxdsheptpatterns.lua")
execScript("hxdsoctpatterns.lua")
execScript("expatterns.lua")
execScript("expatterns3.lua")
execScript("quantumoct.lua")
execScript("quantumenn.lua")
execScript("KeyboardHelper1.2.lua")

-- this function adds a pattern to the timeline based on a key
function addPattern(mKey)

	--THIS STILL NEEDS CHANGES, MAKE LOWER DIFFICULTIES ACTUALLY PLAYABLE (add delay mult.)
	if mKey == 0 and getSides() ~= 9 then pAltBarrage(math.random(2, 4), 2)
	elseif mKey == 1 then pBarrageSpiral(math.random(0, 3), 1, 1)
	elseif mKey == 2 then pDMInverseBarrage(0, 1.2)
	elseif mKey == 3 then pRandomBarrageNoRepeats(math.random(5, 8), barrageAdjust) --equal difficulty on all sides
	elseif mKey == 4 then pBarrageSpiralLR(math.random(2, 3), 1)
	elseif mKey == 5 and getSides() == 3 then pDMTunnel(math.random(2, 5), 0.65) wait(7)
	elseif mKey == 5 and getSides() > 3 then pDMTunnel(math.random(2, 5), tunnelAdjust) --equal difficulty on all sides
	elseif mKey == 6 and getSides() >= 5 and getSides() ~= 9 and getSides() ~= 7 then pMirrorSpiral(math.random(2, 5), getHalfSides() - 3)
	elseif mKey == 7 and getSides() % 2 == 0 then pRandomWallExVortexNoRepeats(math.random(2, 5), getHalfSides() - 2, barrageAdjust)
	elseif mKey == 8 and getSides() == 3 then pTriSingleSpiral(math.random(4, 7), 0)
	elseif mKey == 9 and getSides() == 4 then pSquare2Sp(math.random(1, 3), 1.1)
	elseif mKey == 10 and getSides() == 5 then pPentInverseBarrage43Sid(math.random(1, 2), 1.21)
	elseif mKey == 11 and getSides() == 6 then pAltBarrage3(math.random(2, 4), 2)
	elseif mKey == 12 and getSides() == 7 then pHeptBackAndForth(math.random(2, 3), 1)--0.58
	elseif mKey == 13 and getSides() == 9 then pTripleSpiral(math.random(3, 6))
	elseif mKey == 14 and getSides() == 9 then pBackAndForthTriple2(math.random(1,2), 1)
	elseif mKey == 15 and getSides() == 9 then pVortexTriple2(1)
	end
end

-- shuffle the keys, and then call them to add all the patterns
-- shuffling is better than randomizing - it guarantees all the patterns will be called
keys = { 0, 0, 1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7, 8, 8, 9, 9, 10, 10, 11, 11, 12, 12, 13, 13, 14, 14, 15, 15 }
keys = shuffle(keys)
index = 0

-- onLoad is an hardcoded function that is called when the level is started/restarted
function onLoad()
					
	lastLevelPlayed = getLastLevelPlayed()
	oldLevel = lastLevelPlayed[1]
	oldDifficulty = tonumber(lastLevelPlayed[2])		

		
	victoryMessage = nil
	level_time = 0
	LevelSelect = true
	selectLevel = true
	levelComplete = false
	selectDifficulty = false
	barrageAdjust = 3.0
	tunnelAdjust = 0.9
	difficultyValue = 1
	red_level = newLevel("red", -0.2, 3, 3, 3, 2, "redrubberevent")
	orange_level = newLevel("orange", 0.3, 4, 4, 4, 2, "orangerubberevent")
	yellow_level = newLevel("yellow", -0.4, 5, 5, 5, 2,  "yellowrubberevent")
	green_level = newLevel("green", 0.5, 6, 6, 6, 2, "greenrubberevent")
	blue_level = newLevel("blue", -0.6, 7, 7, 7, 2, "bluerubberevent")
	indigo_level = newLevel("indigo", 0.7, 8, 8, 8, 2, "indigorubberevent")
	violet_level = newLevel("violet", -0.8, 9, 9, 9, 2, "violetrubberevent")
	ultraviolet_level = newLevel("ultraviolet", 1.0, 10, 10, 10, 2, "ultravioletrubberevent")
	
	levelList = {red_level, orange_level, yellow_level, green_level, blue_level, indigo_level, violet_level, ultraviolet_level}

	for k ,v in pairs(levelList) do
		
		v.menuString = ""

		if isUnlocked(v.id) then
			v.menuString = "\t"..v.id.."\n"
		else
			v.menuString = "--LOCKED--\n"
		end

		if v.id == lastLevelPlayed[1] then
			oldLevel = v
			oldLevelValue = k
		end


	end

	error_str = ""
	input = ""

	if isUnlocked(levelList[7].id) then
		secretLevel_str = "\n8"..ultraviolet_level.menuString
	else
		secretLevel_str = "\t\t\n???\n"
	end

	chooseALevel_str = "LEVEL SELECT\n\n1. "..levelList[1].menuString.."2"..levelList[2].menuString.."3"..levelList[3].menuString.."4"..levelList[4].menuString.."5"..levelList[5].menuString.."6"..levelList[6].menuString.."7"..levelList[7].menuString..secretLevel_str.."\n\n"
	selectDifficulty_str = "DIFFICULTY\nchoose between 0 and 1\nif you win on 1, you can go higher!\n\n\n"
	

end

-- onStep is an hardcoded function that is called when the level timeline is empty
-- onStep should contain your pattern spawning logic
function onStep()
	if levelSelect == false then	
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

	

	if LevelSelect then

		if selectLevel then
			updateDisplay(chooseALevel_str)	

			if isKeyDown(keyboard.DOWN) then

				difficultyValue = oldDifficulty
				chosenLevel = oldLevel
				levelValue = oldLevelValue
				initialiseLevel(oldLevel, oldDifficulty)
				
			end

			if isKeyDown(keyboard.ENTER) then

				levelValue  = getValue()

				if levelValue ~= nil and levelValue > 0 and levelValue <= #levelList then
					
					

					if isUnlocked(levelList[levelValue].id) then
						chosenLevel = levelList[levelValue]
						
						selectDifficulty = true
						selectLevel = false
						input = ""
						error_str = ""
					else
						error_str = "\nLevel is locked"
						
					end

				else
					error_str = "\nthis level does not exist"
				end


			end
		end

		if selectDifficulty then
			updateDisplay(selectDifficulty_str)

			if isKeyDown(keyboard.ENTER) then

				difficultyValue  = getValue()

				if difficultyValue ~= nil then
					if isDifficultyUnlocked(chosenLevel.id) or (difficultyValue > 0 and difficultyValue <= 1) then
						
						
						initialiseLevel(chosenLevel, difficultyValue)
					else
						error_str = "\nonly difficulties 0 - 1 unlocked"
					end
				end


			end

			
		
		end
	 
		
	end

	if levelSelect == false then

		level_time = level_time + mFrameTime/60

		if levelComplete == false then
		
			
			messageImportantAdd(math.floor(level_time*10) / 10, 0)

			if level_time >= 60 then
				levelComplete = true
			end

		elseif level_time <= 63 then

			if difficultyValue == 1 then

				if levelValue < #levelList then
					

					if isUnlocked(levelList[levelValue + 1].id) and victoryMessage == nil then

						victoryMessage = "you won"
					
					elseif victoryMessage == nil then
					
						unlockLevel(levelList[levelValue + 1].id)
						unlockDifficulty(chosenLevel.id)
						victoryMessage = "You won next level Unlocked"
						
					else
						messageImportantAdd(victoryMessage, 0)
					end

					

				else
					messageImportantAdd("Game Complete", 0)
				end

			elseif difficultyValue > 1 then 
				messageImportantAdd("You beat the level on " ..difficultyValue.. " MadMan", 0)

			elseif difficultyValue < 1 then
				messageImportantAdd("Set difficulty to 1\n to unlock new levels", 0)
			end
			
			

			
		else

			
			messageImportantAdd(math.floor(level_time*10) / 10, 0)
			

			
		
		end

		
	end

	
	updateKeysPressed()


end

function setLastLevelPlayed(level, difficulty)
	local file =  assert(io.open([[Packs\level_tester\Scripts\defaultLevels\lastLevelPlayed.txt]], "w"))
	file:write(level.id.." "..tostring(difficulty))
	file:close()
end


function getLastLevelPlayed()
	local file = assert(io.open([[Packs\level_tester\Scripts\defaultLevels\lastLevelPlayed.txt]], "r"))
	local content = file:read("*a")
	file:close()

	local values = mysplit(content , " ")
	return values

end

function isUnlocked(id)


	local locked = {}

	for line in io.lines([[Packs\level_tester\Scripts\defaultLevels\lockedlevels.txt]]) do
	
		local thisLine = mysplit(line, " ")
		
		if string.lower(thisLine[1]) == string.lower(id) then

			if string.lower(thisLine[2]) == "false" then
				return false
			end

			if string.lower(thisLine[2]) == "true" then
				return true
			end
		end
	end

end

function isDifficultyUnlocked(id)


	local locked = {}

	for line in io.lines([[Packs\level_tester\Scripts\defaultLevels\lockedlevels.txt]]) do
	
		local thisLine = mysplit(line, " ")
		
		if string.lower(thisLine[1]) == string.lower(id) then

			if string.lower(thisLine[3]) == "false" then
				return false
			end

			if string.lower(thisLine[3]) == "true" then
				return true
			end
		end
	end

end

function unlockDifficulty(id)

	local output = ""
	count = 0
	local data = {}

	for line in io.lines([[Packs\level_tester\Scripts\defaultLevels\lockedlevels.txt]]) do

		count = count + 1
		local thisLine = mysplit(line, " ")
		data[count] = thisLine
		

	end

	
	for i = 1 , #data, 1 do
		
		if data[i][1] == id then
			output = output..data[i][1].." "..data[i][2].." true\n"
		else
			output = output..data[i][1].." "..data[i][2].." "..data[i][3].."\n"
		end

	end

	local file = assert(io.open([[Packs\level_tester\Scripts\defaultLevels\lockedlevels.txt]], "w"))
	file:write(output)
	file:close()

end

function unlockLevel(id)

	local output = ""
	count = 0
	local data = {}

	for line in io.lines([[Packs\level_tester\Scripts\defaultLevels\lockedlevels.txt]]) do

		count = count + 1
		local thisLine = mysplit(line, " ")
		data[count] = thisLine
		

	end

	for i = 1 , #data, 1 do
	
		if data[i][1] == id then
			output = output..data[i][1].." true "..data[i][3].."\n"
		else
			output = output..data[i][1].." "..data[i][2].." "..data[i][3].."\n"
		end

	end

	local file = assert(io.open([[Packs\level_tester\Scripts\defaultLevels\lockedlevels.txt]], "w"))
	file:write(output)
	file:close()

end

function updateDisplay(question)

	if selectLevel then
		input = typeStrN(input)
		messageImportantAdd(question..input..error_str, 0)
	end

	if selectDifficulty then
		input = typeStrNplus(input)
		messageImportantAdd(question..input..error_str, 0)
	end
end

function getValue()

	number = tonumber(input)
	return number

end

function mysplit(inputstr, sep)
	if sep == nil then
			sep = "%s"
	end
	local t={}
	for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
			table.insert(t, str)
	end
	return t
end

function initialiseLevel(level, difficulty)
	
	selectDifficulty = false
	selectLevel = false
	levelSelect = false
	levelComplete = false
	victoryMessage = nil
	level_time = 0
	setLevelValueInt("sides", level.sides)
	setLevelValueFloat("rotation_speed", level.rotation_speed * difficulty)
	setLevelValueInt("sides_min", level.sides_min)
	setLevelValueInt("sides_max", level.sides_max)
	setLevelValueFloat("speed_multiplier", level.speed_multiplier * difficulty)
	execEvent(level.event_id)
	setLastLevelPlayed(level, difficulty)

	--these adjusts are so the varation in distance between gaps as side number changes are taken into account in the delay
	barrageAdjust = barrageAdjust*(5/level.sides)
	tunnelAdjust = tunnelAdjust * 2 * (getSides()-2) / getSides()
	

	onStep()
	
end

function newLevel(id, rotation_speed, sides, sides_min, sides_max, speed_multiplier ,event_id)

	local object = {}
	object.id = id
	object.rotation_speed = rotation_speed
	object.sides = sides
	object.sides_min = sides_min
	object.sides_max = sides_max
	object.speed_multiplier = speed_multiplier
	object.event_id = event_id
	

	return object

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