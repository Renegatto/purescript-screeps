-- | Corresponds to the Screeps API [StructureTower](http://support.screeps.com/hc/en-us/articles/208437105-StructureTower)
module Screeps.Tower where

import Control.Monad.Eff (Eff)
import Data.Maybe (Maybe)

import Screeps.Constants (structure_tower)
import Screeps.Effects (CMD)
import Screeps.Structure (unsafeCast)
import Screeps.ReturnCode
import Screeps.Types (Creep, Structure, Tower)
import Screeps.FFI (runThisEffFn1, runThisEffFn2, unsafeField)

energy :: Tower -> Int
energy = unsafeField "energy"

energyCapacity :: Tower -> Int
energyCapacity = unsafeField "energyCapacity"

attack :: forall e. Tower -> Creep -> Eff ( cmd :: CMD | e) ReturnCode
attack = runThisEffFn1 "attack"

heal :: forall e. Tower -> Creep -> Eff (cmd :: CMD | e) ReturnCode
heal = runThisEffFn1 "heal"

repair :: forall a e. Tower -> Structure a -> Eff (cmd :: CMD | e) ReturnCode
repair = runThisEffFn1 "repair"

transferEnergy :: forall e. Tower -> Creep -> Eff (cmd :: CMD | e) ReturnCode
transferEnergy = runThisEffFn1 "transferEnergy"

transferEnergyAmt :: forall e. Tower -> Creep -> Int -> Eff (cmd :: CMD | e) ReturnCode
transferEnergyAmt = runThisEffFn2 "transferEnergy"

toTower :: forall a. Structure a -> Maybe Tower
toTower = unsafeCast structure_tower
