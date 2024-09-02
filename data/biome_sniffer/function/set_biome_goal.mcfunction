# setup goal positions
$scoreboard players set @s biome_sniffer.x_goal $(x_goal)
scoreboard players operation @s biome_sniffer.x_goal += @s biome_sniffer.x
$scoreboard players set @s biome_sniffer.z_goal $(z_goal)
scoreboard players operation @s biome_sniffer.z_goal += @s biome_sniffer.z

# set wander_target x/z
execute at @e[type=minecraft:wandering_trader,tag=biome_sniffer.sniffer_target] if score @s biome_sniffer.uuid0 = @n[type=minecraft:wandering_trader,tag=biome_sniffer.sniffer_target] biome_sniffer.uuid0 if score @s biome_sniffer.uuid1 = @n[type=minecraft:wandering_trader,tag=biome_sniffer.sniffer_target] biome_sniffer.uuid1 if score @s biome_sniffer.uuid2 = @n[type=minecraft:wandering_trader,tag=biome_sniffer.sniffer_target] biome_sniffer.uuid2 if score @s biome_sniffer.uuid3 = @n[type=minecraft:wandering_trader,tag=biome_sniffer.sniffer_target] biome_sniffer.uuid3 run data modify entity @n[type=minecraft:wandering_trader,tag=biome_sniffer.sniffer_target] wander_target set value [I;0,320,0]
execute at @e[type=minecraft:wandering_trader,tag=biome_sniffer.sniffer_target] if score @s biome_sniffer.uuid0 = @n[type=minecraft:wandering_trader,tag=biome_sniffer.sniffer_target] biome_sniffer.uuid0 if score @s biome_sniffer.uuid1 = @n[type=minecraft:wandering_trader,tag=biome_sniffer.sniffer_target] biome_sniffer.uuid1 if score @s biome_sniffer.uuid2 = @n[type=minecraft:wandering_trader,tag=biome_sniffer.sniffer_target] biome_sniffer.uuid2 if score @s biome_sniffer.uuid3 = @n[type=minecraft:wandering_trader,tag=biome_sniffer.sniffer_target] biome_sniffer.uuid3 store result entity @n[type=minecraft:wandering_trader,tag=biome_sniffer.sniffer_target] wander_target[0] int 1 run scoreboard players get @s biome_sniffer.x_goal
execute at @e[type=minecraft:wandering_trader,tag=biome_sniffer.sniffer_target] if score @s biome_sniffer.uuid0 = @n[type=minecraft:wandering_trader,tag=biome_sniffer.sniffer_target] biome_sniffer.uuid0 if score @s biome_sniffer.uuid1 = @n[type=minecraft:wandering_trader,tag=biome_sniffer.sniffer_target] biome_sniffer.uuid1 if score @s biome_sniffer.uuid2 = @n[type=minecraft:wandering_trader,tag=biome_sniffer.sniffer_target] biome_sniffer.uuid2 if score @s biome_sniffer.uuid3 = @n[type=minecraft:wandering_trader,tag=biome_sniffer.sniffer_target] biome_sniffer.uuid3 store result entity @n[type=minecraft:wandering_trader,tag=biome_sniffer.sniffer_target] wander_target[2] int 1 run scoreboard players get @s biome_sniffer.z_goal

# set wander_target y based on heightmaps
execute store result storage biome_sniffer:wander_target x int 1 run scoreboard players get @s biome_sniffer.x_goal
execute store result storage biome_sniffer:wander_target z int 1 run scoreboard players get @s biome_sniffer.z_goal
execute at @e[type=minecraft:wandering_trader,tag=biome_sniffer.sniffer_target] if score @s biome_sniffer.uuid0 = @n[type=minecraft:wandering_trader,tag=biome_sniffer.sniffer_target] biome_sniffer.uuid0 if score @s biome_sniffer.uuid1 = @n[type=minecraft:wandering_trader,tag=biome_sniffer.sniffer_target] biome_sniffer.uuid1 if score @s biome_sniffer.uuid2 = @n[type=minecraft:wandering_trader,tag=biome_sniffer.sniffer_target] biome_sniffer.uuid2 if score @s biome_sniffer.uuid3 = @n[type=minecraft:wandering_trader,tag=biome_sniffer.sniffer_target] biome_sniffer.uuid3 as @n[type=minecraft:wandering_trader,tag=biome_sniffer.sniffer_target] run function biome_sniffer:store_heightmap_y with storage biome_sniffer:wander_target