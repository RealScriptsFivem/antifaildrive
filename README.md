
# AntiFailDrive (Version 1.0)
JOIN DISCORD FOR MORE HIGH QUALITY FREE SCRIPTS
This FiveM script provides immersive vehicle dynamics and failure handling mechanics. Below, you will find descriptions of the features and configuration options.

---

## Features
- **Disable Vehicle Jumps**: Prevents vehicles from unrealistically jumping into the air.
- **Disable Fail Driving**: Removes erratic driving behavior for smoother gameplay.
- **Immersive Explosions**: Adds dynamic and visually immersive explosions when vehicles sustain damage.
- **Wheel Destruction on Impact**: Vehicle wheels are damaged or destroyed when falling from heights.
- **Vehicle Whitelist**: Exclude specific vehicles from fail driving and explosion mechanics.

---

## Configuration
### Notifications
The script uses `ox_lib` for notifications. Replace `mdc.notify` in `client.lua` to customize the notify function.

```lua
mdc.notify = function(xType, message, duration)
    lib.notify({type = xType, description = message, duration = duration or 5000})
end
```

### Settings
| Setting | Description |
|---------|-------------|
| `mdc.explosionChance` | Chance (in percentage) for the engine explosion to occur after severe damage. Default: `100` |
| `mdc.completeExplosionChance` | Chance for a complete vehicle explosion after the engine is destroyed. Default: `100` |
| `mdc.wheels` | Function to determine how many wheels break. Default: `math.random(1, 4)` (random) |
| `mdc.waitTime` | Wait time for the main loop (in milliseconds). Default: `100` |
| `mdc.excluded` | Table to list excluded vehicles by their model names. Example: `["rmod7"] = true` |

---

## Example Excluded Vehicles
```lua
mdc.excluded = {
    ["rmod7"] = true,
    ["rebel"] = true,
    ["zentorno"] = true,
}
```

---

## License
This script is open-source and free to use. See `LICENSE.md` for more details.

For further questions or support, join our [Discord](https://discord.gg/2Ud9Dbfu4e) or visit the [GitHub Repository](https://github.com/RealScriptsFivem/antifaildrive).
