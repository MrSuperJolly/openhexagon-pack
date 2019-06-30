execScript("common.lua")

-- Hexadorsip's patterns. Inspired by Exschwasion and Super Hexagon (if sides = 8)

-- pOctAltBarrageStrip: shorter version of pAltBarrage with cWallEx close to one another on the same side
function pOctAltBarrageStrip(mTimes, mExtra)
	delay = getPerfectDelay(THICKNESS) * 3.65
	startSide = getRandomSide()
	
	for i = 0, mTimes do
		cWallEx(startSide + 1, getSides() - 8, mExtra)
		cWallEx(startSide + 3, getSides() - 8, mExtra)
		cWallEx(startSide + 5, getSides() - 8, mExtra)
		cWallEx(startSide + 7, getSides() - 8, mExtra)
		wait(delay)
	end
	
	wait(getPerfectDelay(THICKNESS) * 5.00)
end

-- pOctBackAndForth: spawns the back and forth pattern from Super Hexagon
function pOctBackAndForth(mTimes, mDelayMult)
	oldThickness = THICKNESS
	myThickness = getPerfectThickness(THICKNESS)
	delay = getPerfectDelay(myThickness) * 5
	startSide = getRandomSide()
	
	THICKNESS = myThickness
	
	for i = 0, mTimes do
		if i < mTimes then
			wall(startSide, myThickness + 9 * getSpeedMult() * delay)
			wall(startSide+1, myThickness + 9 * getSpeedMult() * delay)
			wall(startSide+4, myThickness + 9 * getSpeedMult() * delay)		
			wall(startSide+5, myThickness + 9 * getSpeedMult() * delay)
			
		end
		
		rWallThick(startSide+2, oldThickness*2)
		wait(delay*0.5*mDelayMult)
		rWallThick(startSide+3, oldThickness*2)
		wait(delay*0.5*mDelayMult)
		
	end
	
	THICKNESS = oldThickness
	wait(delay)
end

-- pOctBackAndForthShort: mix between pBackAndForth and pTunnelShort
function pOctBackAndForthShort(mTimes, mDelayMult)
	oldThickness = THICKNESS
	myThickness = getPerfectThickness(THICKNESS)
	delay = getPerfectDelay(myThickness) * 5
	startSide = getRandomSide()
	
	THICKNESS = myThickness
	
	for i = 0, mTimes do
		if i < mTimes then
			wall(startSide, myThickness + 10 * getSpeedMult() * delay)
			wall(startSide+4, myThickness + 10 * getSpeedMult() * delay)
			
		end
		
		cWallExThick(startSide+2, getSides() - 4, oldThickness)
		wait(delay*0.5*mDelayMult)
		cWallExThick(startSide+6, getSides() - 4, oldThickness)
		wait(delay*0.5*mDelayMult)
		
	end
	
	THICKNESS = oldThickness
	wait(delay)
end