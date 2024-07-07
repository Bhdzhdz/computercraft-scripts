local speedControler = peripheral.wrap("left");
local speedometer = peripheral.wrap("bottom");
local accumulator = peripheral.wrap("back");


while true do
  local accumulatorPercent = accumulator.getPercent();

  print("Accumulator: " .. accumulatorPercent .. "%");
  print("Speedometer: " .. speedometer.getKineticSpeed("left") .. "rpm");

  local targetSpeed = 0;

  if accumulatorPercent < 100 then
    targetSpeed = speedometer.getKineticTopSpeed("left");
  end

  speedControler.setTargetSpeed("back", targetSpeed);

  print("Speed set to " .. targetSpeed);

  sleep(10)
end
