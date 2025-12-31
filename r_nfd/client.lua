local airTime = 0.0
local availableWheels = {0, 1, 2, 3}
local defaultWheels = {0, 1, 2, 3}

CreateThread(function()
    while true do
        Wait(Cfg.waitTime)

        local ped = PlayerPedId()
        local vehicle = GetVehiclePedIsIn(ped, false)

        if vehicle ~= 0 and GetPedInVehicleSeat(vehicle, -1) == ped then
            local vehicleClass = GetVehicleClass(vehicle)
            local vehicleName = GetDisplayNameFromVehicleModel(GetEntityModel(vehicle)):lower()

            if Cfg.excluded[vehicleName]
                or vehicleClass == 8  -- moto
                or vehicleClass == 9
                or vehicleClass == 13
                or vehicleClass == 14
                or vehicleClass == 15
                or vehicleClass == 16
                or vehicleClass == 20
                or vehicleClass == 21
                or vehicleClass == 22 then

                airTime = 0.0
                goto continue
            end

            if IsEntityInAir(vehicle) then
                airTime = airTime + 0.1
            elseif airTime > 1.0 then
                local wheelsToBreak = Cfg.wheels()

                for i = 1, math.min(wheelsToBreak, #availableWheels) do
                    local index = math.random(1, #availableWheels)
                    local wheelIndex = availableWheels[index]
                
                    BreakOffVehicleWheel(
                        vehicle,
                        wheelIndex,
                        false,  
                        false,  
                        true,
                        false   
                    )
                
                    table.remove(availableWheels, index)
                end
                
                availableWheels = {table.unpack(defaultWheels)}

                airTime = 0.0

                Cfg.notify('error', 'Wheels got broken!', 5000)

                if Cfg.enableExplosion and not Cfg.explosionExcluded[vehicleName] then
                    if math.random(1, 100) <= Cfg.explosionChance then
                        Wait(700)

                        local engineCoords = GetOffsetFromEntityInWorldCoords(vehicle, 0.0, 2.0, 0.0)
                        AddExplosion(engineCoords, 2, 400.0, true, false, false, 4.0)

                        StartEntityFire(vehicle)
                        Cfg.notify('error', 'Engine exploded!', 3000)

                        if math.random(1, 100) <= Cfg.completeExplosionChance then
                            Wait(math.random(4000, 11000))

                            local finalCoords = GetEntityCoords(vehicle)
                            AddExplosion(finalCoords, 2, 1100.0, true, false, false, 16.0)

                            for i = 0, 5 do
                                SetVehicleDoorBroken(vehicle, i, true)
                            end

                            for i = 0, 3 do
                                SetVehicleTyreBurst(vehicle, i, true, 1000)
                            end

                            Cfg.notify('error', 'Vehicle exploded and got destroyed!', 5000)
                        end
                    end
                end
            else
                airTime = 0.0
            end
        else
            airTime = 0.0
            availableWheels = {table.unpack(defaultWheels)}
        end

        ::continue::
    end
end)
