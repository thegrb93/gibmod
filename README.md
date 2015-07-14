# gibmod

Development repo for GibMod, a silly viscera-based addon for Garry's Mod

Download and install the latest version via the [Steam Workshop](http://steamcommunity.com/sharedfiles/filedetails/?id=168326910)

## help, it lags horribly!
Try enabling performance mode with *gibmod_perfmode 1*

This will decrease a lot of the more resource-intensive settings GibMod uses, such as the amount of gibs and effects, by multiplying them by *gibmod_perffactor*. The effects won't look as elaborate, but you should get better performance.

In multiplayer, the biggest bottleneck is usually bandwidth.  
Decreasing the number of gibs helps, but ultimately what will prevail is a better internet connection for the server.


## console stuff
convar | values | description | default
--- | --- | --- | ---
gibmod_perfmode | 1 or 0 | Enables or disables performance mode | 0
gibmod_perffactor | 0 to 1 | Factor to multiply resource-intensive values by | 0.4
gibmod_disableperfnotice | 1 or 0 | Disables the chat notice about performance mode | 0
--- | --- | --- | ---
gibmod_enabled | 1 or 0 | Enables or disables GibMod entirely | 1
gibmod_deathcam | 1 or 0 | Enables or disables player deathcam | 1
gibmod_explosions | 1 or 0 | Enables or disables gut/goop explosions | 1
gibmod_dismemberment | 1 or 0 | Enables or disables limb dismemberment | 1
gibmod_deathsounds | 1 or 0 | Enables sound effects on death | 1
--- | --- | --- | ---
gibmod_disableplayercollision | 1 or 0 | Disable player collision with ragdolls | 1
gibmod_onlydeadragdolls | 1 or 0 | If enabled, only ragdolls from dead npcs/players will be affected by GibMod | 0
gibmod_onlyhs | 1 or 0 | Only enable the headshot effect | 0
--- | --- | --- | ---
gibmod_effecttime | 0 to # | How many seconds generic effects last before they're removed  | 90
gibmod_spraytime | 0 to # | How many seconds blood spray effects last | 15
gibmod_ragdolltime | 0 to # | How many seconds ragdolls of dead players and npcs stick around for | 60

---

command | arguments | description
--- | --- | ---
gibmod_clean | --- | Immediately cleans all viscera off the map
gibmod_getvalue | key | Prints internal value of key
gibmod_setvalue | key, val | Prints internal value of key to second arg
gibmod_addtolist | listname, val | Adds string to one of the lists below, see developer seciton for string syntax

---

listname | corresponding function
--- | ---
ignored_entity | GibMod_AddIgnoredEntityName
ignored_model | GibMod_AddIgnoredModelString
bodygib | GibMod_AddBodyGib
headgib | GibMod_AddHeadGib

---

## for developers
```lua
-- hook called when player or npc dies so you can do stuff with the ragdoll
function myHook( ent, exploded, ragdoll )
    -- ent       = entity that died (can be player or npc!)
    -- exploded  = true if entity exploded and created no ragdoll
    -- ragdoll   = entity's ragdoll or nil if exploded
    print( ent, exploded, ragdoll )
end
hook.Add( 'GibModEntityDeath', 'myHookString', myHook )

-- extend functionality
GibMod_AddIgnoredEntityName( "full_entity_name" )
GibMod_AddIgnoredModelString( "partial-string-to-match" )
GibMod_AddBodyGib( "full/model.name" )
GibMod_AddHeadGib( "full/model.name" )

-- internal values
GibMod_SetValue( "key", "value" )
value = GibMod_GetValue( "key" )
```

### internal values
key | default | description
--- | --- | ---
centralexplodeForce | 6500 | force required to explode a ragdoll when hit in a central bone
explodeForce | 12000 | force required to explode a ragdoll from any bone
explosionDamage | 100 | damage required for an explosion to explode a ragdoll
limbDamage | 24 | damage required to dismember a limb
headcrabVolume | 35 | max distance from damage position to headcrab origin to be considered a hit on the headcrab
childExplodePercent | 0.5 | if a dismembered bone is parent to this percentage of all bones, the ragdoll is exploded instead
minGibs | 12 | min number of body gibs
maxGibs | 24 | max number of body gibs
numHgibs | 6 | number of headshot gibs
numBloodStreams | 14 | number of blood streams
bloodStreamLength | 250 | length of blood streams in hammer units
bloodStreamVariance | 100 | maximum length to be randomly added or subtracted from bloodStreamLength
originWeight | 500 | weight of blood stream origin entity
originForce | -4000 | downward force to apply to blood stream origin