"use strict";

export const createCreepImpl = function(structure){
    return function(parts){
        return function(left){
            return function(right){
                return function(){
                    var result = structure.createCreep(parts);
                    if(typeof result === "string"){
                        return right(result);
                    } else {
                        return left(result);
                    }
                }
            }
        }
    }
}

export const createCreepPrimeImpl = function(structure){
    return function(parts){
        return function(name){
            return function(memory){
                return function(left){
                    return function(right){
                        return function(){
                            var result = structure.createCreep(parts, name, memory);
                            if(typeof result === "string"){
                                return right(result);
                            } else {
                                return left(result);
                            }
                        }
                    }
                }
            }
        }
    }
}
