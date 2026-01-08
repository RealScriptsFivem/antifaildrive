local airTime = 0.0
local avbWheels = {0, 1, 2, 3}
local Wheels = {0, 1, 2, 3}

CreateThread(function()
    while true do
        Wait(Cfg.waitTime)

        local ped = PlayerPedId()
        local vehicle = GetVehiclePedIsIn(ped, false)

        if vehicle ~= 0 and GetPedInVehicleSeat(vehicle, -1) == ped then
            local vehicleClass = GetVehicleClass(vehicle)
            local vehicleName = GetDisplayNameFromVehicleModel(GetEntityModel(vehicle)):lower()

            if Cfg.excluded[vehicleName]
                or vehicleClass == 8
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
                for i = 1, math.min(Cfg.wheels(), #avbWheels) do
                    local index = math.random(1, #avbWheels)
                    local wheelIndex = avbWheels[index]
                
                    BreakOffVehicleWheel(
                        vehicle,
                        wheelIndex,
                        false,  
                        false,  
                        true,
                        false   
                    )
                
                    table.remove(avbWheels, index)
                end
                
                avbWheels = {table.unpack(Wheels)}

                airTime = 0.0

                Cfg.notify('error', Cfg.strings.wheels, 5000)

                if Cfg.enableExplosion and not Cfg.explosionExcluded[vehicleName] then
                    if math.random(1, 100) <= Cfg.explosionChance then
                        Wait(700)

                        local engineCoords = GetOffsetFromEntityInWorldCoords(vehicle, 0.0, 2.0, 0.0)
                        AddExplosion(engineCoords, 2, 400.0, true, false, false, 4.0)

                        StartEntityFire(vehicle)
                        Cfg.notify('error', Cfg.strings.engine, 3000)

                        if math.random(1, 100) <= Cfg.completeExplosionChance then
                            Wait(math.random(4000, 11000))

                            local finalCoords = GetEntityCoords(vehicle)
                            AddExplosion(finalCoords, 2, 1100.0, true, false, false, 16.0)

                            for i = 0, 5 do
                                SetVehicleDoorBroken(vehicle, i, true)
                            end

                            Cfg.notify('error', Cfg.strings.explosion, 5000)
                        end
                    end
                end
            else
                airTime = 0.0
            end
        else
            airTime = 0.0
            avbWheels = {table.unpack(Wheels)}
        end

        ::continue::
    end
end)

