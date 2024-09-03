$advancement revoke @s only biome_sniffer:sniff_$(biome)
execute at @s run playsound entity.sniffer.sniffing neutral @a ~ ~ ~
execute at @s run playsound entity.sniffer.happy neutral @a ~ ~ ~

$execute as @n[type=minecraft:interaction,tag=biome_sniffer.sniffer_interaction,nbt={interaction:{}}] on passengers run data modify entity @s data.target_biome set value $(biome)

# remove previous wandering traders
execute as @n[type=minecraft:interaction,tag=biome_sniffer.sniffer_interaction,nbt={interaction:{}}] at @e[type=minecraft:wandering_trader,tag=biome_sniffer.sniffer_target] if score @s biome_sniffer.uuid0 = @n[type=minecraft:wandering_trader,tag=biome_sniffer.sniffer_target] biome_sniffer.uuid0 if score @s biome_sniffer.uuid1 = @n[type=minecraft:wandering_trader,tag=biome_sniffer.sniffer_target] biome_sniffer.uuid1 if score @s biome_sniffer.uuid2 = @n[type=minecraft:wandering_trader,tag=biome_sniffer.sniffer_target] biome_sniffer.uuid2 if score @s biome_sniffer.uuid3 = @n[type=minecraft:wandering_trader,tag=biome_sniffer.sniffer_target] biome_sniffer.uuid3 run kill @n[type=minecraft:wandering_trader,tag=biome_sniffer.sniffer_target]

# setup the wandering trader to lead the sniffer
execute as @n[type=minecraft:interaction,tag=biome_sniffer.sniffer_interaction,nbt={interaction:{}}] at @s rotated as @s positioned ^ ^ ^-1.5 run summon minecraft:wandering_trader ~ ~ ~ {Tags:["biome_sniffer.sniffer_target_needs_setup"],Invulnerable:true, active_effects: [{id: "minecraft:invisibility", duration: 2147483646, show_particles: false}], HandItems: [{},{}], Silent: true, attributes:[{id:"minecraft:generic.movement_speed", base: 0.5d}], Offers: {Recipes:[]}, wander_target:[I;0,320,0]}

team join biome_sniffer.no_collisions @e[type=minecraft:wandering_trader,tag=biome_sniffer.sniffer_target_needs_setup]

# store sniffer uuid for matching
execute store result score @e[type=minecraft:wandering_trader,tag=biome_sniffer.sniffer_target_needs_setup] biome_sniffer.uuid0 run scoreboard players get @n[type=minecraft:interaction,tag=biome_sniffer.sniffer_interaction,nbt={interaction:{}}] biome_sniffer.uuid0
execute store result score @e[type=minecraft:wandering_trader,tag=biome_sniffer.sniffer_target_needs_setup] biome_sniffer.uuid1 run scoreboard players get @n[type=minecraft:interaction,tag=biome_sniffer.sniffer_interaction,nbt={interaction:{}}] biome_sniffer.uuid1
execute store result score @e[type=minecraft:wandering_trader,tag=biome_sniffer.sniffer_target_needs_setup] biome_sniffer.uuid2 run scoreboard players get @n[type=minecraft:interaction,tag=biome_sniffer.sniffer_interaction,nbt={interaction:{}}] biome_sniffer.uuid2
execute store result score @e[type=minecraft:wandering_trader,tag=biome_sniffer.sniffer_target_needs_setup] biome_sniffer.uuid3 run scoreboard players get @n[type=minecraft:interaction,tag=biome_sniffer.sniffer_interaction,nbt={interaction:{}}] biome_sniffer.uuid3

# update tags
execute as @e[type=minecraft:wandering_trader,tag=biome_sniffer.sniffer_target_needs_setup] run tag @s add biome_sniffer.sniffer_target
execute as @e[type=minecraft:wandering_trader,tag=biome_sniffer.sniffer_target_needs_setup] run tag @s remove biome_sniffer.sniffer_target_needs_setup

execute as @n[type=minecraft:interaction,tag=biome_sniffer.sniffer_interaction,nbt={interaction:{}}] at @e[type=minecraft:sniffer,tag=biome_sniffer.sniffer_interaction_setup] if score @s biome_sniffer.uuid0 = @n[type=minecraft:sniffer,tag=biome_sniffer.sniffer_interaction_setup] biome_sniffer.uuid0 if score @s biome_sniffer.uuid1 = @n[type=minecraft:sniffer,tag=biome_sniffer.sniffer_interaction_setup] biome_sniffer.uuid1 if score @s biome_sniffer.uuid2 = @n[type=minecraft:sniffer,tag=biome_sniffer.sniffer_interaction_setup] biome_sniffer.uuid2 if score @s biome_sniffer.uuid3 = @n[type=minecraft:sniffer,tag=biome_sniffer.sniffer_interaction_setup] biome_sniffer.uuid3 run data modify entity @n[type=minecraft:sniffer,tag=biome_sniffer.sniffer_interaction_setup] Invulnerable set value true

execute as @n[type=minecraft:interaction,tag=biome_sniffer.sniffer_interaction,nbt={interaction:{}}] at @e[type=minecraft:sniffer,tag=biome_sniffer.sniffer_interaction_setup] if score @s biome_sniffer.uuid0 = @n[type=minecraft:sniffer,tag=biome_sniffer.sniffer_interaction_setup] biome_sniffer.uuid0 if score @s biome_sniffer.uuid1 = @n[type=minecraft:sniffer,tag=biome_sniffer.sniffer_interaction_setup] biome_sniffer.uuid1 if score @s biome_sniffer.uuid2 = @n[type=minecraft:sniffer,tag=biome_sniffer.sniffer_interaction_setup] biome_sniffer.uuid2 if score @s biome_sniffer.uuid3 = @n[type=minecraft:sniffer,tag=biome_sniffer.sniffer_interaction_setup] biome_sniffer.uuid3 run tag @n[type=minecraft:sniffer,tag=biome_sniffer.sniffer_interaction_setup] add biome_sniffer.sniffer_has_goal

# set wander_target
$execute as @n[type=minecraft:interaction,tag=biome_sniffer.sniffer_interaction,nbt={interaction:{}}] on passengers run function biome_sniffer:update_biome_goal {target_biome: $(biome)}