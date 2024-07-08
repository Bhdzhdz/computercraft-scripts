local speedController = peripheral.wrap("back");
local stressometer = peripheral.wrap("top");
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

    if maxSpeed > 256 then
      targetSpeed = 256;
    else
      targetSpeed = maxSpeed;
    end
  end

  speedController.setTargetSpeed(targetSpeed);

  print("Speed set to " .. targetSpeed);

  sleep(10);
end
