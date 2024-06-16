export const structure_spawn = STRUCTURE_SPAWN;
export const structure_extension = STRUCTURE_EXTENSION;
export const structure_road = STRUCTURE_ROAD;
export const structure_wall = STRUCTURE_WALL;
export const structure_rampart = STRUCTURE_RAMPART;
export const structure_keeper_lair = STRUCTURE_KEEPER_LAIR;
export const structure_portal = STRUCTURE_PORTAL;
export const structure_controller = STRUCTURE_CONTROLLER;
export const structure_link = STRUCTURE_LINK;
export const structure_storage = STRUCTURE_STORAGE;
export const structure_tower = STRUCTURE_TOWER;
export const structure_observer = STRUCTURE_OBSERVER;
export const structure_power_bank = STRUCTURE_POWER_BANK;
export const structure_power_spawn = STRUCTURE_POWER_SPAWN;
export const structure_extractor = STRUCTURE_EXTRACTOR;
export const structure_lab = STRUCTURE_LAB;
export const structure_terminal = STRUCTURE_TERMINAL;
export const structure_container = STRUCTURE_CONTAINER;
export const structure_nuker = STRUCTURE_NUKER;

export const numStructures=function (structureType) {
  return function (level) {
    return CONTROLLER_STRUCTURES[structureType][level];
  }
}
