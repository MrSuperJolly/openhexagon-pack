-- include useful files
execScript("utils.lua")
execScript("common.lua")
execScript("commonpatterns.lua")
execScript("commonpatternsv5.lua")
execScript("mathExtended.lua")

-- this function adds a pattern to the timeline based on a key
function addPattern(mKey)
		if mKey == 0 then pAltBarrage(math.random(2, 4), 2) 
	elseif mKey == 1 then pMirrorSpiral(math.random(2, 5), getHalfSides() - 3)
	elseif mKey == 2 then pBarrageSpiral(math.random(0, 3), 1, 1)
	elseif mKey == 3 then pInverseBarrage(0)
	elseif mKey == 4 then pTunnel(math.random(1, 3))
	elseif mKey == 5 then pRandomBarrageNoRepeats(math.random(3, 5), barrageAdjust)
	end
end

-- shuffle the keys, and then call them to add all the patterns
-- shuffling is better than randomizing - it guarantees all the patterns will be called
keys = { 0, 0, 1, 1, 2, 2, 3, 3, 4, 4, 5, 5 }
keys = shuffle(keys)
index = 0

-- onLoad is an hardcoded function that is called when the level is started/restarted
function onLoad()
	barrageAdjust = 3.5
	barrageAdjust = barrageAdjust*(5/getSides())
	difficultyMult = math.precision(getDifficultyMult(), 2)
	level_time = -0.8

	if difficultyMult == 0.98 then
		setLevelValueFloat("speed_multiplier", 1.6)
	elseif difficultyMult == 0.99 then
		setLevelValueFloat("speed_multiplier", 2)
	elseif difficultyMult == 1 then
		setLevelValueFloat("speed_multiplier", 2.4)
	elseif difficultyMult == 1.01 then
		setLevelValueFloat("speed_multiplier", 2.8)
	elseif difficultyMult == 1.02 then
		setLevelValueFloat("speed_multiplier", 3.2)
	end
	
end

-- onStep is an hardcoded function that is called when the level timeline is empty
-- onStep should contain your pattern spawning logic
function onStep()	
	addPattern(keys[index])
	index = index + 1
	
	if index - 1 == table.getn(keys) then
		index = 1
	end
end

-- onIncrement is an hardcoded function that is called when the level difficulty is incremented
function onIncrement()
end

-- onUnload is an hardcoded function that is called when the level is closed/restarted
function onUnload()
end

-- onUpdate is an hardcoded function that is called every frame
function onStep()	
	addPattern(keys[index])
	index = index + 1
	
	if index - 1 == table.getn(keys) then
		index = 1
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
	level_time = level_time +mFrameTime/60
	level_time_rounded = math.precision(level_time, 1)
	updateLevel(difficultyMult)
end

function updateLevel(difficulty)

	local value = (difficulty - 1) * 20
	local valueAdj = ((difficulty - 1) - 0.02) * 5

	if level_time_rounded > 23.2 and level_time_rounded <= 33.2 or level_time_rounded > 57.2 and level_time_rounded <= 67.2 or level_time_rounded > 91.2 and level_time_rounded <= 101.2 then
		if math.floor(level_time_rounded * 10) % 4 == 0 then
            messageImportantAdd("ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR\n ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR\n ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR\n ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR\n ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR\n ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR\n ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR\n ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR\n ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR\n ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR\n ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR\n ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR\n ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR\n ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR\n ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR\n ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR ERROR\n ", 0)
        end
	end

	if level_time_rounded == 23.2  then
		setLevelValueFloat("rotation_speed", 1 + value)
		execEvent("goodluck")
	end

	if level_time_rounded == 57.2  then
		setLevelValueFloat("rotation_speed", 1.3 + value + valueAdj)
		execEvent("goodluck")
	end

	if level_time_rounded == 91.2 then
		setLevelValueFloat("rotation_speed", 1.6 + value + valueAdj)
		execEvent("goodluck")
	end

	if level_time_rounded == 33.2 or level_time_rounded == 67.2 then
		execEvent("happytreefriends")
		setLevelValueFloat("rotation_speed", 0.1)
	end

	if level_time_rounded > 33.2 and level_time_rounded <= 36.2 then
		messageImportantAdd("we are experiencing", 0)
	end

	if level_time_rounded > 37.2 and level_time_rounded <= 40.2 then
		messageImportantAdd("technical difficulties", 0)
	end

	if level_time_rounded > 41.2 and level_time_rounded <= 44.2 then
		messageImportantAdd("do not change channels", 0)
	end

	if level_time_rounded > 45.2 and level_time_rounded <= 48.2 then
		messageImportantAdd("this will be rectified", 0)
	end

	if level_time_rounded > 67.2 and level_time_rounded <= 70.2 then
		messageImportantAdd("problems have been fixed", 0)
	end

	if level_time_rounded > 71.2 and level_time_rounded <= 74.2 then
		messageImportantAdd("we apologise for the inconvenience", 0)
	end

	if level_time_rounded > 75.2 and level_time_rounded <= 78.2 then
		messageImportantAdd("please enjoy the remainder", 0)
	end

	if level_time_rounded > 79.2 and level_time_rounded <= 82.2 then
		messageImportantAdd("of your programming", 0)
	end

	if level_time_rounded == 101.2 then
		execEvent("static")
		setLevelValueFloat("rotation_speed", 0.00)
	end

	if level_time_rounded > 101.2 and level_time_rounded <= 106.2 then
		messageImportantAdd("this channel will go offline shortly", 0)
	end
 
	if level_time_rounded == 106.2 then
		execEvent("technical_menu")
	end
end