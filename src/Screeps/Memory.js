"use strict";

export const getMemoryGlobal = function(){ return Memory; }
export const getRawMemoryGlobal = function(){ return RawMemory; }
export const getObjectMemory = function (objectType) {
    return function                (objectId) {
        return function            (key) {
            if   (!Memory[objectType]          )
                   Memory[objectType]          ={};
            if   (!Memory[objectType][objectId])
                   Memory[objectType][objectId]={};
            return Memory[objectType][objectId][key];
        }
    }
}
export const setObjectMemory = function(objectType) {
    return function               (objectId) {
        return function           (key) {
            return function       (value) {
                return function   () {
                    if   (!Memory[objectType]          )
                           Memory[objectType]               ={};
                    if   (!Memory[objectType][objectId])
                           Memory[objectType][objectId]     ={};
                    return Memory[objectType][objectId][key]=value;
                }
            }
        }
    }
}
