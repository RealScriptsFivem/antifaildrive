local czasik = 0
local Kolo = nil
local availableValues = {0, 1, 2, 3}
local zapasowe = {0, 1, 2, 3}

CreateThread(function()
    while true do
        Wait(mdc.waitTime)

        xPed = PlayerPedId()
        pojazd = GetVehiclePedIsIn(xPed, false)

        if pojazd ~= 0 and GetPedInVehicleSeat(pojazd, -1) == xPed then
            local klasaPojazdu, modelPojazdu, nazwaPojazdu = GetVehicleClass(pojazd), GetEntityModel(pojazd), GetDisplayNameFromVehicleModel(GetEntityModel(pojazd)):lower()


            local czyWykluczony = mdc.excluded[nazwaPojazdu] or false

            if not (czyWykluczony or klasaPojazdu == 8 or klasaPojazdu == 9 or klasaPojazdu == 13 or 
                    klasaPojazdu == 14 or klasaPojazdu == 15 or klasaPojazdu == 16 or 
                    klasaPojazdu == 20 or klasaPojazdu == 21 or klasaPojazdu == 22) then
                
                if IsEntityInAir(pojazd) then
                    czasik = czasik + 0.1
                elseif czasik > 1 then
                    xjiif = mdc.wheels()
                    print(xjiif)

                    for i = 1, xjiif do
                        local index = math.random(1, #availableValues)
                        xKolo = index - 1
                        Kolo = availableValues[xKolo]
                        table.remove(availableValues, index)
                        BreakOffVehicleWheel(pojazd, Kolo)
                    end
                    availableValues = {table.unpack(zapasowe)} 

                    SetEntityHealth(pojazd, 0)

                    mdc.notify('error', 'Wheels got broken!', 5000)
                    Wait(5000)
                        if math.random(1, 100) <= mdc.explosionChance then
                            local vehicleCoords = GetEntityCoords(pojazd)
                            Wait(700)
                            local engineCoords = GetOffsetFromEntityInWorldCoords(pojazd, 0.0, 2.0, 0.0) 
                            AddExplosion(engineCoords, 2, 400.0, true, false, false, 4.0) 
                            SetEntityHealth(xPed, 0)
                            StartEntityFire(pojazd)
                            mdc.notify('error', 'Engine exploded!', 3000)
                        
                            if math.random(1, 100) <= mdc.completeExplosionChance then
                                Wait(math.random(4000, 11000)) 

                                local finalCoords = GetEntityCoords(pojazd)
                                AddExplosion(finalCoords, 2, 1100.0, true, false, false, 16.0) 
                            
                                for i = 0, 5 do 
                                    SetVehicleDoorBroken(pojazd, i, true)
                                end
                                SetVehicleTyreBurst(pojazd, 0, true, 1000) 
                                SetVehicleTyreBurst(pojazd, 1, true, 1000)
                                SetVehicleTyreBurst(pojazd, 2, true, 1000) 
                                SetVehicleTyreBurst(pojazd, 3, true, 1000)  
                                AddExplosion(pojazd, 2, 100.0, true, false, false, 1.0)
                            
                                SetVehicleBrakeLights(pojazd, true)
                                mdc.notify('error', 'Vehicle exploded and got destroyed!', 5000)
                            end
                        end
                    czasik = 0
                else
                    czasik = 0
                end

                if GetEntityHealth(pojazd) >= 1000 then
                    Kolo = nil
                end
            else
                czasik = 0
            end
        else
            czasik = 0
            Kolo = nil
            availableValues = {table.unpack(zapasowe)} 
        end
    end
end)
