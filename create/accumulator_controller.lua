local speed_controler = peripheral.wrap("left")
local speedometer = peripheral.wrap("left")
local accumulator = peripheral.wrap("back")


while true do
  local accumulatorPercent = accumulator.getPercent()

  print("Accumulator: " .. accumulatorPercent)


  local targetSpeed = 0;
  if accumulatorPercent < 100 then
    targetSpeed = speedometer.getKineticTopSpeed("left")
  else

  end
  speed_controler.setTargetSpeed("back", 0)
  print("Speed set to " .. targetSpeed)

  sleep(10)
end
