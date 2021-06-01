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