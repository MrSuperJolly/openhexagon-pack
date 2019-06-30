-- include useful files
execScript("utils.lua")
execScript("common.lua")
execScript("commonpatterns.lua")
execScript("mathExtended.lua")
execScript("commonpatternsv5.lua")

function addPattern(mKey)
	if mKey == 0 then pAltBarrage(math.random(2, 4), 2) 
	elseif mKey == 1 then pMirrorSpiral(math.random(2, 5), getHalfSides() - 3)
	elseif mKey == 2 then pAltBarrage2(math.random(2, 4), 1)
	elseif mKey == 3 then pAltBarrage3(math.random(2, 4), 1.5)
	end
end

keys = { 0, 0, 1, 1, 2, 2, 3, 3 }
keys = shuffle(keys)
index = 0

-- onLoad is an hardcoded function that is called when the level is started/restarted
function onLoad()
	level_time = 2
	level_time_offset = 1
	speed_multiplier = getLevelValueFloat("speed_multiplier")
	fire = false
	randomSide = math.random(0,5)
end

-- onStep is an hardcoded function that is called when the level timeline is empty
-- onStep should contain your pattern spawning logic
function onStep()
	if  fire  then
		fire = false
		cWall(randomSide)
		log("????")
		

	else
		wait(20)
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

	level_time = level_time + mFrameTime / 60
	level_time_rounded_3 = math.precision(level_time, 3)
	level_time_rounded = math.precision(level_time, 1)
	level_time_x = (level_time + mFrameTime / 60) + 1
	level_time_x_rounded = math.precision(level_time, 1)

	
	if (level_time_x_rounded * 10)  % 40 == 0 then
		execEvent("huntede"..tostring(randomSide))
	else
		execEvent('huntede')	
	end

	if (level_time_rounded_3 * 1000)  %  4000 == 0 then

		log("!!!")
		randomSide = math.random(0,5)
		setLevelValueFloat('speed_multiplier',5)
		fire = true
		execEvent('patternwipe')
		
		
		

	else
		
		setLevelValueFloat('speed_multiplier',speed_multiplier)
	end



	if level_time_rounded * 10 % 20 == 0 and not fire then
		
		setLevelValueFloat("speed_multiplier", 5)
		fire = true
		execEvent("patternwipe")
		
	else
		setLevelValueFloat("speed_multiplier", 2)
	end


	if level_time_rounded > 36.2 and level_time_rounded < 38.2 then
		messageImportantAdd("getting closer", 0)
		setLevelValueFloat("rotation_speed", 0.2)
	end

	if level_time_rounded > 116.2 and level_time_rounded < 118.2 then
		messageImportantAdd("right behind you", 0)
		setLevelValueFloat("rotation_speed", -0.4)
	end

	if level_time_rounded > 141.2 and level_time_rounded < 143.2 then
		messageImportantAdd("RUN", 0)
		setLevelValueFloat("rotation_speed", 0.6)
	end

	if level_time_rounded > 172.2 and level_time_rounded < 174.2 then
		messageImportantAdd("you lost him?", 0)
		setLevelValueFloat("rotation_speed", 0)
	end

	if level_time_rounded > 188.2 and level_time_rounded < 190.2 then
		messageImportantAdd("they're right there!", 0)
		setLevelValueFloat("rotation_speed", -0.8)
	end

	if level_time_rounded > 236.2 and level_time_rounded < 238.2 then
		messageImportantAdd("escaped!", 0)
		setLevelValueFloat("rotation_speed", 0.2)
	end

	if level_time_rounded == 240 then
		execEvent("technical_menu")
	end


end
	

