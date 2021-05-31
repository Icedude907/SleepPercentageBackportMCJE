# execute store result storage i907-pss:data players int 1.0 run execute if entity @a
# execute store result storage i907-pss:data overworld.players int 1.0 run execute if entity @a[nbt={Dimension:"minecraft:overworld"}]
execute store result storage i907-pss:data overworld.dozing int 1.0 run execute if entity @a[nbt={Dimension:"minecraft:overworld"}, nbt=!{SleepTimer:0s}]
execute store result storage i907-pss:data overworld.asleep int 1.0 run execute if entity @a[nbt={Dimension:"minecraft:overworld"}, nbt={SleepTimer:100s}]

# Do math
execute store result score _Dozing% i907-pss run data get storage i907-pss:data overworld.dozing 100.0
execute store result score _Players i907-pss run execute if entity @a[nbt={Dimension:"minecraft:overworld"}]
scoreboard players operation _Dozing% i907-pss /= _Players i907-pss
execute store result score _Asleep% i907-pss run data get storage i907-pss:data overworld.asleep 100.0
scoreboard players operation _Asleep% i907-pss /= _Players i907-pss

# Report sleep messages
execute if score _Dozing% i907-pss matches 1.. if score _Dozing% i907-pss < Sleep% i907-pss run title @a[nbt={Dimension:"minecraft:overworld"}] actionbar [{"color":"yellow", "nbt":"overworld.dozing", "storage":"i907-pss:data"}, " out of ", {"score":{"objective":"i907-pss", "name":"_Players"}}, " people are sleeping."]
execute if score _Dozing% i907-pss >= Sleep% i907-pss run title @a[nbt={Dimension:"minecraft:overworld"}] actionbar {"color":"yellow", "text":"You feel yourself dozing off..."}

# Check if time to skip
execute if score _Asleep% i907-pss >= Sleep% i907-pss run title @a[nbt={Dimension:"minecraft:overworld"}] actionbar {"color":"yellow", "text":"Skipping the night. Waking up will stop it."}
execute if score _Asleep% i907-pss >= Sleep% i907-pss run time add 150t