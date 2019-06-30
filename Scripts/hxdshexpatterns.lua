execScript("common.lua")

-- Hexadorsip's patterns. Inspired by Exschwasion and Super Hexagon. (if sides = 6)

-- pTknsTunnel: pTunnel pattern with several thicknesses like the tunnel from Hyper Hexagoner
function pTknsTunnel(mTimes, mDelayMult)
	oldThickness = THICKNESS
	myThickness = getPerfectThickness(THICKNESS)
	delay = getPerfectDelay(myThickness) * 4.5
	startSide = getRandomSide()

	THICKNESS = myThickness
	
	for i = 0, mTimes do
		if i < mTimes then
			wall(startSide, myThickness + 19 * getSpeedMult() * delay)
		end

		cWallExThick(startSide + 4, getSides() - 6, oldThickness)
		cWallExThick(startSide + 3, getSides() - 6, THICKNESS*1)
		cWallExThick(startSide + 2, getSides() - 6, THICKNESS*1.5)
		cWallExThick(startSide + 1, getSides() - 6, THICKNESS*2)
		wait(delay*mDelayMult)
		cWallExThick(startSide + 2, getSides() - 6, oldThickness)
		cWallExThick(startSide + 3, getSides() - 6, THICKNESS*1)
		cWallExThick(startSide + 4, getSides() - 6, THICKNESS*1.5)
		cWallExThick(startSide + 5, getSides() - 6, THICKNESS*2)
		wait(delay*mDelayMult)

	end
	wait(delay)
	THICKNESS = oldThickness
end

-- pTunnelDoubleThin: a tunnel that forces you to turn left and right (3-spin)
function pTunnelDoubleThin(mTimes, mDelayMult)
	oldThickness = THICKNESS
	myThickness = getPerfectThickness(THICKNESS)
	delay = getPerfectDelay(myThickness) * 5.5
	startSide = getRandomSide()
	
	THICKNESS = myThickness
	
	for i = 0, mTimes do
		if i < mTimes then
			wall(startSide, myThickness + 12 * getSpeedMult() * delay)
			wall(startSide+1, myThickness + 12 * getSpeedMult() * delay)
		end
		
		cBarrageThick(startSide + 5, oldThickness)
		wait(delay*0.65*mDelayMult)
		cBarrageThick(startSide + 2, oldThickness)
		wait(delay*0.65*mDelayMult)
		
	end
	wait(delay)
	THICKNESS = oldThickness
end

-- pTknsTunnelDouble: the tunnel with several thicknesses from Hyper Hexagoner (3-spin)
function pTknsTunnelDouble(mTimes, mDelayMult)
	oldThickness = THICKNESS
	myThickness = getPerfectThickness(THICKNESS)
	delay = getPerfectDelay(myThickness) * 6.5
	startSide = getRandomSide()
	
	THICKNESS = myThickness
	
	for i = 0, mTimes do
		if i < mTimes then
			wall(startSide, myThickness + 11 * getSpeedMult() * delay)
			wall(startSide+1, myThickness + 11 * getSpeedMult() * delay)
		end
		
		cWallExThick(startSide + 5, getSides() - 6, THICKNESS*1.5)
		cWallExThick(startSide + 4, getSides() - 6, THICKNESS*1)
		cWallExThick(startSide + 3, getSides() - 6, oldThickness)
		wait(delay*0.65*mDelayMult)
		cWallExThick(startSide - 4, getSides() - 6, THICKNESS*1.5)
		cWallExThick(startSide - 3, getSides() - 6, THICKNESS*1)
		cWallExThick(startSide - 2, getSides() - 6, oldThickness)
		wait(delay*0.65*mDelayMult)
		
	end
	wait(delay)
	THICKNESS = oldThickness
end

-- pTunnelDouble1Sp: a tunnel that forces you to turn left and right (1-spin)
function pTunnelDouble1Sp(mTimes, mDelayMult)
	oldThickness = THICKNESS
	myThickness = getPerfectThickness(THICKNESS)
	delay = getPerfectDelay(myThickness) * 4
	startSide = getRandomSide()
	
	THICKNESS = myThickness
	
	for i = 0, mTimes do
		if i < mTimes then
			wall(startSide, myThickness + 11 * getSpeedMult() * delay)
			wall(startSide+1, myThickness + 11 * getSpeedMult() * delay)
		end
		
		cWallEx(startSide + 4, getSides() - 4)
		wait(delay*0.65*mDelayMult)
		cWallEx(startSide - 5, getSides() - 4)
		wait(delay*0.65*mDelayMult)
		
	end
	wait(delay)
	THICKNESS = oldThickness
end

-- thin version
function pTunnelDouble1SpThin(mTimes, mDelayMult)
	oldThickness = THICKNESS
	myThickness = getPerfectThickness(THICKNESS)
	delay = getPerfectDelay(myThickness) * 4
	startSide = getRandomSide()
	
	THICKNESS = myThickness
	
	for i = 0, mTimes do
		if i < mTimes then
			wall(startSide, myThickness + 11 * getSpeedMult() * delay)
			wall(startSide + 1, myThickness + 11 * getSpeedMult() * delay)
		end
		
		cWallExThick(startSide + 4, getSides() - 4, oldThickness)
		wait(delay*0.65*mDelayMult)
		cWallExThick(startSide - 5, getSides() - 4, oldThickness)
		wait(delay*0.65*mDelayMult)
		
	end
	wait(delay)
	THICKNESS = oldThickness
end

-- pTunnelTripleThin: a tunnel that forces you to turn left and right (2-spin)
function pTunnelTripleThin(mTimes, mDelayMult)
	oldThickness = THICKNESS
	myThickness = getPerfectThickness(THICKNESS)
	delay = getPerfectDelay(myThickness) * 5.5
	startSide = getRandomSide()
	
	THICKNESS = myThickness
	
	for i = 0, mTimes do
		if i < mTimes then
			wall(startSide, myThickness + 10 * getSpeedMult() * delay)
			wall(startSide + 1, myThickness + 10 * getSpeedMult() * delay)
			wall(startSide + 2, myThickness + 10 * getSpeedMult() * delay)
		end
		
		cWallExThick(startSide + 3, getSides() - 5, oldThickness)
		wait(delay*0.65*mDelayMult)
		cWallExThick(startSide + 4, getSides() - 5, oldThickness)
		wait(delay*0.65*mDelayMult)
		
	end
	wait(delay)
	THICKNESS = oldThickness
end

-- pTknsTunnelTriple: pTunnelTriple pattern with several thicknesses like the pattern from Hyper Hexagoner
function pTknsTunnelTriple(mTimes, mDelayMult)
	oldThickness = THICKNESS
	myThickness = getPerfectThickness(THICKNESS)
	delay = getPerfectDelay(myThickness) * 5.5
	startSide = getRandomSide()	
	
	THICKNESS = myThickness
	
	for i = 0, mTimes do
		if i < mTimes then
			wall(startSide, myThickness + 11 * getSpeedMult() * delay)
			wall(startSide + 1, myThickness + 11 * getSpeedMult() * delay)
			wall(startSide + 2, myThickness + 11 * getSpeedMult() * delay)
		end
		
		cWallExThick(startSide + 3, getSides() - 6, THICKNESS*1)
		cWallExThick(startSide + 4, getSides() - 6, oldThickness)
		wait(delay*0.65*mDelayMult)
		cWallExThick(startSide + 4, getSides() - 6, oldThickness)
		cWallExThick(startSide + 5, getSides() - 6, THICKNESS*1)
		wait(delay*0.65*mDelayMult)
		
	end
	wait(delay)
	THICKNESS = oldThickness
end

-- pTunnelQuadruple: a very thick tunnel that forces you to turn left and right (1-spin)
function pTunnelQuadruple(mTimes, mDelayMult)
	oldThickness = THICKNESS
	myThickness = getPerfectThickness(THICKNESS)
	delay = getPerfectDelay(myThickness) * 2.5
	startSide = getRandomSide()
	
	THICKNESS = myThickness
	
	for i = 0, mTimes do
		if i < mTimes then
			wall(startSide, myThickness + 12 * getSpeedMult() * delay)
			wall(startSide+1, myThickness + 12 * getSpeedMult() * delay)
			wall(startSide+2, myThickness + 12 * getSpeedMult() * delay)
			wall(startSide+3, myThickness + 12 * getSpeedMult() * delay)
		end
		
		cBarrage(startSide + 4)
		wait(delay*mDelayMult)
		cBarrage(startSide + 5)
		wait(delay*mDelayMult)
	end
	
	THICKNESS = oldThickness
	wait(delay)
end

-- pTknsTunnelShort: pTunnelShort pattern with several thicknesses like the pattern from Hyper Hexagoner
function pTknsTunnelShort(mTimes, mDelayMult)
	oldThickness = THICKNESS
	myThickness = getPerfectThickness(THICKNESS)
	delay = getPerfectDelay(myThickness) * 4.2
	startSide = getRandomSide()
	
	THICKNESS = myThickness
	
	for i = 0, mTimes do
		if i < mTimes then
			wall(startSide, myThickness + 13 * getSpeedMult() * delay)
		end
		
		cWallExThick(startSide + 4, getSides() - 5, THICKNESS*1)
		cWallExThick(startSide + 3, getSides() - 5, oldThickness)
		wait(delay*0.65*mDelayMult)
		cWallExThick(startSide - 4, getSides() - 5, oldThickness)
		cWallExThick(startSide - 5, getSides() - 5, THICKNESS*1)
		wait(delay*0.65*mDelayMult)
	end
	
	wait(delay)
	THICKNESS = oldThickness
end

-- pBat: the bat pattern from Super Hexagon where you have to turn left-left or right-right (3-spin)
function pBat(mDelayMult)
	oldThickness = THICKNESS
	myThickness = getPerfectThickness(THICKNESS)
	delay = getPerfectDelay(myThickness) * 5 * mDelayMult
	startSide = getRandomSide()
	
	THICKNESS = myThickness
	
	cWallExThick(startSide + 1, getSides() - 6, THICKNESS*0.7)
	cWallExThick(startSide + 2, getSides() - 6, THICKNESS*2.8)
	wall(startSide + 3, THICKNESS*4.5)
	cWallExThick(startSide + 4, getSides() - 6, THICKNESS*2.8)
	cWallExThick(startSide + 5, getSides() - 6, THICKNESS*0.7)
	wait(delay)
	wall(startSide + getHalfSides() + 3, THICKNESS*8)
	wait(delay*0.8)
	wall(startSide + getHalfSides() + 2, THICKNESS*6)
	wall(startSide + getHalfSides() + 4, THICKNESS*6)
	wait(delay*1.4)
	wall(startSide + getHalfSides() + 1, THICKNESS*1.5)
	wall(startSide + getHalfSides() + 5, THICKNESS*1.5)
	wait(delay)

	THICKNESS = oldThickness
	wait(delay*1)
end