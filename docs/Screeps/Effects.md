## Module Screeps.Effects

#### `CMD`

``` purescript
data CMD :: Effect
```

Tag for functions which execute a Screeps command as a side effect e.g. to move a creep.

#### `MEMORY`

``` purescript
data MEMORY :: Effect
```

Memory accesses are tagged with this effect.

#### `TICK`

``` purescript
data TICK :: Effect
```

Global scope is cleared periodically, so values depending on global variables like Game and Memory need to be fetched dynamically. This effect enforces this.

#### `TIME`

``` purescript
data TIME :: Effect
```

For time-dependent functions where the output changes depending on when it is called.


