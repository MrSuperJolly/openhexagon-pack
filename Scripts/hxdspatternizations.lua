execScript("common.lua")
execScript("utils.lua")
execScript("alternativepatterns.lua")

-- Hexadorsip's patternizations. Inspired by Exschwasion and Super Hexagon.
function pTriSpiral(mTimes)
	delay = getPerfectDelay(THICKNESS) * 3.5
	if getSides() == 3 then
		for i = 0, mTimes do
			patternizer({1,1,0, 1,0,0, 1,0,1, 0,0,1, 0,1,1, 0,0,1, 0,0,1, 0,0,0, 0,0,0}, getPerfectThickness(THICKNESS * 2.5))
		end
		wait(delay)
	end
end

-- "No Escape" patterns
function pTriangle(mTimes)
	delay = getPerfectDelay(THICKNESS) * 3.5
	if getSides() == 3 then
		for i = 0, mTimes do
			patternizer({1,1,1, 0,0,0, 0,0,0}, getPerfectThickness(THICKNESS * 0.4))
		end
		wait(delay)
	end
end

function pTriangle2(mTimes)
	delay = getPerfectDelay(THICKNESS) * 3.5
	if getSides() == 3 then
		for i = 0, mTimes do
			patternizer({1,1,1, 0,0,0, 1,1,1, 0,0,0, 0,0,0}, getPerfectThickness(THICKNESS * 0.5))
		end
		wait(delay)
	end
end

function pHexagon(mTimes)
	delay = getPerfectDelay(THICKNESS) * 3.7
	if getSides() == 6 then
		for i = 0, mTimes do
			patternizer({1,1,1,1,1,1, 0,0,0,0,0,0, 0,0,0,0,0,0}, getPerfectThickness(THICKNESS))
		end
		wait(delay)
	end
end