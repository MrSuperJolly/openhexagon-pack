--these are all taken from other lua files

function pOctTunnelLLR(mDelayMult)
	oldThickness = THICKNESS
	myThickness = getPerfectThickness(THICKNESS)
	delay = getPerfectDelay(myThickness) * 4 * mDelayMult
	delay2 = getPerfectDelay(myThickness) * 3
	startSide = getRandomSide()
	
	THICKNESS = myThickness
	
	wall(startSide, myThickness + 32 * getSpeedMult() * delay)
		
	cWallExThick(startSide+1, 5, oldThickness)
	wait(delay*0.65)
	cWallExThick(startSide+6, 1, oldThickness)
	wait(delay*0.65)
	cWallExThick(startSide+1, 4, oldThickness)
	wait(delay*0.65)
	cWallExThick(startSide+5, 2, oldThickness)
	wait(delay*0.65)
	cWallExThick(startSide+1, 3, oldThickness)
	wait(delay*0.65)
	cWallExThick(startSide+4, 3, oldThickness)
	wait(delay*0.65)
	cWallExThick(startSide+1, 2, oldThickness)
	wait(delay*0.65)
	cWallExThick(startSide+3, 4, oldThickness)
	wait(delay*0.65)
	cWallExThick(startSide+1, 1, oldThickness)
	wait(delay*0.65)
	cWallExThick(startSide+2, 5, oldThickness)
	wait(delay*0.65)	
	wall(startSide+1, oldThickness)
	wait(delay*0.65)	

	wait(delay2)
	THICKNESS = oldThickness
end

function pOctBat(mDelayMult)
	oldThickness = THICKNESS
	myThickness = getPerfectThickness(THICKNESS)
	delay = getPerfectDelay(myThickness) * 4.7 * mDelayMult
	delay2 = getPerfectDelay(myThickness) * 2
	delay3 = getPerfectDelay(myThickness) * 6	
	startSide = getRandomSide()
	
	THICKNESS = myThickness
	
	wall(startSide, THICKNESS*0.7)
	wall(startSide + 6, THICKNESS*0.7)
	wall(startSide + 1, THICKNESS*2.8)
	wall(startSide + 5, THICKNESS*2.8)
	wall(startSide + 2, THICKNESS*4.5)
	wall(startSide + 4, THICKNESS*4.5)
	wall(startSide + 3, THICKNESS*6.1)	
	
	wait(delay)
	
	wall(startSide + 7, THICKNESS*7.7)
	wait(delay2*0.7)
	wall(startSide, THICKNESS*6.5)
	wall(startSide + 6, THICKNESS*6.5)
	wait(delay2*0.67)
	wall(startSide + 1, THICKNESS*4.2)
	wall(startSide + 5, THICKNESS*4.2)
	wait(delay2*0.78)
	wall(startSide + 2, THICKNESS*1.2)
	wall(startSide + 4, THICKNESS*1.2)		

	THICKNESS = oldThickness
	wait(delay3)
end
