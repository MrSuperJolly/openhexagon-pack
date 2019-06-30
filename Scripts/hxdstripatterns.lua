execScript("common.lua")

-- Hexadorsip's patterns (if sides = 3)

-- pTriSingleSpiral: spawns a spiral of cWallEx
function pTriSingleSpiral(mTimes, mExtra)
	oldThickness = THICKNESS
	THICKNESS = getPerfectThickness(THICKNESS) * 1.67
	delay = getPerfectDelay(THICKNESS) * 1
	startSide = getRandomSide()
	loopDir = getRandomDir()	
	j = 0
	
	for i = 0, mTimes do
		cWallEx(startSide + j, mExtra)
		j = j + loopDir
		wait(delay)
	end
	
	THICKNESS = oldThickness
	
	wait(getPerfectDelay(THICKNESS) * 6.5)
end

function pTriSingleSpiralLeft(mTimes, mExtra)
	oldThickness = THICKNESS
	THICKNESS = getPerfectThickness(THICKNESS) * 1.67
	delay = getPerfectDelay(THICKNESS) * 1
	startSide = getRandomSide()	
	j = 0
	
	for i = 0, mTimes do
		cWallEx(startSide + j, mExtra)
		j = j - 1
		wait(delay)
	end
	
	THICKNESS = oldThickness
	
	wait(getPerfectDelay(THICKNESS) * 6.5)
end