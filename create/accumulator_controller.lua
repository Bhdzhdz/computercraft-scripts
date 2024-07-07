local speed_controler = peripheral.wrap("left")
local speedometer = peripheral.wrap("left")
local accumulator = peripheral.wrap("back")


while true do
  local accumulatorPercent = accumulator.getPercent();

  print("Accumulator: " .. accumulatorPercent);


  local targetSpeed = 0;
  if accumulatorPercent < 100 then
    targetSpeed = speedometer.getKineticTopSpeed("left");
  end

  speed_controler.setTargetSpeed("back", targetSpeed);
  speed_controler.setTargetSpeed("left", targetSpeed);
  speed_controler.setTargetSpeed("right", targetSpeed);
  speed_controler.setTargetSpeed("front", targetSpeed);

  print("Speed set to " .. targetSpeed);

  sleep(10)
end
