local speedController = peripheral.wrap("back");
local stressometer = peripheral.wrap("bottom");
local accumulator = peripheral.wrap("right");


while true do
  local accumulatorPercent = accumulator.getPercent();

  print("Accumulator: " .. accumulatorPercent .. "%");

  local targetSpeed = 0;

  if accumulatorPercent < 100 then
    local stress = stressometer.getStress();
    local capacity = stressometer.getStressCapacity();
    local currentSpeed = speedController.getTargetSpeed();

    print("Stress: " .. stress);
    print("Capacity: " .. capacity);

    local maxSpeed = currentSpeed + (capacity - stress) / 64;

    targetSpeed = maxSpeed * (1 - (accumulatorPercent / 300));
    if targetSpeed > 256 then
      targetSpeed = 256;
    elseif targetSpeed < 30 or capacity == 0 then
      print("There are not enough SU to power the Alternator")
      targetSpeed = 0;
    end
  end

  speedController.setTargetSpeed(targetSpeed);

  print("Speed set to " .. targetSpeed);

  sleep(30);
end
