

--[[ Created by Synth Morxemplum ]]--

--[[
	* The purpose of this script is to enhance the math class by adding a couple more functions that might come in handy
	* Some of these equations were easy, while some were damn hard and took many revisions to perfect!
	* I hope you enjoy!
]]

function math.pingpong(timeframe, mMax) -- Ping pong is a function that represents a value moving back and forth between 0 and mMax
	local loop = math.floor(timeframe/mMax) + 1;
	if (loop%2==0) then
		value = (mMax*loop)-timeframe;
	else
		value = timeframe-(mMax * (loop-1));
	end
	return value;
end
function math.round(double) -- Since the makers of Lua were too lazy to do this, I decided to make it
	if (double - math.floor(double) < 0.5) then
		return math.floor(double);
	else
		return math.ceil(double);
	end
end
function math.precision(double, decimalplace) -- Round a decimal to decimalplace decimal places
	return math.round(double * math.pow(10,decimalplace))/math.pow(10,decimalplace);
end
function math.precisionzeros(double, decimalplace) -- Show any additional zeros that were hidden in math.precision
	return string.format("%"..decimalplace.."d", math.precision(double,decimalplace));
end
function math.lerp(a,b,i) -- Linear interpolation function (My favorite). Returns point a to point b by i (i must be between 0-1)
	return a + (b-a) * (i);
end
function math.randomDouble(min, max)  -- math.random but it gives you a result in double form
	return math.random() * (max-min) + min;
end
function math.average(numbers) -- Takes an array of numbers and returns the average
	sum = 0;
	for i = 1,#numbers do
		sum = sum + numbers[i];
	end
	return sum/#numbers;
end
function math.easeInOut(time,a,b,duration,bend) -- Eases in and out from point "a" to point "b" "duration" long with bendiness "bend". Returns the value at moment "time"
  return (math.pow(time,bend)/(math.pow(time,bend) + math.pow((duration-time),bend))) * (b-a) + a;
end

function math.sign(number) 
	if number < 0 then
		return -1;
	elseif number > 0 then
		return 1;
	else
		return 0;
	end
end

-- Clamps a value so it stays in between min and max
function math.clamp(value, min, max)
	if (value < min) then
		return min;
	elseif (value > max) then
		return max;
	else
		return value;
	end
end