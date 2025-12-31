-- ███████████████████████████████████████████████████████████████████
-- █▄─▄▄▀█▄─▄▄─██▀▄─██▄─▄█████─▄▄▄▄█─▄▄▄─█▄─▄▄▀█▄─▄█▄─▄▄─█─▄─▄─█─▄▄▄▄█
-- ██─▄─▄██─▄█▀██─▀─███─██▀███▄▄▄▄─█─███▀██─▄─▄██─███─▄▄▄███─███▄▄▄▄─█
-- ▀▄▄▀▄▄▀▄▄▄▄▄▀▄▄▀▄▄▀▄▄▄▄▄▀▀▀▄▄▄▄▄▀▄▄▄▄▄▀▄▄▀▄▄▀▄▄▄▀▄▄▄▀▀▀▀▄▄▄▀▀▄▄▄▄▄▀

-- DISCORD : https://discord.com/invite/NGZuuaFmWY
-- GTHHUB : https://github.com/RealScriptsFivem/antifaildrive

-- █░█ █▀▀ █▀█ █▀ █ █▀█ █▄░█   ▄█ ░ █▀█
-- ▀▄▀ ██▄ █▀▄ ▄█ █ █▄█ █░▀█   ░█ ▄ █▄█


Cfg = {}

-- << MAKE SURE TO JOIN OUR DISCORD WE RELEASE A LOT FREE, OPTIMIZED AND UNIQUE SCRIPTS THAT WILL MAKE YOUR SERVER STAND OUT! >>
--  https://discord.com/invite/NGZuuaFmWY
-- If the discord link doesn't know let us know on: https://madechester.pl

Cfg.notify = function(xType, message, duration)
    -- Example usage of ox_lib's notification system, you can use your own notify here
    lib.notify({type = xType, description = message, duration = duration or 5000})

    -- edit all notifications messages in client.lua
end

-- Explosion system, added to create more immersion and 
Cfg.enableExplosion = true -- enables the explosion system after wheels break
Cfg.explosionChance = 10 -- 10% for the vehicle to explode afert wheels got broken
Cfg.completeExplosionChance = 60 -- 60% for the vehicle to explode completly after the first explosion (only activates when the Cfg.explosionChance happens)
Cfg.explosionExcluded = { -- If you enable the explosion system, you can exclude vehicles from it here
    ["zentorno"] = true,
}

Cfg.wheels = function()
    return math.random(1, 4) --how many weels to be broken
    --return 2 --you can also do a still value
end

Cfg.waitTime = 100 --wait time in loop (Higher --> Better optimization but the script may break, I do not  recommend any changes here as the script itself is pretty well optimized)

Cfg.excluded = { -- Here you can add excluded vehicles on which the system won't work
    ["rmod7"] = true,
    ["rebel"] = true,
    ["zentorno"] = true,
}

