# @s is the marker entity riding the interaction entity
# vehicle is the interaction entity

$execute on vehicle at @s store result score @s biome_sniffer.distance run locate biome $(target_biome)
execute on vehicle run scoreboard players set @s biome_sniffer.min_distance 80

# if we're close enough to see the biome, stop tracking
execute on vehicle if score @s biome_sniffer.distance < @s biome_sniffer.min_distance at @e[type=minecraft:sniffer,tag=biome_sniffer.sniffer_has_goal] if score @n[type=minecraft:sniffer,tag=biome_sniffer.sniffer_has_goal] biome_sniffer.uuid0 = @s biome_sniffer.uuid0 if score @n[type=minecraft:sniffer,tag=biome_sniffer.sniffer_has_goal] biome_sniffer.uuid1 = @s biome_sniffer.uuid1 if score @n[type=minecraft:sniffer,tag=biome_sniffer.sniffer_has_goal] biome_sniffer.uuid2 = @s biome_sniffer.uuid2 if score @n[type=minecraft:sniffer,tag=biome_sniffer.sniffer_has_goal] biome_sniffer.uuid3 = @s biome_sniffer.uuid3 as @n[type=minecraft:sniffer,tag=biome_sniffer.sniffer_has_goal] at @s run playsound entity.sniffer.happy neutral @a ~ ~ ~
execute on vehicle if score @s biome_sniffer.distance < @s biome_sniffer.min_distance at @e[type=minecraft:sniffer,tag=biome_sniffer.sniffer_has_goal] if score @n[type=minecraft:sniffer,tag=biome_sniffer.sniffer_has_goal] biome_sniffer.uuid0 = @s biome_sniffer.uuid0 if score @n[type=minecraft:sniffer,tag=biome_sniffer.sniffer_has_goal] biome_sniffer.uuid1 = @s biome_sniffer.uuid1 if score @n[type=minecraft:sniffer,tag=biome_sniffer.sniffer_has_goal] biome_sniffer.uuid2 = @s biome_sniffer.uuid2 if score @n[type=minecraft:sniffer,tag=biome_sniffer.sniffer_has_goal] biome_sniffer.uuid3 = @s biome_sniffer.uuid3 as @n[type=minecraft:sniffer,tag=biome_sniffer.sniffer_has_goal] run return run tag @s remove biome_sniffer.sniffer_has_goal

# store the current position
execute on vehicle store result score @s biome_sniffer.x at @s run data get entity @s Pos[0]
execute on vehicle store result score @s biome_sniffer.z at @s run data get entity @s Pos[2]

# check each direction and set the goal if that direction gets us closer
$execute on vehicle at @s positioned ~-50 ~ ~ store result score @s biome_sniffer.-x_distance run locate biome $(target_biome)
execute on vehicle if score @s biome_sniffer.distance > @s biome_sniffer.-x_distance run return run function biome_sniffer:set_biome_goal { x_goal: -50, z_goal: 0 }
$execute on vehicle at @s positioned ~50 ~ ~ store result score @s biome_sniffer.x_distance run locate biome $(target_biome)
execute on vehicle if score @s biome_sniffer.distance > @s biome_sniffer.x_distance run return run function biome_sniffer:set_biome_goal { x_goal: 50, z_goal: 0 }

$execute on vehicle at @s positioned ~ ~ ~-50 store result score @s biome_sniffer.-z_distance run locate biome $(target_biome)
execute on vehicle if score @s biome_sniffer.distance > @s biome_sniffer.-z_distance run return run function biome_sniffer:set_biome_goal { x_goal: 0, z_goal: -50 }
$execute on vehicle at @s positioned ~ ~ ~50 store result score @s biome_sniffer.z_distance run locate biome $(target_biome)
execute on vehicle if score @s biome_sniffer.distance > @s biome_sniffer.z_distance run return run function biome_sniffer:set_biome_goal { x_goal: 0, z_goal: 50 }

execute on vehicle run return run tag @s remove biome_sniffer.sniffer_has_goal