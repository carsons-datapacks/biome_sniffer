# schedule goal update
execute as @e[type=minecraft:marker,tag=biome_sniffer.sniffer_interaction_marker] if data entity @s data.target_biome run function biome_sniffer:update_biome_goal with entity @s data
schedule function biome_sniffer:tick_sniffer_targets 60s