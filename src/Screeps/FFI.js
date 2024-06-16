"use strict";

// module Screeps.FFI

export const unsafeField = function(key){
  return function(obj){
    return obj[key];
  }
}

export const unsafeIntField = function(key){
  return function(obj){
    return obj[key]|0;
  }
}

export const unsafeOptField_helper = function(Nothing) {
  return function(Just) {
    return function(key){
        return function(obj){
        var r= obj[key];
        if (_.isUndefined (r)) {
            return Nothing;
        } else {
            return Just   (r);
        }
      }
    }
  }
}

export const unsafeGetFieldEffect = function(key){
  return function(obj){
    return function(){
      return obj[key];
    }
  }
}

export const unsafeSetFieldEffect = function(key){
  return function(obj){
    return function(val){
      return function(){
        obj[key] = val;
      }
    }
  }
}

export const unsafeDeleteFieldEffect = function(key){
  return function(obj){
      return function(){
        delete obj[key];
      }
  }
}

export const runThisEffectFn0 = function(key){
  return function(self){
    return function(){
      return self[key]();
    }
  }
}

export const runThisEffectFn1 = function(key){
  return function(self){
    return function(a){
      return function(){
        return self[key](a);
      }
    }
  }
}

export const runThisEffectFn2 = function(key){
  return function(self){
    return function(a){
      return function(b){
        return function(){
          return self[key](a, b);
        }
      }
    }
  }
}

export const runThisEffectFn3 = function(key){
  return function(self){
    return function(a){
      return function(b){
        return function(c){
          return function(){
            return self[key](a, b, c);
          }
        }
      }
    }
  }
}

export const runThisEffectFn4 = function(key){
  return function(self){
    return function(a){
      return function(b){
        return function(c){
          return function(d){
            return function(){
              return self[key](a, b, c, d);
            }
          }
        }
      }
    }
  }
}

export const runThisEffectFn5 = function(key){
  return function(self){
    return function(a){
      return function(b){
        return function(c){
          return function(d){
            return function(e){
              return function(){
                return self[key](a, b, c, d, e);
              }
            }
          }
        }
      }
    }
  }
}

export const runThisEffectFn6 = function(key){
  return function(self){
    return function(a){
      return function(b){
        return function(c){
          return function(d){
            return function(e){
              return function(f){
                return function(){
                  return self[key](a, b, c, d, e, f);
                }
              }
            }
          }
        }
      }
    }
  }
}

export const runThisFn0 = function(key){
  return function(self){
    return self[key]();
  }
}

export const runThisFn1 = function(key){
  return function(self){
    return function(a){
      return self[key](a);
    }
  }
}

export const runThisFn2 = function(key){
  return function(self){
    return function(a){
      return function(b){
        return self[key](a, b);
      }
    }
  }
}

export const runThisFn3 = function(key){
  return function(self){
    return function(a){
      return function(b){
        return function(c){
          return self[key](a, b, c);
        }
      }
    }
  }
}

export const runThisFn4 = function(key){
  return function(self){
    return function(a){
      return function(b){
        return function(c){
          return function(d){
            return self[key](a, b, c, d);
          }
        }
      }
    }
  }
}

export const runThisFn5 = function(key){
  return function(self){
    return function(a){
      return function(b){
        return function(c){
          return function(d){
            return function(e){
              return self[key](a, b, c, d, e);
            }
          }
        }
      }
    }
  }
}

export const runThisFn6 = function(key){
  return function(self){
    return function(a){
      return function(b){
        return function(c){
          return function(d){
            return function(e){
              return function(f){
                return self[key](a, b, c, d, e, f);
              }
            }
          }
        }
      }
    }
  }
}
export const _null = null;
export const undefined = undefined;

export const notNullOrUndefined = function(x){
    return x;
}

export const isNull = function(x){
    return x === null;
}

export const isUndefined = function(x){
    return x === undefined;
}

export const toMaybeImpl = function(val, nothing, just){
    if(val === null || val === undefined){
        return nothing;
    } else {
        return just(val);
    }
}

export const selectMaybesImpl = function(isJust){
    return function(fromJust){
        return function(obj){
            var newObj = {};
            for(var key in obj){
                if(!obj.hasOwnProperty(key)){
                    continue;
                }
                if(isJust(obj[key])){
                    newObj[key] = fromJust(obj[key]);
                }
            }
            return newObj;
        }
    }
}

export const instanceOf = function (className) {
    return function (object) {
        var global = (1,eval)('this');
        return object instanceof global[className];
    }
}
