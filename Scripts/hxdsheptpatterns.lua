execScript("common.lua")

-- Hexadorsip's patterns. Inspired by Exschwasion and Super Hexagon. (if sides = 7)

-- pHeptInverseBarrage65Sid: spawns two barrages (6 and 5 sides) that force you to turn 180 degrees
function pHeptInverseBarrage65Sid(mTimes, mDelayMult)
	delay = getPerfectDelay(THICKNESS) * 5.5 * mDelayMult
	startSide = getRandomSide()
	
	for i = 0, mTimes do
		cWallEx(startSide, getSides() - 2)
		wait(delay*mDelayMult)
		cWallEx(startSide + getHalfSides(), getSides() - 3)
		wait(delay*mDelayMult)
	end
	
	wait(getPerfectDelay(THICKNESS) * 2.5)
end

-- same pattern with 5 and 4 sides
function pHeptInverseBarrage54Sid(mTimes, mDelayMult)
	delay = getPerfectDelay(THICKNESS) * 4.5 * mDelayMult
	startSide = getRandomSide()
	
	for i = 0, mTimes do
		cWallEx(startSide, getSides() - 3)
		wait(delay*mDelayMult)
		cWallEx(startSide + getHalfSides(), getSides() - 4)
		wait(delay*mDelayMult)
	end
	
	wait(getPerfectDelay(THICKNESS) * 2.5)
end

-- same pattern with 4 and 3 sides
function pHeptInverseBarrage43Sid(mTimes, mDelayMult)
	delay = getPerfectDelay(THICKNESS) * 3.5 * mDelayMult
	startSide = getRandomSide()
	
	for i = 0, mTimes do
		cWallEx(startSide, getSides() - 4)
		wait(delay*mDelayMult)
		cWallEx(startSide + getHalfSides(), getSides() - 5)
		wait(delay*mDelayMult)
	end
	
	wait(getPerfectDelay(THICKNESS) * 2.5)
end

function pHeptBackAndForth(mTimes, mDelayMult)
	oldThickness = THICKNESS
	myThickness = getPerfectThickness(THICKNESS)
	delay = getPerfectDelay(myThickness) * 5
	startSide = getRandomSide()
	
	THICKNESS = myThickness
	
	for i = 0, mTimes do
		if i < mTimes then
			wall(startSide, myThickness + 10 * getSpeedMult() * delay)
			wall(startSide + 3, myThickness + 10 * getSpeedMult() * delay)
			wall(startSide + 4, myThickness + 10 * getSpeedMult() * delay)
			
		end
		
		cWallEx(startSide + 2, getSides() - 4, oldThickness)
		wait(delay*0.5*mDelayMult)
		cWallEx(startSide + 6, getSides() - 5, oldThickness)
		wait(delay*0.5*mDelayMult)
		
	end
	
	THICKNESS = oldThickness
	wait(delay)
end

function pHeptTknsTunnel1Sp(mTimes, mDelayMult)
	oldThickness = THICKNESS
	myThickness = getPerfectThickness(THICKNESS)
	delay = getPerfectDelay(myThickness) * 5.5
	startSide = getRandomSide()
	loopDir = getRandomDir()
	
	THICKNESS = myThickness
	
	for i = 0, mTimes do
		if i < mTimes then
			wall(startSide, myThickness + 8 * getSpeedMult() * delay)
		end
		
		cWallExThick(startSide + 6, getSides() - 6, THICKNESS*1.5)
		cWallExThick(startSide + 5, getSides() - 6, THICKNESS*1)
		cWallExThick(startSide + 4, getSides() - 6, oldThickness)
		wait(delay*0.65*mDelayMult)
		cWallExThick(startSide - 6, getSides() - 6, THICKNESS*1)
		cWallExThick(startSide - 5, getSides() - 6, oldThickness)
		wait(delay*0.65*mDelayMult)
		
	end
	wait(delay)
	THICKNESS = oldThickness
end

function pHeptTknsTunnelShort(mTimes, mDelayMult)
	oldThickness = THICKNESS
	myThickness = getPerfectThickness(THICKNESS)
	delay = getPerfectDelay(myThickness) * 5.5
	startSide = getRandomSide()
	loopDir = getRandomDir()
	
	THICKNESS = myThickness
	
	for i = 0, mTimes do
		if i < mTimes then
			wall(startSide, myThickness + 9 * getSpeedMult() * delay)
		end
		
		cWallExThick(startSide + 6, getSides() - 6, THICKNESS*1.5)
		cWallExThick(startSide + 5, getSides() - 6, THICKNESS*1)
		cWallExThick(startSide + 4, getSides() - 6, oldThickness)
		wait(delay*0.65*mDelayMult)
		cWallExThick(startSide - 6, getSides() - 6, THICKNESS*1.5)
		cWallExThick(startSide - 5, getSides() - 6, THICKNESS*1)
		cWallExThick(startSide - 4, getSides() - 6, oldThickness)
		wait(delay*0.65*mDelayMult)
		
	end
	wait(delay)
	THICKNESS = oldThickness
end