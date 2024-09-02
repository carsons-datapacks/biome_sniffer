# store uuid in scoreboard
execute store result score @s biome_sniffer.uuid0 run data get entity @s UUID[0]
execute store result score @s biome_sniffer.uuid1 run data get entity @s UUID[1]
execute store result score @s biome_sniffer.uuid2 run data get entity @s UUID[2]
execute store result score @s biome_sniffer.uuid3 run data get entity @s UUID[3]

# summon interaction entity
$summon minecraft:interaction ^ ^ ^ {Tags:["biome_sniffer.sniffer_interaction_needs_setup"], Passengers:[{id:"minecraft:marker",Tags:["biome_sniffer.sniffer_interaction_marker"]}], width:1, height:1, Rotation: $(Rotation)}
execute store result score @e[type=minecraft:interaction, tag=biome_sniffer.sniffer_interaction_needs_setup] biome_sniffer.uuid0 run data get entity @s UUID[0]
execute store result score @e[type=minecraft:interaction, tag=biome_sniffer.sniffer_interaction_needs_setup] biome_sniffer.uuid1 run data get entity @s UUID[1]
execute store result score @e[type=minecraft:interaction, tag=biome_sniffer.sniffer_interaction_needs_setup] biome_sniffer.uuid2 run data get entity @s UUID[2]
execute store result score @e[type=minecraft:interaction, tag=biome_sniffer.sniffer_interaction_needs_setup] biome_sniffer.uuid3 run data get entity @s UUID[3]
execute as @e[type=minecraft:interaction,tag=biome_sniffer.sniffer_interaction_needs_setup] run tag @s add biome_sniffer.sniffer_interaction
execute as @e[type=minecraft:interaction,tag=biome_sniffer.sniffer_interaction_needs_setup] run tag @s remove biome_sniffer.sniffer_interaction_needs_setup

# add interaction entity setup tag
tag @s add biome_sniffer.sniffer_interaction_setup