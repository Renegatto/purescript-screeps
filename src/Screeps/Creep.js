"use strict";

export const totalAmtCarrying = function(creep){
  return _.sum(creep.carry);
}
