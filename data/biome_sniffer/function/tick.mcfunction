# summon interaction entities for sniffers
execute as @e[type=minecraft:sniffer,tag=!biome_sniffer.sniffer_interaction_setup] at @s rotated as @s positioned ^ ^0.2 ^1.75 run function biome_sniffer:summon_sniffer_interaction with entity @s

# remove wandering traders that don't have a sniffer anymore
execute as @e[type=minecraft:sniffer,tag=!biome_sniffer.sniffer_has_goal] at @e[type=minecraft:wandering_trader,tag=biome_sniffer.sniffer_target] if score @s biome_sniffer.uuid0 = @n[type=minecraft:wandering_trader,tag=biome_sniffer.sniffer_target] biome_sniffer.uuid0 if score @s biome_sniffer.uuid1 = @n[type=minecraft:wandering_trader,tag=biome_sniffer.sniffer_target] biome_sniffer.uuid1 if score @s biome_sniffer.uuid2 = @n[type=minecraft:wandering_trader,tag=biome_sniffer.sniffer_target] biome_sniffer.uuid2 if score @s biome_sniffer.uuid3 = @n[type=minecraft:wandering_trader,tag=biome_sniffer.sniffer_target] biome_sniffer.uuid3 run function biome_sniffer:stop_sniffer_tracking
execute as @e[type=minecraft:wandering_trader,tag=biome_sniffer.sniffer_target] at @e[type=minecraft:sniffer,tag=biome_sniffer.sniffer_has_goal] if score @s biome_sniffer.uuid0 = @n[type=minecraft:sniffer,tag=biome_sniffer.sniffer_has_goal] biome_sniffer.uuid0 if score @s biome_sniffer.uuid1 = @n[type=minecraft:sniffer,tag=biome_sniffer.sniffer_has_goal] biome_sniffer.uuid1 if score @s biome_sniffer.uuid2 = @n[type=minecraft:sniffer,tag=biome_sniffer.sniffer_has_goal] biome_sniffer.uuid2 if score @s biome_sniffer.uuid3 = @n[type=minecraft:sniffer,tag=biome_sniffer.sniffer_has_goal] biome_sniffer.uuid3 run tag @s add biome_sniffer.sniffer_target_keep_alive
execute as @e[type=minecraft:wandering_trader,tag=!biome_sniffer.sniffer_target_keep_alive] run kill @s
execute as @e[type=minecraft:wandering_trader,tag=biome_sniffer.sniffer_target_keep_alive] run tag @s remove biome_sniffer.sniffer_target_keep_alive

# update wandering trader invisiblity (hide milk bucket)
execute as @e[type=minecraft:wandering_trader,tag=biome_sniffer.sniffer_target] run effect give @s minecraft:invisibility infinite 1 true
execute as @e[type=minecraft:wandering_trader,tag=biome_sniffer.sniffer_target] run data remove entity @s HandItems[0]

# update sniffer position and other stats
execute as @e[type=minecraft:sniffer,tag=biome_sniffer.sniffer_has_goal] at @e[type=minecraft:wandering_trader,tag=biome_sniffer.sniffer_target] if score @s biome_sniffer.uuid0 = @n[type=minecraft:wandering_trader,tag=biome_sniffer.sniffer_target] biome_sniffer.uuid0 if score @s biome_sniffer.uuid1 = @n[type=minecraft:wandering_trader,tag=biome_sniffer.sniffer_target] biome_sniffer.uuid1 if score @s biome_sniffer.uuid2 = @n[type=minecraft:wandering_trader,tag=biome_sniffer.sniffer_target] biome_sniffer.uuid2 if score @s biome_sniffer.uuid3 = @n[type=minecraft:wandering_trader,tag=biome_sniffer.sniffer_target] biome_sniffer.uuid3 positioned ~ ~ ~ rotated as @n[type=minecraft:wandering_trader,tag=biome_sniffer.sniffer_target] run tp @s ~ ~ ~ ~ ~
execute as @e[type=minecraft:sniffer,tag=!biome_sniffer.sniffer_has_goal,nbt={Invulnerable:true}] run data modify entity @s Invulnerable set value false

# if the player leashes the sniffer, stop moving toward the biome
execute as @e[type=minecraft:sniffer,tag=biome_sniffer.sniffer_has_goal] at @s on leasher run tag @n[type=minecraft:sniffer,tag=biome_sniffer.sniffer_has_goal] remove biome_sniffer.sniffer_has_goal

# move interaction entities with sniffers
execute as @e[type=minecraft:interaction, tag=biome_sniffer.sniffer_interaction] at @e[type=minecraft:sniffer,tag=biome_sniffer.sniffer_interaction_setup] if score @s biome_sniffer.uuid0 = @n[type=minecraft:sniffer,tag=biome_sniffer.sniffer_interaction_setup] biome_sniffer.uuid0 if score @s biome_sniffer.uuid1 = @n[type=minecraft:sniffer,tag=biome_sniffer.sniffer_interaction_setup] biome_sniffer.uuid1 if score @s biome_sniffer.uuid2 = @n[type=minecraft:sniffer,tag=biome_sniffer.sniffer_interaction_setup] biome_sniffer.uuid2 if score @s biome_sniffer.uuid3 = @n[type=minecraft:sniffer,tag=biome_sniffer.sniffer_interaction_setup] biome_sniffer.uuid3 rotated as @n[type=minecraft:sniffer,tag=biome_sniffer.sniffer_interaction_setup] positioned ^ ^0.1 ^1.5 run tag @s add biome_sniffer.sniffer_interaction_keep_alive
execute as @e[type=minecraft:interaction, tag=biome_sniffer.sniffer_interaction] at @e[type=minecraft:sniffer,tag=biome_sniffer.sniffer_interaction_setup] if score @s biome_sniffer.uuid0 = @n[type=minecraft:sniffer,tag=biome_sniffer.sniffer_interaction_setup] biome_sniffer.uuid0 if score @s biome_sniffer.uuid1 = @n[type=minecraft:sniffer,tag=biome_sniffer.sniffer_interaction_setup] biome_sniffer.uuid1 if score @s biome_sniffer.uuid2 = @n[type=minecraft:sniffer,tag=biome_sniffer.sniffer_interaction_setup] biome_sniffer.uuid2 if score @s biome_sniffer.uuid3 = @n[type=minecraft:sniffer,tag=biome_sniffer.sniffer_interaction_setup] biome_sniffer.uuid3 unless entity @n[type=minecraft:sniffer,tag=biome_sniffer.sniffer_interaction_setup,tag=biome_sniffer.sniffer_has_goal] on passengers if data entity @s data.target_biome run data remove entity @s data.target_biome
execute as @e[type=minecraft:interaction, tag=biome_sniffer.sniffer_interaction] at @e[type=minecraft:sniffer,tag=biome_sniffer.sniffer_interaction_setup] if score @s biome_sniffer.uuid0 = @n[type=minecraft:sniffer,tag=biome_sniffer.sniffer_interaction_setup] biome_sniffer.uuid0 if score @s biome_sniffer.uuid1 = @n[type=minecraft:sniffer,tag=biome_sniffer.sniffer_interaction_setup] biome_sniffer.uuid1 if score @s biome_sniffer.uuid2 = @n[type=minecraft:sniffer,tag=biome_sniffer.sniffer_interaction_setup] biome_sniffer.uuid2 if score @s biome_sniffer.uuid3 = @n[type=minecraft:sniffer,tag=biome_sniffer.sniffer_interaction_setup] biome_sniffer.uuid3 rotated as @n[type=minecraft:sniffer,tag=biome_sniffer.sniffer_interaction_setup] positioned ^ ^0.1 ^1.5 run tp @s ~ ~ ~ ~ ~

execute as @e[type=minecraft:interaction, tag=!biome_sniffer.sniffer_interaction_keep_alive] on passengers run kill @s
execute as @e[type=minecraft:interaction, tag=!biome_sniffer.sniffer_interaction_keep_alive] run kill @s
execute as @e[type=minecraft:interaction, tag=biome_sniffer.sniffer_interaction_keep_alive] run tag @s remove biome_sniffer.sniffer_interaction_keep_alive