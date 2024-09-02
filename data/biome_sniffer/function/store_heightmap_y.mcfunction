# use the heighmaps to get the target y position
$execute positioned $(x) 320 $(z) positioned over motion_blocking run summon minecraft:marker ~ ~ ~ {Tags:["biome_sniffer.sniffer_goal_heightmap_y"]}
execute store result entity @s wander_target[1] int 1 run data get entity @n[type=minecraft:marker,tag=biome_sniffer.sniffer_goal_heightmap_y] Pos[1]
kill @n[type=minecraft:marker,tag=biome_sniffer.sniffer_goal_heightmap_y]