execScript("common.lua")

-- Hexadorsip's patterns. Inspired by Exschwasion and Super Hexagon. (if sides = 4)

-- pSquareSingleSpiral: spawns a spiral of cWallEx
function pSquareSingleSpiral(mTimes, mExtra)
	oldThickness = THICKNESS
	THICKNESS = getPerfectThickness(THICKNESS) * 1.32
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

function pSquareSingleSpiralLeft(mTimes, mExtra)
	oldThickness = THICKNESS
	THICKNESS = getPerfectThickness(THICKNESS) * 1.32
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

-- pSquare2Sp: spawns two barrages that force you to turn left and right (2-spin)
function pSquare2Sp(mTimes, mDelayMult)
	delay = getPerfectDelay(THICKNESS) * 5 * mDelayMult
	startSide = getRandomSide()
	
	for i = 0, mTimes do
		cWallEx(startSide, getSides() - 5)
		wait(delay*mDelayMult)
		cWallEx(startSide + getHalfSides(), getSides() - 5)
		wait(delay*mDelayMult)
	end
	
	wait(getPerfectDelay(THICKNESS) * 2.5)
end

-- same pattern with 3 and 2 sides
function pSquare2Sp32Sid(mTimes, mDelayMult)
	delay = getPerfectDelay(THICKNESS) * 5 * mDelayMult
	startSide = getRandomSide()
	
	for i = 0, mTimes do
		cBarrage(startSide)
		wait(delay*mDelayMult)
		cWallEx(startSide + 1, getSides() - 5)
		wait(delay*mDelayMult)
	end
	
	wait(getPerfectDelay(THICKNESS) * 2.5)
end

function pSquareTunnelDouble(mTimes, mDelayMult)
	oldThickness = THICKNESS
	myThickness = getPerfectThickness(THICKNESS)
	delay = getPerfectDelay(myThickness) * 2.5
	startSide = getRandomSide()
	loopDir = getRandomDir()
	
	THICKNESS = myThickness
	
	for i = 0, mTimes do
		if i < mTimes then
			wall(startSide, myThickness + 14 * getSpeedMult() * delay)
			wall(startSide + 1, myThickness + 14 * getSpeedMult() * delay)
		end
		
		cBarrage(startSide + 2)
		wait(delay*mDelayMult)
		cBarrage(startSide + 3)
		wait(delay*mDelayMult)
		
		loopDir = loopDir * -1
		
	end
	
	THICKNESS = oldThickness
	wait(delay)
end