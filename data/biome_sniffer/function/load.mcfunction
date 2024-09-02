scoreboard objectives add biome_sniffer.uuid0 dummy
scoreboard objectives add biome_sniffer.uuid1 dummy
scoreboard objectives add biome_sniffer.uuid2 dummy
scoreboard objectives add biome_sniffer.uuid3 dummy

scoreboard objectives add biome_sniffer.distance dummy
scoreboard objectives add biome_sniffer.min_distance dummy
scoreboard objectives add biome_sniffer.-x_distance dummy
scoreboard objectives add biome_sniffer.x_distance dummy
scoreboard objectives add biome_sniffer.-z_distance dummy
scoreboard objectives add biome_sniffer.z_distance dummy

scoreboard objectives add biome_sniffer.x dummy
scoreboard objectives add biome_sniffer.x_goal dummy
scoreboard objectives add biome_sniffer.y_goal dummy
scoreboard objectives add biome_sniffer.z dummy
scoreboard objectives add biome_sniffer.z_goal dummy

team add biome_sniffer.no_collisions
team modify biome_sniffer.no_collisions collisionRule never

# start updating movement
function biome_sniffer:tick_sniffer_targets