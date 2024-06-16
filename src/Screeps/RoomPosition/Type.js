"use strict";

// module Screeps.RoomPosition

export const mkRoomPosition = function(x){
  return function(y){
    return function(roomName){
      return new RoomPosition(x, y, roomName);
    }
  }
}
