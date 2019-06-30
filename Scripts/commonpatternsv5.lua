execScript("common.lua")

-- commonpatternsv2: second version of commonpatterns, especially for hex levels (modifications made by Hexadorsip and other players)

-- pAltBarrage2: spawns a "left-right-left-right" barrage of mirror walls (for a hex level)
function pAltBarrage2(mTimes, mDelayMult)
	oldThickness = THICKNESS
	delay = getPerfectDelay(THICKNESS) * 5.6
	startSide = getRandomSide()	
	
	for i = 0, mTimes do
		rWallEx(startSide, 1)
		wait(delay*mDelayMult)
		rWall(startSide + 2)
		wait(delay*mDelayMult)
	end
	
	wait(delay)
end

-- pAltBarrage3: spawns a barrage that looks like a "C" with a "I" (face to face) inspired by the one from Hyper Hexagonest (for a hex level)
function pAltBarrage3(mTimes, mDelayMult)
	oldThickness = THICKNESS
	delay = getPerfectDelay(THICKNESS) * 4.4
	startSide = getRandomSide()	
	
	for i = 0, mTimes do
		cWallEx(startSide, 2)
		cWall(startSide + 4)	
		wait(delay*mDelayMult)
		cWallEx(startSide + 3, 2)
		cWall(startSide + 1)
		wait(delay*mDelayMult)
	end
	
	wait(delay)
end

-- pCIAltBarrage: spawns another version of pAltBarrageSpiral with pAltBarrage3 walls (CI appearance)
function pCIAltBarrage(mTimes, mStartSide2nd, mExtra, mDelayMult)
	delay = getPerfectDelay(THICKNESS)* 5.6 * mDelayMult
	delay2 = getPerfectDelay(THICKNESS)* 5.6
	
	for i = 0, mTimes do
		cAltBarrage2(i, mExtra, mStartSide2nd)
		wait(delay)
	end
	
	wait(delay2)
end

----

--same pattern (for a hex level only - old version)
function pCIAltBarrageOld(mTimes, mStep, mDelayMult)
	oldThickness = THICKNESS
	delay = getPerfectDelay(THICKNESS) * 5.6
	startSide = getRandomSide()
	loopDir = mStep * getRandomDir()
    x = 0
	y = 0
	
	for z = 0, mTimes do
		cWallEx(startSide + x, 2)
		x = x + loopDir
		cWall(startSide + 4 + y)
		y = y + loopDir		
		wait(delay*mDelayMult)
	end
	
	wait(delay)
end

----

-- pAltBarrageThick: thick version of pAltBarrage
function pAltBarrageThick(mTimes, mStep)
	oldThickness = THICKNESS
	delay = getPerfectDelay(THICKNESS) * 5.6
	
	for i = 0, mTimes do
		cAltBarrageThick(i, mStep, THICKNESS*2.5)
		wait(delay)
	end
	
	wait(delay)
end

function pRandomAltBarrage(mTimes, mStep, mDelayMult)
	delay = getPerfectDelay(THICKNESS) * 5.6 * mDelayMult
	delay2 = getPerfectDelay(THICKNESS) * 5.6	
	startSide = getRandomSide()
	
	for e = 0, mTimes do
		cAltBarrage(startSide+math.random(), mStep)
		wait(delay)
	end
	
	wait(delay2)
end

-- pAltBarrageStrip: mix between pAltBarrage and pMirrorWallStrip (modified for ALL sides instead of 6/8 sides only + mDelayMult)
function pAltBarrageStrip(mTimes, mStep, mDelayMult)
	delay = getPerfectDelay(THICKNESS) * 5.6 * mDelayMult
	delay2 = getPerfectDelay(THICKNESS) * 5.6	
	startSide = getRandomSide()
	
	for e = 0, mTimes do
		cAltBarrage(startSide, mStep)
		wait(delay)
	end
	
	wait(delay2)
end

function pCIAltBarrageStrip(mTimes, mStartSide2nd, mExtra, mDelayMult)
	delay = getPerfectDelay(THICKNESS)* 5.6 * mDelayMult
	delay2 = getPerfectDelay(THICKNESS) * 5.6	
	startSide = getRandomSide()
	
	for i = 0, mTimes do
		cAltBarrage2(startSide, mExtra, mStartSide2nd)
		wait(delay)
	end
	
	wait(delay2)
end

-- pAltBarrageSpiral: pAltBarrage pattern + mDelayMult (created by Exschwasion)
function pAltBarrageSpiral(mTimes, mStep, mDelayMult)
	delay = getPerfectDelay(THICKNESS)* 5.6 * mDelayMult
	
	for i = 0, mTimes do
		cAltBarrage(i, mStep)
		wait(delay)
	end
	
	wait(getPerfectDelay(THICKNESS) * 6.1)
end

----

-- pcWallEx (created by Exschwasion)
function pcWallEx(mTimes, mSide, mExtra)
	if mExtra == 0 then delay = getPerfectDelay(THICKNESS) * 1.0
	elseif mExtra == 1 then delay = getPerfectDelay(THICKNESS) * 2.0
	elseif mExtra == 2 then delay = getPerfectDelay(THICKNESS) * 2.8
	elseif  mExtra == 3 then delay = getPerfectDelay(THICKNESS) * 3.2
	end
	for i = 0, mTimes do
		cWallEx(getRandomSide(), mExtra)
		wait(delay)
	end
	
	wait(delay)
end

-- pcfastWallEx (created by Exschwasion)
function pcfastWallEx(mTimes, mSide, mExtra)
	delay = getPerfectDelay(THICKNESS) * 0.8
	for i = 0, mTimes do
		cWallEx(getRandomSide(), mExtra)
		wait(delay)
	end
	
	wait(delay)
end

-- pcBarrageWallLR: spawns cBarrage, then delay (that you can modify), then cWall that force you to do LR-LR/RL-RL
function pcBarrageWallLR(mSide, mTimes, mDelayMult)
	delay = getPerfectDelay(THICKNESS) * 5.6 * mDelayMult
	startSide = getRandomSide()
	
	for i = 0, mTimes do
		cBarrage(mSide)
		wait(delay)
		cWall(mSide)
		wait(delay)
	end
	
	wait(getPerfectDelay(THICKNESS) * 6.1)
end

----

-- MirrorSpiral: pMirrorSpiral pattern + mDelayMult
function pDMMirrorSpiral(mTimes, mExtra, mDelayMult)
	oldThickness = THICKNESS
	THICKNESS = getPerfectThickness(THICKNESS)
	delay = getPerfectDelay(THICKNESS) * mDelayMult
	delay2 = getPerfectDelay(THICKNESS) * 3.8
	startSide = getRandomSide()
	loopDir = getRandomDir()
	j = 0
	
	for i = 0, mTimes do
		rWallEx(startSide + j, mExtra)
		j = j + loopDir
		wait(delay*mDelayMult)
	end
	
	THICKNESS = oldThickness
	wait(delay2)
end

-- pMirrorSpiralLeft (created by Exschwasion)
function pMirrorSpiralLeft(mTimes, mExtra)
	oldThickness = THICKNESS
	THICKNESS = getPerfectThickness(THICKNESS)
	delay = getPerfectDelay(THICKNESS)
	startSide = getRandomSide()
	loopDir = getRandomDir()
	j = 0
	
	for i = 0, mTimes do
		rWallEx(startSide + j, mExtra)
		j = j - 1
		wait(delay)
	end
	
	THICKNESS = oldThickness
	
	wait(getPerfectDelay(THICKNESS) * 6.5)
end

-- same pattern + mDelayMult
function pDMMirrorSpiralLeft(mTimes, mExtra, mDelayMult)
	oldThickness = THICKNESS
	THICKNESS = getPerfectThickness(THICKNESS)
	delay = getPerfectDelay(THICKNESS) * mDelayMult
	delay2 = getPerfectDelay(THICKNESS) * 3.8
	startSide = getRandomSide()
	loopDir = getRandomDir()
	j = 0
	
	for i = 0, mTimes do
		rWallEx(startSide + j, mExtra)
		j = j -1
		wait(delay*mDelayMult)
	end
	
	THICKNESS = oldThickness
	wait(delay2)
end

-- pMirrorSpiralAllDir: spawns a spiral of rWallEx (left and right directions for more difficulty)
function pMirrorSpiralAllDir(mTimes, mExtra)
	oldThickness = THICKNESS	
	THICKNESS = getPerfectThickness(THICKNESS)
	delay = getPerfectDelay(THICKNESS)
	delay2 = getPerfectDelay(THICKNESS) * 3.3
	startSide = getRandomSide()
	loopDir = getRandomDir()
	dir = math.random(0, 1)
	j = 0
	
	for i = 0, mTimes do
		rWallEx(startSide + j, mExtra)
	    if dir == 0 then		
		j = j -1		
		else
		j = j + loopDir
		end
		wait(delay)
	end
	
	THICKNESS = oldThickness
	
	wait(delay2)
end

-- same pattern + mDelayMult
function pDMMirrorSpiralAllDir(mTimes, mExtra, mDelayMult)
	oldThickness = THICKNESS
	THICKNESS = getPerfectThickness(THICKNESS)
	delay = getPerfectDelay(THICKNESS) * mDelayMult
	delay2 = getPerfectDelay(THICKNESS) * 3.8
	startSide = getRandomSide()
	loopDir = getRandomDir()
	dir = math.random(0, 1)
	j = 0
	
	for i = 0, mTimes do
		rWallEx(startSide + j, mExtra)
	    if dir == 0 then		
		j = j -1
		else
		j = j + loopDir
		end
		wait(delay*mDelayMult)
	end
	
	THICKNESS = oldThickness
	
	wait(delay2)
end

-- pSingleSpiral: spawns a spiral of cWallEx (created by Exschwasion)
function pSingleSpiral(mTimes, mExtra)
	oldThickness = THICKNESS
	THICKNESS = getPerfectThickness(THICKNESS)
	delay = getPerfectDelay(THICKNESS)
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

-- same pattern + mDelayMult
function pDMSingleSpiral(mTimes, mExtra, mDelayMult)
	oldThickness = THICKNESS
	THICKNESS = getPerfectThickness(THICKNESS)
	delay = getPerfectDelay(THICKNESS) * mDelayMult
	delay2 = getPerfectDelay(THICKNESS) * 3
	startSide = getRandomSide()
	loopDir = getRandomDir()
	j = 0
	
	for i = 0, mTimes do
		cWallEx(startSide + j, mExtra)
		j = j + loopDir
		wait(delay*mDelayMult)
	end
	
	THICKNESS = oldThickness
	wait(delay2)
end

-- pSingleSpiralLeft (created by Exschwasion)
function pSingleSpiralLeft(mTimes, mExtra)
	oldThickness = THICKNESS
	THICKNESS = getPerfectThickness(THICKNESS)
	delay = getPerfectDelay(THICKNESS)
	startSide = getRandomSide()
	loopDir = getRandomDir()
	j = 0
	
	for i = 0, mTimes do
		cWallEx(startSide + j, mExtra)
		j = j - 1
		wait(delay)
	end
	
	THICKNESS = oldThickness
	
	wait(getPerfectDelay(THICKNESS) * 6.5)
	end
	
function pDMSingleSpiralLeft(mTimes, mExtra, mDelayMult)
	oldThickness = THICKNESS
	THICKNESS = getPerfectThickness(THICKNESS)
	delay = getPerfectDelay(THICKNESS) * mDelayMult
	delay2 = getPerfectDelay(THICKNESS) * 3
	startSide = getRandomSide()
	loopDir = getRandomDir()	
	j = 0
	
	for i = 0, mTimes do
		cWallEx(startSide + j, mExtra)
		j = j -1
		wait(delay*mDelayMult)
	end
	
	THICKNESS = oldThickness
	wait(delay2)
end	

function pSingleSpiralAllDir(mTimes, mExtra)	
	oldThickness = THICKNESS
	THICKNESS = getPerfectThickness(THICKNESS)
	delay = getPerfectDelay(THICKNESS)
	delay2 = getPerfectDelay(THICKNESS) * 4
	startSide = getRandomSide()
	loopDir = getRandomDir()
	dir = math.random(0, 1)
	j = 0
	
	for i = 0, mTimes do
		cWallEx(startSide + j, mExtra)
	    if dir == 0 then		
		j = j - 1
		else
		j = j + loopDir
		end
		wait(delay)
	end
	
	THICKNESS = oldThickness
	
	wait(delay2)
end

function pDMSingleSpiralAllDir(mTimes, mExtra, mDelayMult)
	oldThickness = THICKNESS
	THICKNESS = getPerfectThickness(THICKNESS)
	delay = getPerfectDelay(THICKNESS) * mDelayMult
	delay2 = getPerfectDelay(THICKNESS) * 3
	startSide = getRandomSide()
	loopDir = getRandomDir()
	dir = math.random(0, 1)
	j = 0
	
	for i = 0, mTimes do
		cWallEx(startSide + j, mExtra)
	    if dir == 0 then		
		j = j - 1
		else
		j = j + loopDir
		end
		wait(delay*mDelayMult)
	end
	
	THICKNESS = oldThickness
	
	wait(delay2)
end

----

-- pExSingleSpiral: better version of pSingleSpiral pattern where you can personalize everything (number of walls, number of sides, delay, thickness and direction)
function pExSingleSpiral(mTimes, mExtra, mDelayMult, mThick, mDir)
	oldThickness = THICKNESS
	THICKNESS = getPerfectThickness(THICKNESS) * mThick --default thickness: 1
	delay = getPerfectDelay(THICKNESS) * mDelayMult
	delay2 = getPerfectDelay(THICKNESS) * 3
	startSide = getRandomSide()
	loopDir = getRandomDir()
	s = 1
	
	for r = 0, mTimes do
		cWallEx(startSide + s, mExtra)
		
		if mDir < 0 then s = s - 1 * 1 - mExtra --left turn
		elseif mDir > - 1 then s = s + loopDir * 1 + mExtra --right turn
		end
		wait(delay*mDelayMult)
	end
	
	THICKNESS = oldThickness
	wait(delay2)
end

-- pExMirrorSpiral: better version of pMirrorSpiral pattern where you can personalize everything (number of walls, number of sides, delay, thickness and direction)
function pExMirrorSpiral(mTimes, mExtra, mDelayMult, mThick, mDir)
	oldThickness = THICKNESS
	THICKNESS = getPerfectThickness(THICKNESS) * mThick --default thickness: 1
	delay = getPerfectDelay(THICKNESS) * mDelayMult
	delay2 = getPerfectDelay(THICKNESS) * 3
	startSide = getRandomSide()
	loopDir = getRandomDir()	
	s = 1
	
	for r = 0, mTimes do
		rWallEx(startSide + s, mExtra)
		
		if mDir < 0 then s = s - 1 * 1 - mExtra --left turn
		elseif mDir > - 1 then s = s + loopDir * 1 + mExtra --right turn
		end   
		wait(delay*mDelayMult)
	end
	
	THICKNESS = oldThickness
	wait(delay2)
end

----

-- pBarrageSpiralLeft (created by Exschwasion)
function pBarrageSpiralLeft(mTimes, mDelayMult, mStep)
	delay = getPerfectDelay(THICKNESS) * 5.6 * mDelayMult
	startSide = getRandomSide()
	j = 0
	
	for i = 0, mTimes do
		cBarrage(startSide + j)
		j = j - 1
		wait(delay)
		if(getSides() < 6) then wait(delay * 0.6) end
	end
	
	wait(getPerfectDelay(THICKNESS) * 6.1)
end

-- pBarrageSpiralDouble: pDMWallExVortex pattern with cWallEx instead of rWallEx
function pBarrageSpiralDouble(mTimes, mDelayMult, mStep, mExtra)
	delay = getPerfectDelay(THICKNESS) * 5.6 * mDelayMult
	startSide = getRandomSide()
	currentSide = startSide
	loopDir = mStep * getRandomDir()
	j = 0
	dir = math.random(0, 1)
	
  if dir == 0 then
	for i = 0, mTimes do
		cWallEx(startSide + j, mExtra)
		j = j - 1
		wait(delay)
		if(getSides() < 6) then wait(delay * 0.6) end
	end
	
    cWallEx(startSide + j, mExtra)
	j = j + loopDir	
    wait(delay)
    if(getSides() < 6) then wait(delay * 0.6) end
	
	loopDir = loopDir * -1
	
	for i = 0, mTimes do	
		cWallEx(startSide + j, mExtra, currentSide)
		j = j + loopDir
		wait(delay)
		if(getSides() < 6) then wait(delay * 0.6) end
	end
	
  else
	for i = 0, mTimes do
		cWallEx(startSide + j, mExtra)
		j = j + loopDir
		wait(delay)
		if(getSides() < 6) then wait(delay * 0.6) end
	end
	
    cWallEx(startSide + j, mExtra)
	j = j - 1
    wait(delay)
    if(getSides() < 6) then wait(delay * 0.6) end
	
	loopDir = loopDir * -1
	
	for i = 0, mTimes do	
		cWallEx(startSide + j, mExtra, currentSide)
		j = j - 1
		wait(delay)
		if(getSides() < 6) then wait(delay * 0.6) end
	end
  end	
	
	wait(getPerfectDelay(THICKNESS) * 6.1)
end

-- pBarrageSpiralLR: spawns left-right spiral of cBarrage
function pBarrageSpiralLR(mTimes, mDelayMult)
	delay = getPerfectDelay(THICKNESS) * 5.6 * mDelayMult
	startSide = getRandomSide()
	
	for i = 0, mTimes do
		cBarrage(startSide)
		wait(delay)
		cBarrage(startSide + 1)
		wait(delay)
	end
	
	wait(getPerfectDelay(THICKNESS) * 6.1)
end

-- pSTBBarrageSpiral: spawns a "small to big" spiral of cWallEx
function pSTBBarrageSpiral(mTimes, mDelayMult, mStep)
	delay = getPerfectDelay(THICKNESS) * 5.6 * mDelayMult
	startSide = getRandomSide()
	loopDir = mStep * getRandomDir()
	mExtra = 0
	j = 0
	k = mStep * mExtra * getRandomDir() -1
	dir = math.random(0, 1)

  if dir == 0 then
	for i = 0, mTimes do
		cWallEx(startSide + j, mExtra)
		j = j -1
		mExtra = mExtra + 1 * k
		wait(delay)
		if(getSides() < 6) then wait(delay * 0.6) end
	end
	
  else
	for i = 0, mTimes do
		cWallEx(startSide + j, mExtra)
		j = j + loopDir
		mExtra = mExtra + 1
		wait(delay)
		if(getSides() < 6) then wait(delay * 0.6) end
	end
  end	
	
	wait(getPerfectDelay(THICKNESS) * 6.1)
end

----

-- pDMWallExVortex: pWallExVortex pattern + mDelayMult
function pDMWallExVortex(mTimes, mStep, mExtraMult, mDelayMult)
	delay = getPerfectDelay(THICKNESS) * 5
	startSide = getRandomSide()
	loopDir = getRandomDir()
	currentSide = startSide
	
	for j = 0, mTimes do
		for i = 0, mStep do
			currentSide = currentSide + loopDir
			rWallEx(currentSide, loopDir * mExtraMult)
			wait(delay*mDelayMult)
		end
		
		loopDir = loopDir * -1
		
		for i = 0, mStep + 1 do
			currentSide = currentSide + loopDir;
			rWallEx(currentSide, loopDir * mExtraMult)
			wait(delay*mDelayMult)
		end
	end
	
	wait(getPerfectDelay(THICKNESS) * 5.5)
end

-- pWallExVortexLR: pBarrageSpiralLR pattern with rWallEx instead of cBarrage
function pWallExVortexLR(mTimes, mExtra, mDelayMult)
	delay = getPerfectDelay(THICKNESS) * 5.6 * mDelayMult
	startSide = getRandomSide()
	
	for i = 0, mTimes do
		rWallEx(startSide, mExtra)
		wait(delay)
		rWallEx(startSide + 1, mExtra)
		wait(delay)
	end
	
	wait(getPerfectDelay(THICKNESS) * 6.1)
end

-- pWallExVortexLL: spawns the LL-LL or RR-RR spiral from Hyper Hexagon (without mDelayMult)
function pWallExVortexLL(mTimes, mStep, mExtraMult)
	delay = getPerfectDelay(THICKNESS) * 5
	startSide = getRandomSide()
	loopDir = getRandomDir()
	currentSide = startSide
	
	for j = 0, mTimes do
		for i = 0, mStep do
			currentSide = currentSide + loopDir
			rWallEx(currentSide, loopDir * mExtraMult)
			wait(delay)
		end
		
		loopDir = loopDir * -1
	end
	
	wait(getPerfectDelay(THICKNESS) * 5.5)
end

-- pDMWallExVortexLL: same pattern + mDelayMult
function pDMWallExVortexLL(mTimes, mStep, mExtraMult, mDelayMult)
	delay = getPerfectDelay(THICKNESS) * 5
	startSide = getRandomSide()
	loopDir = getRandomDir()
	currentSide = startSide
	
	for j = 0, mTimes do
		for i = 0, mStep do
			currentSide = currentSide + loopDir
			rWallEx(currentSide, loopDir * mExtraMult)
			wait(delay*mDelayMult)
		end
		
		loopDir = loopDir * -1
	end
	
	wait(getPerfectDelay(THICKNESS) * 5.5)
end

-- pRandomWallExVortex: pRandomBarrage pattern with rWallEx instead of cBarrage
function pRandomWallExVortex(mTimes, mExtra, mDelayMult)
	side = getRandomSide()
	oldSide = 0
	
	for i = 0, mTimes do	
		rWallEx(side, mExtra)
		oldSide = side
		side = getRandomSide()
		wait(getPerfectDelay(THICKNESS) * (2 + (getSideDistance(side, oldSide)*mDelayMult)))
	end
	
	wait(getPerfectDelay(THICKNESS) * 5.5)
end

function pRandomWallExVortexNoRepeats(mTimes, mExtra, mDelayMult)
	side = getRandomSide()
	oldSide = 0
	
	for i = 0, mTimes do	
		rWallEx(side, mExtra)
		oldSide = side
		while oldSide == side do
			side = getRandomSide()
		end
		wait(getPerfectDelay(THICKNESS) * (2 + (getSideDistance(side, oldSide)*mDelayMult)))
	end
	
	wait(getPerfectDelay(THICKNESS) * 5.5)
end

----

-- pDMInverseBarrage: pInverseBarrage pattern + mDelayMult
function pDMInverseBarrage(mTimes, mDelayMult)
	delay = getPerfectDelay(THICKNESS) * 5 * mDelayMult
	startSide = getRandomSide()
	
	for i = 0, mTimes do
		cBarrage(startSide)
		wait(delay*mDelayMult)
		cBarrage(startSide + getHalfSides())
		wait(delay*mDelayMult)
	end
	
	wait(getPerfectDelay(THICKNESS) * 2.5)
end

-- pInverseBarrage2Sid: pDMInverseBarrage pattern with 2 sides
function pInverseBarrage2Sid(mTimes, mDelayMult)
	delay = getPerfectDelay(THICKNESS) * 5 * mDelayMult
	startSide = getRandomSide()
	
	for i = 0, mTimes do
		cWallEx(startSide, 1)
		wait(delay*mDelayMult)
		cWallEx(startSide + getHalfSides(), 1)
		wait(delay*mDelayMult)
	end
	
	wait(getPerfectDelay(THICKNESS) * 2.5)
end

function pInverseBarrage3Sid(mTimes, mDelayMult)
	delay = getPerfectDelay(THICKNESS) * 5 * mDelayMult
	startSide = getRandomSide()
	
	for i = 0, mTimes do
		cWallEx(startSide, 2)
		wait(delay*mDelayMult)
		cWallEx(startSide + getHalfSides(), 2)
		wait(delay*mDelayMult)
	end
	
	wait(getPerfectDelay(THICKNESS) * 2.5)
end

function pInverseBarrage4Sid(mTimes, mDelayMult)
	delay = getPerfectDelay(THICKNESS) * 5 * mDelayMult
	startSide = getRandomSide()
	
	for i = 0, mTimes do
		cWallEx(startSide, 3)
		wait(delay*mDelayMult)
		cWallEx(startSide + getHalfSides(), 3)
		wait(delay*mDelayMult)
	end
	
	wait(getPerfectDelay(THICKNESS) * 2.5)
end

function pInverseBarrage5Sid(mTimes, mDelayMult)
	delay = getPerfectDelay(THICKNESS) * 5 * mDelayMult
	startSide = getRandomSide()
	
	for i = 0, mTimes do
		cWallEx(startSide, 4)
		wait(delay*mDelayMult)
		cWallEx(startSide + getHalfSides(), 4)
		wait(delay*mDelayMult)
	end
	
	wait(getPerfectDelay(THICKNESS) * 2.5)
end

function pInverseBarrage6Sid(mTimes, mDelayMult)
	delay = getPerfectDelay(THICKNESS) * 5 * mDelayMult
	startSide = getRandomSide()
	
	for i = 0, mTimes do
		cWallEx(startSide, 5)
		wait(delay*mDelayMult)
		cWallEx(startSide + getHalfSides(), 5)
		wait(delay*mDelayMult)
	end
	
	wait(getPerfectDelay(THICKNESS) * 2.5)
end

-- "inverse barrage" patterns with different numbers

function pInverseBarrage12Sid(mTimes, mDelayMult)
	delay = getPerfectDelay(THICKNESS) * 5 * mDelayMult
	startSide = getRandomSide()
	
	for i = 0, mTimes do
		cWallEx(startSide, 0)
		wait(delay*mDelayMult)
		cWallEx(startSide + getHalfSides() - 1, 1)
		wait(delay*mDelayMult)
	end
	
	wait(getPerfectDelay(THICKNESS) * 2.5)
end

function pInverseBarrage23Sid(mTimes, mDelayMult)
	delay = getPerfectDelay(THICKNESS) * 5 * mDelayMult
	startSide = getRandomSide()
	
	for i = 0, mTimes do
		cWallEx(startSide, 1)
		wait(delay*mDelayMult)
		cWallEx(startSide + getHalfSides() - 1, 2)
		wait(delay*mDelayMult)
	end
	
	wait(getPerfectDelay(THICKNESS) * 2.5)
end

function pInverseBarrage24Sid(mTimes, mDelayMult)
	delay = getPerfectDelay(THICKNESS) * 5 * mDelayMult
	startSide = getRandomSide()
	
	for i = 0, mTimes do
		cWallEx(startSide, 1)
		wait(delay*mDelayMult)
		cWallEx(startSide + getHalfSides() - 1, 3)
		wait(delay*mDelayMult)
	end
	
	wait(getPerfectDelay(THICKNESS) * 2.5)
end

function pInverseBarrage34Sid(mTimes, mDelayMult)
	delay = getPerfectDelay(THICKNESS) * 5 * mDelayMult
	startSide = getRandomSide()
	
	for i = 0, mTimes do
		cWallEx(startSide, 2)
		wait(delay*mDelayMult)
		cWallEx(startSide + getHalfSides() - 1, 3)
		wait(delay*mDelayMult)
	end
	
	wait(getPerfectDelay(THICKNESS) * 2.5)
end

function pInverseBarrage35Sid(mTimes, mDelayMult)
	delay = getPerfectDelay(THICKNESS) * 5 * mDelayMult
	startSide = getRandomSide()
	
	for i = 0, mTimes do
		cWallEx(startSide, 2)
		wait(delay*mDelayMult)
		cWallEx(startSide + getHalfSides() - 1, 4)
		wait(delay*mDelayMult)
	end
	
	wait(getPerfectDelay(THICKNESS) * 2.5)
end

function pInverseBarrage45Sid(mTimes, mDelayMult)
	delay = getPerfectDelay(THICKNESS) * 5 * mDelayMult
	startSide = getRandomSide()
	
	for i = 0, mTimes do
		cWallEx(startSide, 3)
		wait(delay*mDelayMult)
		cWallEx(startSide + getHalfSides() - 1, 4)
		wait(delay*mDelayMult)
	end
	
	wait(getPerfectDelay(THICKNESS) * 2.5)
end


--perfect for a heptagon
function pInverseBarrage56Sid(mTimes, mDelayMult)
	delay = getPerfectDelay(THICKNESS) * 5 * mDelayMult
	startSide = getRandomSide()
	
	for i = 0, mTimes do
		cWallEx(startSide, 4)
		wait(delay*mDelayMult)
		cWallEx(startSide + getHalfSides() - 1, 5)
		wait(delay*mDelayMult)
	end
	
	wait(getPerfectDelay(THICKNESS) * 2.5)
end

--perfect for an octagon
function pInverseBarrage57Sid(mTimes, mDelayMult)
	delay = getPerfectDelay(THICKNESS) * 5 * mDelayMult
	startSide = getRandomSide()
	
	for i = 0, mTimes do
		cWallEx(startSide, 4)
		wait(delay*mDelayMult)
		cWallEx(startSide + getHalfSides() - 1, 6)
		wait(delay*mDelayMult)
	end
	
	wait(getPerfectDelay(THICKNESS) * 2.5)
end

----

-- pRandomBarrageNoRepeats: spawns barrages with random side - another version (created by Exschwasion)
function pRandomBarrageNoRepeats(mTimes, mDelayMult)
	side = getRandomSide()
	oldSide = 0
	
	for i = 0, mTimes do	
		cBarrage(side)
		oldSide = side
		while oldSide == side do
			side = getRandomSide()
		end
		wait(getPerfectDelay(THICKNESS) * (2 + (getSideDistance(side, oldSide)*mDelayMult)))
	end
	
	wait(getPerfectDelay(THICKNESS) * 5.6)
end

----

-- pMirrorWallStripThick: thick version of pMirrorWallStrip
function pMirrorWallStripThick(mTimes, mExtra)
	oldThickness = THICKNESS
	THICKNESS = getPerfectThickness(THICKNESS) * 1
	delay = getPerfectDelay(THICKNESS) * 3.65
	startSide = getRandomSide()
	
	for i = 0, mTimes do
		rWallEx(startSide, mExtra)
		wait(delay)
	end
	
	THICKNESS = oldThickness
	
	wait(getPerfectDelay(THICKNESS) * 5.00)
end

----

-- pDMTunnel: the pTunnel pattern with mDelayMult
function pDMTunnel(mTimes, mDelayMult)
	oldThickness = THICKNESS
	myThickness = getPerfectThickness(THICKNESS)
	delay = getPerfectDelay(myThickness) * 4
	delay2 = getPerfectDelay(myThickness) * 2.7
	startSide = getRandomSide()
	loopDir = getRandomDir()
	
	THICKNESS = myThickness
	
	for i = 0, mTimes do
		if i < mTimes then
			wall(startSide, myThickness + 6 * getSpeedMult() * delay)
		end
		
		cBarrage(startSide + loopDir)
		wait(delay*mDelayMult)
		
		loopDir = loopDir * -1
	end
	
	THICKNESS = oldThickness
	wait(delay2)
end

function pRandomBarrageTunnel(mTimes, mDelayMult)
	oldThickness = THICKNESS
	myThickness = getPerfectThickness(THICKNESS)
	delay = getPerfectDelay(myThickness) * 5.6 * mDelayMult
	startSide = getRandomSide()
	randomSide = math.random(1, getSides() - 1)
	THICKNESS = myThickness	
	
	for i = 0, mTimes do
		if i < mTimes then
			wall(startSide, myThickness + 7 * getSpeedMult() * delay)
		end

		cBarrageThick(startSide + randomSide, oldThickness)		
		randomSideOld = randomSide
		
		while randomSide == randomSideOld do
	    randomSide = math.random(1, getSides() - 1)		
		end
		
		wait(getPerfectDelay(THICKNESS) * (2 + (getSideDistance(randomSide, randomSideOld)*mDelayMult)))
	end

	THICKNESS = oldThickness	
	wait(getPerfectDelay(THICKNESS) * 14)
end

-- pRandomTunnel: random version of pDMTunnel (no LR-LR - random loopDir)
function pRandomTunnel(mTimes, mDelayMult)
	oldThickness = THICKNESS
	myThickness = getPerfectThickness(THICKNESS)
	delay = getPerfectDelay(myThickness) * 4
	delay2 = getPerfectDelay(myThickness) * 2.7
	startSide = getRandomSide()
	loopDir = getRandomDir()
	
	THICKNESS = myThickness
	
	for i = 0, mTimes do
		if i < mTimes then
			wall(startSide, myThickness + 6 * getSpeedMult() * delay)
		end
		
		cBarrage(startSide + loopDir)
		wait(delay*mDelayMult)
		
		if math.random(0,1) == 0 then
		loopDir = loopDir * -1
		else
		loopDir = loopDir * 1	
        end		
	end
	
	THICKNESS = oldThickness
	wait(delay2)
end

-- pTunnelThin: thin version of pDMTunnel
function pTunnelThin(mTimes, mDelayMult)
	oldThickness = THICKNESS
	myThickness = getPerfectThickness(THICKNESS)
	delay = getPerfectDelay(myThickness) * 4 * mDelayMult
	delay2 = getPerfectDelay(myThickness) * 2
	startSide = getRandomSide()
	loopDir = getRandomDir()
	
	THICKNESS = myThickness
	
	for i = 0, mTimes do
		if i < mTimes then
			wall(startSide, myThickness + 5 * getSpeedMult() * delay)
		end
		
		cBarrageThick(startSide + loopDir, oldThickness)
		wait(delay*mDelayMult)
		
		loopDir = loopDir * -1
	end
	
	wait(delay2)
	THICKNESS = oldThickness
end

-- pRandomTunnelThin: random version of pTunnelThin (no LR-LR - random loopDir)
function pRandomTunnelThin(mTimes, mDelayMult)
	oldThickness = THICKNESS
	myThickness = getPerfectThickness(THICKNESS)
	delay = getPerfectDelay(myThickness) * 4
	delay2 = getPerfectDelay(myThickness) * 2
	startSide = getRandomSide()
	loopDir = getRandomDir()
	
	THICKNESS = myThickness
	
	for i = 0, mTimes do
		if i < mTimes then
			wall(startSide, myThickness + 5 * getSpeedMult() * delay)
		end
		
		cBarrageThick(startSide + loopDir, oldThickness)
		wait(delay*mDelayMult)
		
		if math.random(0,1) == 0 then
		loopDir = loopDir * -1
		else
		loopDir = loopDir * 1	
        end		
	end
	
	THICKNESS = oldThickness
	wait(delay2)
end