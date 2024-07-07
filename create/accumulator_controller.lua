local speed_controler = peripheral.wrap("left")
local speedometer = peripheral.wrap("left")
local accumulator = peripheral.wrap("right")


while true do
  if accumulator.getPercent() >= 100 then
    speed_controler.setTargetSpeed("back", 0)
  else
    local topSpeed = speedometer.getKineticTopSpeed("left")
    speed_controler.setTargetSpeed("back", topSpeed)
  end

  sleep(10)
end
