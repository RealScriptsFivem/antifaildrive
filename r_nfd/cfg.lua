-- ███████████████████████████████████████████████████████████████████
-- █▄─▄▄▀█▄─▄▄─██▀▄─██▄─▄█████─▄▄▄▄█─▄▄▄─█▄─▄▄▀█▄─▄█▄─▄▄─█─▄─▄─█─▄▄▄▄█
-- ██─▄─▄██─▄█▀██─▀─███─██▀███▄▄▄▄─█─███▀██─▄─▄██─███─▄▄▄███─███▄▄▄▄─█
-- ▀▄▄▀▄▄▀▄▄▄▄▄▀▄▄▀▄▄▀▄▄▄▄▄▀▀▀▄▄▄▄▄▀▄▄▄▄▄▀▄▄▀▄▄▀▄▄▄▀▄▄▄▀▀▀▀▄▄▄▀▀▄▄▄▄▄▀

-- DISCORD : https://discord.gg/2Ud9Dbfu4e
-- GTHHUB : https://github.com/RealScriptsFivem/antifaildrive

-- █░█ █▀▀ █▀█ █▀ █ █▀█ █▄░█   ▄█ ░ █▀█
-- ▀▄▀ ██▄ █▀▄ ▄█ █ █▄█ █░▀█   ░█ ▄ █▄█


mdc = {}

mdc.notify = function(xType, message, duration)
    -- Example usage of ox_lib's notification system, you can use your own notify here
    lib.notify({type = xType, description = message, duration = duration or 5000})

    -- edit all notifications messages in client.lua
end

mdc.explosionChance = 100 -- 10%
mdc.completeExplosionChance = 100 -- chance for the vehicle to explode completly after engine got destroyed

mdc.wheels = function()
    return math.random(1, 4) --how many weels to be broken
    --return 2 --you can also do a still value
end

mdc.waitTime = 100 --wait time in loop

mdc.excluded = { -- Here you can add excluded vehicles
    ["rmod7"] = true,
    ["rebel"] = true,
    ["zentorno"] = true,
}