-- | Corresponds to the Screeps API [StructureRoad](http://support.screeps.com/hc/en-us/articles/207713089-StructureRoad)
module Screeps.Road where

import Data.Argonaut.Encode.Class (class EncodeJson, encodeJson)
import Data.Argonaut.Decode.Class (class DecodeJson, decodeJson)
import Data.Eq
import Data.Maybe (Maybe)
import Data.Show (class Show)
import Data.Argonaut.Decode.Error (JsonDecodeError(TypeMismatch))
import Data.Bifunctor (lmap)
import Prelude ((<<<))
import Screeps.FFI (instanceOf)
import Screeps.Decays (class Decays)
import Screeps.Destructible
import Screeps.Id
import Screeps.RoomObject (class RoomObject)
import Screeps.Structure

foreign import data Road :: Type

instance objectRoad :: RoomObject Road
instance structuralRoad :: Structural Road
instance roadHasId :: HasId Road
  where
  validate = instanceOf "StructureRoad"

instance eqRoad :: Eq Road where
  eq = eqById

instance roadDecays :: Decays Road
instance structureRoad :: Structure Road where
  _structureType _ = structure_road

instance showRoad :: Show Road where
  show = showStructure

instance decodeRoad :: DecodeJson Road where
  decodeJson = lmap TypeMismatch <<< decodeJsonWithId

instance encodeRoad :: EncodeJson Road where
  encodeJson = encodeJsonWithId

instance destructibleRoad :: Destructible Road

toRoad :: AnyStructure -> Maybe Road
toRoad = fromAnyStructure

