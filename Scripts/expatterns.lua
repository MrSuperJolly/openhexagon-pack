execScript("common.lua")

-- Exschwasion's patterns and more (modified versions)

-- pBackAndForth: spawns the back and forth pattern from super hexagon
  -- less thickness for "wall", original = 8 (modified by Hexadorsip)
function pBackAndForth(mTimes, mDelayMult)
	oldThickness = THICKNESS
	myThickness = getPerfectThickness(THICKNESS)
	delay = getPerfectDelay(myThickness) * 5
	startSide = getRandomSide()
	
	THICKNESS = myThickness
	
	for i = 0, mTimes do
		if i < mTimes then
			wall(startSide, myThickness + 6 * getSpeedMult() * delay)
			wall(startSide+(getSides()/2), myThickness + 6 * getSpeedMult() * delay)
		end
		
		rWallThick(startSide+1, oldThickness*2)
		wait(delay*0.5*mDelayMult)
		rWallThick(startSide+2, oldThickness*2)
		wait(delay*0.5*mDelayMult)
		
	end
	
	THICKNESS = oldThickness
	wait(delay)
end

--it's the weird pattern from super hexagon where you turn 3 then turn 2 then turn 1
function pWrapAround(mDelayMult)
	oldThickness = THICKNESS
	myThickness = getPerfectThickness(THICKNESS)
	delay = getPerfectDelay(myThickness) * 5 * mDelayMult
	startSide = getRandomSide()
	
	THICKNESS = myThickness
	
	cWallEx(startSide, getSides() - 2)
	wait(delay)
	cWallEx(startSide + getHalfSides(), getSides() - 2)
	cWallExThick(startSide + getHalfSides() + 1, getSides() - 4, THICKNESS*2.5)
	wall(startSide - 1, myThickness + 8 * getSpeedMult() * delay)
	wait(delay)
	cWallEx(startSide  + 1, getSides() - 4)
	wall(startSide + 2, THICKNESS*2)
	wait(delay*0.7)
	cWallEx(startSide + getHalfSides() + 1, getSides() - 4)
	
	
	THICKNESS = oldThickness
	wait(delay)
end

-- pHeptWrapAround (original name: pWrapAroundOdd)
function pHeptWrapAround(mDelayMult)
	oldThickness = THICKNESS
	myThickness = getPerfectThickness(THICKNESS)
	delay = getPerfectDelay(myThickness) * 5 * mDelayMult
	startSide = getRandomSide()
	
	THICKNESS = myThickness
	
	cWallEx(startSide, getSides() - 2)
	wait(delay)
	cWallEx(startSide + getHalfSides(), getSides() - 3)
	cWallExThick(startSide + getHalfSides() + 1, getSides() - 5, THICKNESS*2.5)
	wall(startSide - 1, myThickness + 8 * getSpeedMult() * delay)
	wait(delay)
	cWallEx(startSide + 1, getSides() - 4)
	--wall(startSide + 2, THICKNESS*2)
	wait(delay*0.7)
	cWallEx(startSide + getHalfSides(), getSides() - 3)
	
	
	THICKNESS = oldThickness
	wait(delay)
end

-- pTunnelDouble: doubly thick wall to rotate around
function pTunnelDouble(mTimes)
	oldThickness = THICKNESS
	myThickness = getPerfectThickness(THICKNESS)
	delay = getPerfectDelay(myThickness) * 3.6
	startSide = getRandomSide()
	loopDir = getRandomDir()
	
	THICKNESS = myThickness
	
	for i = 0, mTimes do
		if i < mTimes then
			wall(startSide, myThickness + 17 * getSpeedMult() * delay)
			wall(startSide+1, myThickness + 17 * getSpeedMult() * delay)
		end
		
		cBarrage(startSide + 5)
		wait(delay*1.1)
		cBarrage(startSide + 2)
		wait(delay*1.1)
		
	end
	
	THICKNESS = oldThickness
end

-- same pattern with mDelayMult (by Hexadorsip)
function pDMTunnelDouble(mTimes, mDelayMult)
	oldThickness = THICKNESS
	myThickness = getPerfectThickness(THICKNESS)
	delay = getPerfectDelay(myThickness) * 6
	startSide = getRandomSide()
	loopDir = getRandomDir()
	
	THICKNESS = myThickness
	
	for i = 0, mTimes do
		if i < mTimes then
			wall(startSide, myThickness + 4 * getSpeedMult() * delay)
			wall(startSide + 1, myThickness + 4 * getSpeedMult() * delay)
		end
		
		if loopDir == 1 then
		cWallEx(startSide + 2 + loopDir, getSides() - 6)
		cWallEx(startSide + 3 + loopDir, getSides() - 6)
		cWallEx(startSide + 4 + loopDir, getSides() - 6)
		wait(delay*mDelayMult)
		
		loopDir = loopDir * -1
		
		elseif loopDir == -1 then
		cWallEx(startSide + 4, getSides() - 6)
		cWallEx(startSide + 3, getSides() - 6)
		cWallEx(startSide + 2, getSides() - 6)
		wait(delay*mDelayMult)
		end
	end
	
	wait(delay)
	THICKNESS = oldThickness
end

function pTunnelTriple(mTimes)
	oldThickness = THICKNESS
	myThickness = getPerfectThickness(THICKNESS)
	delay = getPerfectDelay(myThickness) * 3.6
	startSide = getRandomSide()
	loopDir = getRandomDir()
	
	THICKNESS = myThickness
	
	for i = 0, mTimes do
		if i < mTimes then
			wall(startSide, myThickness + 6 * getSpeedMult() * delay)
			wall(startSide+1, myThickness + 6 * getSpeedMult() * delay)
			wall(startSide+2, myThickness + 6 * getSpeedMult() * delay)
		end
		
		cBarrage(startSide + 1 + 2*loopDir)
		wait(delay)
		
		loopDir = loopDir * -1
		
	end
	
	THICKNESS = oldThickness
end

-- same pattern with mDelayMult (by Hexadorsip)
function pDMTunnelTriple(mTimes, mDelayMult)
	oldThickness = THICKNESS
	myThickness = getPerfectThickness(THICKNESS)
	delay = getPerfectDelay(myThickness) * 5
	startSide = getRandomSide()
	loopDir = getRandomDir()
	
	THICKNESS = myThickness
	
	for i = 0, mTimes do
		if i < mTimes then
			wall(startSide, myThickness + 4 * getSpeedMult() * delay)
			wall(startSide+1, myThickness + 4 * getSpeedMult() * delay)
			wall(startSide+2, myThickness + 4 * getSpeedMult() * delay)
		end
		
		cBarrage(startSide + 1 + 2*loopDir)
		wait(delay*mDelayMult)
		
		loopDir = loopDir * -1
		
	end
	
	wait(delay)
	THICKNESS = oldThickness
end

-- pTunnelShort: the fast tunnel pattern from hexagoner
function pTunnelShort(mTimes)
	oldThickness = THICKNESS
	myThickness = getPerfectThickness(THICKNESS)
	delay = getPerfectDelay(myThickness) * 3.6
	startSide = getRandomSide()
	
	THICKNESS = myThickness
	
	for i = 0, mTimes do
		if i < mTimes then
			wall(startSide, myThickness + 10 * getSpeedMult() * delay)
		end
		
		cWallExThick(startSide + 3, getSides() - 4, oldThickness)
		wait(delay*0.65)
		cWallExThick(startSide - 5, getSides() - 4, oldThickness)
		wait(delay*0.65)
		
	end
	wait(delay*2)
	THICKNESS = oldThickness
end

-- same pattern with mDelayMult (by Hexadorsip)
function pDMTunnelShort(mTimes, mDelayMult)
	oldThickness = THICKNESS
	myThickness = getPerfectThickness(THICKNESS)
	delay = getPerfectDelay(myThickness) * 3.6
	delay2 = getPerfectDelay(myThickness) * 5.8
	startSide = getRandomSide()
	
	THICKNESS = myThickness
	
	for i = 0, mTimes do
		if i < mTimes then
			wall(startSide, myThickness + 10 * getSpeedMult() * delay)
		end
		
		cWallExThick(startSide + 3, getSides() - 4, oldThickness)
		wait(delay*0.65*mDelayMult)
		cWallExThick(startSide - 5, getSides() - 4, oldThickness)
		wait(delay*0.65*mDelayMult)
		
	end
	wait(delay2)
	THICKNESS = oldThickness
end