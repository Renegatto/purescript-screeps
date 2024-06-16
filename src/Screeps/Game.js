"use strict";

export const unsafeGameField = function (fieldName) {
    return function() { return Game[fieldName]; }
}
export const map = Game.map;
export const gcl = Game.gcl;
export const getUsedCpu = function () {
    return Game.cpu.getUsed();
}
export const notify  = function (msg) {
    return function() {
        return Game.notify(msg);
    }
}
export const notify_ = function (msg) {
    return function(interval) {
        return function() {
            return Game.notify(msg, interval);
        }
    }
}
