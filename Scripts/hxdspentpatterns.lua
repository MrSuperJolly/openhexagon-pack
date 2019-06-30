execScript("common.lua")

-- Hexadorsip's patterns. Inspired by Exschwasion and Super Hexagon. (if sides = 5)

-- pPentInverseBarrage43Sid: spawns two barrages (4 and 3 sides) that force you to turn 180 degrees
function pPentInverseBarrage43Sid(mTimes, mDelayMult)
	delay = getPerfectDelay(THICKNESS) * 5 * mDelayMult
	startSide = getRandomSide()
	
	for i = 0, mTimes do
		cWallEx(startSide, getSides() - 2)
		wait(delay*mDelayMult)
		cWallEx(startSide + getHalfSides(), getSides() - 3)
		wait(delay*mDelayMult)
	end
	
	wait(getPerfectDelay(THICKNESS) * 2.5)
end

-- same pattern with 3 and 2 sides
function pPentInverseBarrage32Sid(mTimes, mDelayMult)
	delay = getPerfectDelay(THICKNESS) * 5 * mDelayMult
	startSide = getRandomSide()
	
	for i = 0, mTimes do
		cWallEx(startSide, getSides() - 3)
		wait(delay*mDelayMult)
		cWallEx(startSide + getHalfSides(), getSides() - 4)
		wait(delay*mDelayMult)
	end
	
	wait(getPerfectDelay(THICKNESS) * 2.5)
end

function pPentTunnelDouble(mTimes, mDelayMult)
	oldThickness = THICKNESS
	myThickness = getPerfectThickness(THICKNESS)
	delay = getPerfectDelay(myThickness) * 4.5
	startSide = getRandomSide()
	loopDir = getRandomDir()
	
	THICKNESS = myThickness
	
	for i = 0, mTimes do
		if i < mTimes then
			wall(startSide, myThickness + 14 * getSpeedMult() * delay)
			wall(startSide + 1, myThickness + 14 * getSpeedMult() * delay)
		end
		
		cBarrage(startSide + 4)
		wait(delay*1.1*mDelayMult)
		cBarrage(startSide + 2)
		wait(delay*1.1*mDelayMult)
		
		loopDir = loopDir * -1
	end
	
	THICKNESS = oldThickness
	wait(delay)
end

function pTknsPentTunnelDouble(mTimes, mDelayMult)
	oldThickness = THICKNESS
	myThickness = getPerfectThickness(THICKNESS)
	delay = getPerfectDelay(myThickness) * 4.5
	startSide = getRandomSide()
	loopDir = getRandomDir()
	
	THICKNESS = myThickness
	
	for i = 0, mTimes do
		if i < mTimes then
			wall(startSide, myThickness + 13 * getSpeedMult() * delay)
			wall(startSide + 1, myThickness + 14 * getSpeedMult() * delay)
		end
		
		cBarrage(startSide + 4)
		wait(delay*1.1*mDelayMult)
		cBarrage(startSide + 2)
		wait(delay*1.1*mDelayMult)
		
		loopDir = loopDir * -1
	end
	
	THICKNESS = oldThickness
	wait(delay)
end

function pPentTunnelTriple(mTimes, mDelayMult)
	oldThickness = THICKNESS
	myThickness = getPerfectThickness(THICKNESS)
	delay = getPerfectDelay(myThickness) * 3.5
	startSide = getRandomSide()
	loopDir = getRandomDir()
	
	THICKNESS = myThickness
	
	for i = 0, mTimes do
		if i < mTimes then
			wall(startSide, myThickness + 5 * getSpeedMult() * delay)
			wall(startSide+1, myThickness + 5 * getSpeedMult() * delay)
			wall(startSide+2, myThickness + 5 * getSpeedMult() * delay)
		end
		
		cBarrage(startSide + 1 + 2*loopDir)
		wait(delay*mDelayMult)
		
		loopDir = loopDir * -1
		
	end
	
	THICKNESS = oldThickness
	wait(delay*1.3)
end

function pTknsPentTunnelTriple(mTimes, mDelayMult)
	oldThickness = THICKNESS
	myThickness = getPerfectThickness(THICKNESS)
	delay = getPerfectDelay(myThickness) * 3.5
	startSide = getRandomSide()
	loopDir = getRandomDir()
	
	THICKNESS = myThickness
	
	for i = 0, mTimes do
		if i < mTimes then
			wall(startSide, myThickness + 4 * getSpeedMult() * delay)
			wall(startSide+1, myThickness + 5 * getSpeedMult() * delay)
			wall(startSide+2, myThickness + 6 * getSpeedMult() * delay)
		end
		
		cBarrage(startSide + 1 + 2*loopDir)
		wait(delay*mDelayMult)
		
		loopDir = loopDir * -1
		
	end
	
	THICKNESS = oldThickness
	wait(delay*1.5)
end

-- pPentBat: the bat pattern from Super Hexagon where you have to turn left-left or right-right (2-spin)
function pPentBat(mDelayMult)
	oldThickness = THICKNESS
	myThickness = getPerfectThickness(THICKNESS)
	delay = getPerfectDelay(myThickness) * 5 * mDelayMult
	startSide = getRandomSide()
	
	THICKNESS = myThickness
	
	cWallExThick(startSide + 1, getSides() - 5, THICKNESS*1.4)
	cWallExThick(startSide + 2, getSides() - 5, THICKNESS*3.5)
	cWallExThick(startSide + 3, getSides() - 5, THICKNESS*1.4)
	wait(delay)
	wall(startSide + getHalfSides() + 1, THICKNESS*1.4)
	wall(startSide + getHalfSides() + 2, THICKNESS*1.4)	
	wait(delay*0.17)
	wall(startSide + getHalfSides(), THICKNESS*1.4)
	wall(startSide + getHalfSides() + 3, THICKNESS*1.4)
	wait(delay*0.17)

	THICKNESS = oldThickness
	wait(delay)
end