function i907-pss:updatevars

# Report sleep messages
execute if score _Dozing% i907-pss matches 1.. if score _Dozing% i907-pss < Sleep% i907-pss run title @a[nbt={Dimension:"minecraft:overworld"}] actionbar [{"color":"yellow", "nbt":"overworld.dozing", "storage":"i907-pss:data"}, " out of ", {"score":{"objective":"i907-pss", "name":"_Players"}}, " people are sleeping."]
execute if score _Dozing% i907-pss >= Sleep% i907-pss unless score _Dozing% i907-pss matches ..0 run title @a[nbt={Dimension:"minecraft:overworld"}] actionbar {"color":"yellow", "text":"You feel yourself dozing off..."}

execute if score _Asleep% i907-pss >= Sleep% i907-pss unless score _Asleep% i907-pss matches ..0 run function i907-pss:timeskip