export const usePathFinder=function() {
    return PathFinder.use(true);
}
export const deserialize=function(json) {
    return function () {
        return PathFinder.CostMatrix.deserialize(json);
    }
}
export const search=function(from) {
    return     function(to  ) {
        return function(opts) {
            var clonedOpts = {
                  roomCallback:    function (rn) { return opts.roomCallback(rn)(); }
                , plainCost:       opts.plainCost
                , swampCost:       opts.swampCost
                , flee:            opts.flee
                , maxOps:          opts.maxOps
                , maxRooms:        opts.maxRooms
                , maxCost:         opts.maxCost
                , heuristicWeight: opts.heuristicWeight
                };
            return function() {
                return PathFinder.search(from, to, clonedOpts);
            }
        }
    }
}
export const newCostMatrix=function() {
    return new PathFinder.CostMatrix;
}
export const infinity=Number.POSITIVE_INFINITY;

