local speedControler = peripheral.wrap("back");
local speedometer = peripheral.wrap("top");
local accumulator = peripheral.wrap("right");


while true do
  local accumulatorPercent = accumulator.getPercent();

  print("Accumulator: " .. accumulatorPercent .. "%");
  print("Speedometer: " .. speedometer.getTargetSpeed() .. "rpm");

  local targetSpeed = 0;

  if accumulatorPercent < 100 then
    targetSpeed = speedometer.getTargetSpeed();
  end

  speedControler.setTargetSpeed(targetSpeed);

  print("Speed set to " .. targetSpeed);

  sleep(10)
end
