--these are all taken from other lua files

function pEnneAltBarrageStrip(mTimes, mDelayMult)
	oldThickness = THICKNESS
	delay = getPerfectDelay(THICKNESS) * 5.6
	delay2 = getPerfectDelay(THICKNESS) * 7.5
	ss = getRandomSide()
	
	for i = 0, mTimes do
		cWallEx(ss,1) cWallEx(ss+3,1) cWallEx(ss+6,1)
		wait(delay*mDelayMult)
	end
	wait(delay2)
end

function pEnneBackAndForth(mTimes, mDelayMult)
	ot = THICKNESS
	mt = getPerfectThickness(THICKNESS)
	delay = getPerfectDelay(mt) * 4.5
	ss = getRandomSide()
	THICKNESS = mt
	
	for i = 0, mTimes do
		if i < mTimes then
			cWallExThick(ss, 3, mt+6.5 * getSpeedMult() * delay)
			wall(ss+6, mt+6.5 * getSpeedMult() * delay)			
		end
		
		wall(ss+4, ot*2)
		wall(ss+7, ot*2)		
		wait(delay*0.5*mDelayMult)
		wall(ss+5, ot*2)
		wall(ss+8, ot*2)		
		wait(delay*0.5*mDelayMult)		
	end
	THICKNESS = ot
	wait(delay)
end

function pEnneTunnelSextuple(mTimes, mDelayMult)
	ot = THICKNESS
	mt = getPerfectThickness(THICKNESS)
	delay = getPerfectDelay(mt) * 3.5 * mDelayMult
	delay2 = getPerfectDelay(mt) * 3.5	
	ss = getRandomSide()	
	THICKNESS = mt
	
	for i = 0, mTimes do
		if i < mTimes then
			cWallExThick(ss, 5, mt+15 * getSpeedMult()*delay)
		end
		
		cWallExThick(ss+6, 1, THICKNESS*0.6)
		wait(delay)
		cWallExThick(ss+7, 1, THICKNESS*0.6)
		wait(delay)
	end	
	THICKNESS = ot
	wait(delay2)
end

function pEnneBat(mDelayMult)
	ot = THICKNESS
	mt = getPerfectThickness(THICKNESS)
	delay = getPerfectDelay(mt) * 4.7 * mDelayMult
	delay2 = getPerfectDelay(mt) * 2
	delay3 = getPerfectDelay(mt) * 7.5
	ss = getRandomSide()	
	THICKNESS = mt
	
	wall(ss+0, THICKNESS*0.7)
	wall(ss+6, THICKNESS*0.7)
	wall(ss+1, THICKNESS*2.8)
	wall(ss+5, THICKNESS*2.8)	
	wall(ss+2, THICKNESS*4.5)
	wall(ss+4, THICKNESS*4.5)	
	wall(ss+3, THICKNESS*6.1)	
	
	wait(delay)
	
	wall(ss+7, THICKNESS*7.7)
	wall(ss+8, THICKNESS*7.7)	
	wait(delay2*0.7)
	wall(ss+0, THICKNESS*6.5)
	wall(ss+6, THICKNESS*6.5)
	wait(delay2*0.67)
	wall(ss+1, THICKNESS*4.2)
	wall(ss+5, THICKNESS*4.2)
	wait(delay2*0.72)	
	wall(ss+2, THICKNESS*1.5)
	wall(ss+4, THICKNESS*1.5)	

	THICKNESS = ot
	wait(delay3)
end

--these are "new" - old patterns with slightly modified numbers.

function pBackAndForthTriple2(mTimes, mDelayMult) --editing eschwasion's enneagon pattern
	oldThickness = THICKNESS
	myThickness = getPerfectThickness(THICKNESS)
	delay = getPerfectDelay(myThickness) * 5
	startSide = getRandomSide()
	
	THICKNESS = myThickness
	
	for i = 0, mTimes do
		if i < mTimes then
			wall(startSide, myThickness + 7.5 * getSpeedMult() * delay)
			wall(startSide + 3, myThickness + 7.5 * getSpeedMult() * delay)
			wall(startSide + 6, myThickness + 7.5 * getSpeedMult() * delay)
		end
		
		wall(startSide + 1, oldThickness*2)
		wall(startSide + 4, oldThickness*2)
		wall(startSide + 7, oldThickness*2)
		wait(delay*0.5*mDelayMult)
		wall(startSide + 2, oldThickness*2)
		wall(startSide + 5, oldThickness*2)
		wall(startSide + 8, oldThickness*2)
		wait(delay*0.5*mDelayMult)
		
	end
	
	THICKNESS = oldThickness
	wait(delay)
end

function pVortexTriple2(mTimes)
	delay = getPerfectDelay(THICKNESS) * 6
	loopDir = getRandomDir()
	currentSide = getRandomSide()
	
	for i = 0, 2 do
		currentSide = currentSide + loopDir
		for j = 0, 2 do
			cWallEx(currentSide + j * 3, 1)
		end
		wait(delay)
	end

	loopDir = loopDir * -1
	currentSide = currentSide + loopDir
	for j = 0, 2 do
		cWallEx(currentSide + j * 3, 1)
	end
	wait(delay)
	currentSide = currentSide - loopDir
	for j = 0, 2 do
		cWallEx(currentSide + j * 3, 1)
	end
	wait(delay)
	
	wait(delay)
end