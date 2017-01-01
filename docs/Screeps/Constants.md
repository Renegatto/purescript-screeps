## Module Screeps.Constants

#### `color_red`

``` purescript
color_red :: Color
```

#### `color_purple`

``` purescript
color_purple :: Color
```

#### `color_blue`

``` purescript
color_blue :: Color
```

#### `color_cyan`

``` purescript
color_cyan :: Color
```

#### `color_green`

``` purescript
color_green :: Color
```

#### `color_yellow`

``` purescript
color_yellow :: Color
```

#### `color_orange`

``` purescript
color_orange :: Color
```

#### `color_brown`

``` purescript
color_brown :: Color
```

#### `color_grey`

``` purescript
color_grey :: Color
```

#### `color_white`

``` purescript
color_white :: Color
```

#### `obstacle_object_types`

``` purescript
obstacle_object_types :: Array String
```

#### `part_move`

``` purescript
part_move :: BodyPartType
```

#### `part_work`

``` purescript
part_work :: BodyPartType
```

#### `part_carry`

``` purescript
part_carry :: BodyPartType
```

#### `part_attack`

``` purescript
part_attack :: BodyPartType
```

#### `part_ranged_attack`

``` purescript
part_ranged_attack :: BodyPartType
```

#### `part_tough`

``` purescript
part_tough :: BodyPartType
```

#### `part_heal`

``` purescript
part_heal :: BodyPartType
```

#### `part_claim`

``` purescript
part_claim :: BodyPartType
```

#### `bodypart_cost`

``` purescript
bodypart_cost :: { move :: Int, work :: Int, attack :: Int, carry :: Int, heal :: Int, ranged_attack :: Int, tough :: Int, claim :: Int }
```

#### `creep_life_time`

``` purescript
creep_life_time :: Int
```

#### `creep_claim_life_time`

``` purescript
creep_claim_life_time :: Int
```

#### `creep_corpse_rate`

``` purescript
creep_corpse_rate :: Int
```

#### `carry_capacity`

``` purescript
carry_capacity :: Int
```

#### `harvest_power`

``` purescript
harvest_power :: Int
```

#### `harvest_mineral_power`

``` purescript
harvest_mineral_power :: Int
```

#### `repair_power`

``` purescript
repair_power :: Int
```

#### `dismantle_power`

``` purescript
dismantle_power :: Int
```

#### `build_power`

``` purescript
build_power :: Int
```

#### `attack_power`

``` purescript
attack_power :: Int
```

#### `upgrade_controller_power`

``` purescript
upgrade_controller_power :: Int
```

#### `ranged_attack_power`

``` purescript
ranged_attack_power :: Int
```

#### `heal_power`

``` purescript
heal_power :: Int
```

#### `ranged_heal_power`

``` purescript
ranged_heal_power :: Int
```

#### `repair_cost`

``` purescript
repair_cost :: Int
```

#### `dismantle_cost`

``` purescript
dismantle_cost :: Int
```

#### `rampart_decay_amount`

``` purescript
rampart_decay_amount :: Int
```

#### `rampart_decay_time`

``` purescript
rampart_decay_time :: Int
```

#### `rampart_hits`

``` purescript
rampart_hits :: Int
```

#### `rampart_hits_max`

``` purescript
rampart_hits_max :: { 2 :: Int, 3 :: Int, 4 :: Int, 5 :: Int, 6 :: Int, 7 :: Int, 8 :: Int }
```

#### `energy_regen_time`

``` purescript
energy_regen_time :: Int
```

#### `energy_decay`

``` purescript
energy_decay :: Int
```

#### `spawn_hits`

``` purescript
spawn_hits :: Int
```

#### `spawn_energy_start`

``` purescript
spawn_energy_start :: Int
```

#### `spawn_energy_capacity`

``` purescript
spawn_energy_capacity :: Int
```

#### `creep_spawn_time`

``` purescript
creep_spawn_time :: Int
```

#### `source_energy_capacity`

``` purescript
source_energy_capacity :: Int
```

#### `source_energy_neutral_capacity`

``` purescript
source_energy_neutral_capacity :: Int
```

#### `source_energy_keeper_capacity`

``` purescript
source_energy_keeper_capacity :: Int
```

#### `wall_hits`

``` purescript
wall_hits :: Int
```

#### `wall_hits_max`

``` purescript
wall_hits_max :: Int
```

#### `extension_hits`

``` purescript
extension_hits :: Int
```

#### `extension_energy_capacity`

``` purescript
extension_energy_capacity :: { 0 :: Int, 1 :: Int, 2 :: Int, 3 :: Int, 4 :: Int, 5 :: Int, 6 :: Int, 7 :: Int, 8 :: Int }
```

#### `road_hits`

``` purescript
road_hits :: Int
```

#### `road_wearout`

``` purescript
road_wearout :: Int
```

#### `road_decay_amount`

``` purescript
road_decay_amount :: Int
```

#### `road_decay_time`

``` purescript
road_decay_time :: Int
```

#### `link_hits`

``` purescript
link_hits :: Int
```

#### `link_hits_max`

``` purescript
link_hits_max :: Int
```

#### `link_capacity`

``` purescript
link_capacity :: Int
```

#### `link_cooldown`

``` purescript
link_cooldown :: Int
```

#### `link_loss_ratio`

``` purescript
link_loss_ratio :: Number
```

#### `storage_capacity`

``` purescript
storage_capacity :: Int
```

#### `storage_hits`

``` purescript
storage_hits :: Int
```

#### `construction_cost`

``` purescript
construction_cost :: { spawn :: Int, extension :: Int, road :: Int, constructedWall :: Int, rampart :: Int, link :: Int, storage :: Int, tower :: Int, observer :: Int, powerSpawn :: Int, extractor :: Int, lab :: Int, terminal :: Int, container :: Int, nuker :: Int }
```

#### `construction_cost_road_swamp_ratio`

``` purescript
construction_cost_road_swamp_ratio :: Int
```

#### `controller_levels`

``` purescript
controller_levels :: { 1 :: Int, 2 :: Int, 3 :: Int, 4 :: Int, 5 :: Int, 6 :: Int, 7 :: Int, 8 :: Int }
```

#### `controller_structures`

``` purescript
controller_structures :: { spawn :: StructureInfo, extension :: StructureInfo, road :: StructureInfo, constructedWall :: StructureInfo, rampart :: StructureInfo, link :: StructureInfo, storage :: StructureInfo, tower :: StructureInfo, observer :: StructureInfo, powerSpawn :: StructureInfo, extractor :: StructureInfo, lab :: StructureInfo, terminal :: StructureInfo, container :: StructureInfo, nuker :: StructureInfo }
```

#### `controller_downgrade`

``` purescript
controller_downgrade :: StructureInfo
```

#### `controller_claim_downgrade`

``` purescript
controller_claim_downgrade :: Number
```

#### `controller_reserve`

``` purescript
controller_reserve :: Int
```

#### `controller_reserve_max`

``` purescript
controller_reserve_max :: Int
```

#### `controller_max_upgrade_per_tick`

``` purescript
controller_max_upgrade_per_tick :: Int
```

#### `controller_attack_blocked_upgrade`

``` purescript
controller_attack_blocked_upgrade :: Int
```

#### `tower_hits`

``` purescript
tower_hits :: Int
```

#### `tower_capacity`

``` purescript
tower_capacity :: Int
```

#### `tower_energy_cost`

``` purescript
tower_energy_cost :: Int
```

#### `tower_power_attack`

``` purescript
tower_power_attack :: Int
```

#### `tower_power_heal`

``` purescript
tower_power_heal :: Int
```

#### `tower_power_repair`

``` purescript
tower_power_repair :: Int
```

#### `tower_optimal_range`

``` purescript
tower_optimal_range :: Int
```

#### `tower_falloff_range`

``` purescript
tower_falloff_range :: Int
```

#### `tower_falloff`

``` purescript
tower_falloff :: Number
```

#### `observer_hits`

``` purescript
observer_hits :: Int
```

#### `observer_range`

``` purescript
observer_range :: Int
```

#### `power_bank_hits`

``` purescript
power_bank_hits :: Int
```

#### `power_bank_capacity_max`

``` purescript
power_bank_capacity_max :: Int
```

#### `power_bank_capacity_min`

``` purescript
power_bank_capacity_min :: Int
```

#### `power_bank_capacity_crit`

``` purescript
power_bank_capacity_crit :: Number
```

#### `power_bank_decay`

``` purescript
power_bank_decay :: Int
```

#### `power_bank_hit_back`

``` purescript
power_bank_hit_back :: Number
```

#### `power_spawn_hits`

``` purescript
power_spawn_hits :: Int
```

#### `power_spawn_energy_capacity`

``` purescript
power_spawn_energy_capacity :: Int
```

#### `power_spawn_power_capacity`

``` purescript
power_spawn_power_capacity :: Int
```

#### `power_spawn_energy_ratio`

``` purescript
power_spawn_energy_ratio :: Int
```

#### `extractor_hits`

``` purescript
extractor_hits :: Int
```

#### `lab_hits`

``` purescript
lab_hits :: Int
```

#### `lab_mineral_capacity`

``` purescript
lab_mineral_capacity :: Int
```

#### `lab_energy_capacity`

``` purescript
lab_energy_capacity :: Int
```

#### `lab_boost_energy`

``` purescript
lab_boost_energy :: Int
```

#### `lab_boost_mineral`

``` purescript
lab_boost_mineral :: Int
```

#### `lab_cooldown`

``` purescript
lab_cooldown :: Int
```

#### `gcl_pow`

``` purescript
gcl_pow :: Number
```

#### `gcl_multiply`

``` purescript
gcl_multiply :: Int
```

#### `gcl_novice`

``` purescript
gcl_novice :: Int
```

#### `mode_simulation`

``` purescript
mode_simulation :: Mode
```

#### `mode_survival`

``` purescript
mode_survival :: Mode
```

#### `mode_world`

``` purescript
mode_world :: Mode
```

#### `mode_arena`

``` purescript
mode_arena :: Mode
```

#### `terrain_mask_wall`

``` purescript
terrain_mask_wall :: TerrainMask
```

#### `terrain_mask_swamp`

``` purescript
terrain_mask_swamp :: TerrainMask
```

#### `terrain_mask_lava`

``` purescript
terrain_mask_lava :: TerrainMask
```

#### `max_construction_sites`

``` purescript
max_construction_sites :: Int
```

#### `max_creep_size`

``` purescript
max_creep_size :: Int
```

#### `mineral_regen_time`

``` purescript
mineral_regen_time :: Int
```

#### `mineral_min_amount`

``` purescript
mineral_min_amount :: { H :: Int, O :: Int, L :: Int, K :: Int, Z :: Int, U :: Int, X :: Int }
```

#### `mineral_random_factor`

``` purescript
mineral_random_factor :: Int
```

#### `terminal_capacity`

``` purescript
terminal_capacity :: Int
```

#### `terminal_hits`

``` purescript
terminal_hits :: Int
```

#### `terminal_send_cost`

``` purescript
terminal_send_cost :: Number
```

#### `terminal_min_send`

``` purescript
terminal_min_send :: Int
```

#### `container_hits`

``` purescript
container_hits :: Int
```

#### `container_capacity`

``` purescript
container_capacity :: Int
```

#### `container_decay`

``` purescript
container_decay :: Int
```

#### `container_decay_time`

``` purescript
container_decay_time :: Int
```

#### `container_decay_time_owned`

``` purescript
container_decay_time_owned :: Int
```

#### `nuker_hits`

``` purescript
nuker_hits :: Int
```

#### `nuker_cooldown`

``` purescript
nuker_cooldown :: Int
```

#### `nuker_energy_capacity`

``` purescript
nuker_energy_capacity :: Int
```

#### `nuker_ghodium_capacity`

``` purescript
nuker_ghodium_capacity :: Int
```

#### `nuke_land_time`

``` purescript
nuke_land_time :: Int
```

#### `nuke_range`

``` purescript
nuke_range :: Int
```

#### `nuke_damage`

``` purescript
nuke_damage :: { 0 :: Int, 1 :: Int, 4 :: Int }
```

#### `resource_energy`

``` purescript
resource_energy :: ResourceType
```

#### `resource_power`

``` purescript
resource_power :: ResourceType
```

#### `resource_hydrogen`

``` purescript
resource_hydrogen :: ResourceType
```

#### `resource_oxygen`

``` purescript
resource_oxygen :: ResourceType
```

#### `resource_utrium`

``` purescript
resource_utrium :: ResourceType
```

#### `resource_lemergium`

``` purescript
resource_lemergium :: ResourceType
```

#### `resource_keanium`

``` purescript
resource_keanium :: ResourceType
```

#### `resource_zynthium`

``` purescript
resource_zynthium :: ResourceType
```

#### `resource_catalyst`

``` purescript
resource_catalyst :: ResourceType
```

#### `resource_ghodium`

``` purescript
resource_ghodium :: ResourceType
```

#### `resource_hydroxide`

``` purescript
resource_hydroxide :: ResourceType
```

#### `resource_zynthium_keanite`

``` purescript
resource_zynthium_keanite :: ResourceType
```

#### `resource_utrium_lemergite`

``` purescript
resource_utrium_lemergite :: ResourceType
```

#### `resource_utrium_hydride`

``` purescript
resource_utrium_hydride :: ResourceType
```

#### `resource_utrium_oxide`

``` purescript
resource_utrium_oxide :: ResourceType
```

#### `resource_keanium_hydride`

``` purescript
resource_keanium_hydride :: ResourceType
```

#### `resource_keanium_oxide`

``` purescript
resource_keanium_oxide :: ResourceType
```

#### `resource_lemergium_hydride`

``` purescript
resource_lemergium_hydride :: ResourceType
```

#### `resource_lemergium_oxide`

``` purescript
resource_lemergium_oxide :: ResourceType
```

#### `resource_zynthium_hydride`

``` purescript
resource_zynthium_hydride :: ResourceType
```

#### `resource_zynthium_oxide`

``` purescript
resource_zynthium_oxide :: ResourceType
```

#### `resource_ghodium_hydride`

``` purescript
resource_ghodium_hydride :: ResourceType
```

#### `resource_ghodium_oxide`

``` purescript
resource_ghodium_oxide :: ResourceType
```

#### `resource_utrium_acid`

``` purescript
resource_utrium_acid :: ResourceType
```

#### `resource_utrium_alkalide`

``` purescript
resource_utrium_alkalide :: ResourceType
```

#### `resource_keanium_acid`

``` purescript
resource_keanium_acid :: ResourceType
```

#### `resource_keanium_alkalide`

``` purescript
resource_keanium_alkalide :: ResourceType
```

#### `resource_lemergium_acid`

``` purescript
resource_lemergium_acid :: ResourceType
```

#### `resource_lemergium_alkalide`

``` purescript
resource_lemergium_alkalide :: ResourceType
```

#### `resource_zynthium_acid`

``` purescript
resource_zynthium_acid :: ResourceType
```

#### `resource_zynthium_alkalide`

``` purescript
resource_zynthium_alkalide :: ResourceType
```

#### `resource_ghodium_acid`

``` purescript
resource_ghodium_acid :: ResourceType
```

#### `resource_ghodium_alkalide`

``` purescript
resource_ghodium_alkalide :: ResourceType
```

#### `resource_catalyzed_utrium_acid`

``` purescript
resource_catalyzed_utrium_acid :: ResourceType
```

#### `resource_catalyzed_utrium_alkalide`

``` purescript
resource_catalyzed_utrium_alkalide :: ResourceType
```

#### `resource_catalyzed_keanium_acid`

``` purescript
resource_catalyzed_keanium_acid :: ResourceType
```

#### `resource_catalyzed_keanium_alkalide`

``` purescript
resource_catalyzed_keanium_alkalide :: ResourceType
```

#### `resource_catalyzed_lemergium_acid`

``` purescript
resource_catalyzed_lemergium_acid :: ResourceType
```

#### `resource_catalyzed_lemergium_alkalide`

``` purescript
resource_catalyzed_lemergium_alkalide :: ResourceType
```

#### `resource_catalyzed_zynthium_acid`

``` purescript
resource_catalyzed_zynthium_acid :: ResourceType
```

#### `resource_catalyzed_zynthium_alkalide`

``` purescript
resource_catalyzed_zynthium_alkalide :: ResourceType
```

#### `resource_catalyzed_ghodium_acid`

``` purescript
resource_catalyzed_ghodium_acid :: ResourceType
```

#### `resource_catalyzed_ghodium_alkalide`

``` purescript
resource_catalyzed_ghodium_alkalide :: ResourceType
```


