local args = {};

local da_location = args[1];
local sc_location = args[2];

local speed_controler = peripheral.wrap(da_location);

local targetSpeed = 64;

speed_controler.setTargetSpeed(sc_location, targetSpeed);

print("D A " .. da_location);
print("S C " .. sc_location);
print("Speed set to " .. targetSpeed);
