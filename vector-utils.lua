--
-- VECTORS
--

-- hypotenuse of legs x and y of a right triangle
utils.hypo = function(x, y)
  return math.sqrt(x*x+y*y)
end

-- normalize vector given x and y components; optional scalar
utils.normalize = function(x, y, scalar)
  local m = utils.hypo(x, y)
  if scalar == nil then
    return x/m, y/m
  end
  return (x/m)*scalar, (y/m)*scalar
end

-- returns unit vector of two points optionally multiplied by scalar
utils.vectorize = function(x1, y1, x2, y2, scalar)
  local x, y = x2-x1, y2-y1
  return utils.normalize(x, y, scalar)
end

-- converts corona rotation and magnitude to corona coordinate vectors
local function polarToXy(rotation, magnitude)
  local a = math.rad(90 - rotation)
  return magnitude * math.cos(a), -magnitude * math.sin(a)
end
