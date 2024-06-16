-- | Defines the main types used in the library and the relationships between them.
module Screeps.Types where

import Screeps.RoomObject

import Data.Argonaut.Decode.Class (class DecodeJson)
import Data.Argonaut.Decode.Error (JsonDecodeError(TypeMismatch))
import Data.Bifunctor (lmap)
import Data.Argonaut.Encode.Class (class EncodeJson)
import Data.Generic.Rep (class Generic)
import Data.Show.Generic (genericShow)
import Prelude (class Eq, class Show, show, ($), (<>), (<<<))
import Screeps.Destructible (class Destructible)
import Screeps.FFI (instanceOf, unsafeField)
import Screeps.Id (class HasId, encodeJsonWithId, decodeJsonWithId, eqById)
import Screeps.RoomPosition.Type (RoomPosition)

foreign import data WorldMap :: Type

class Owned a -- my, owned

foreign import data Creep :: Type

instance creepIsRoomObject :: RoomObject Creep
instance creepIsOwned :: Owned Creep
instance creepEq :: Eq Creep where
  eq = eqById

instance showCreepEq :: Show Creep where
  show c = unsafeField "name" c <> "@" <> show (pos c)

instance creepHasId :: HasId Creep where
  validate = instanceOf "Creep"

instance encodeCreep :: EncodeJson Creep where
  encodeJson = encodeJsonWithId

instance decodeCreep :: DecodeJson Creep where
  decodeJson = lmap TypeMismatch <<< decodeJsonWithId

instance destructibleCreep :: Destructible Creep

newtype TerrainMask = TerrainMask Int

derive instance genericTerrainMask :: Generic TerrainMask _
derive newtype instance eqTerrainMask :: Eq TerrainMask
instance showTerrainMask :: Show TerrainMask where
  show = genericShow

newtype Terrain = Terrain String

derive instance genericTerrain :: Generic Terrain _
derive newtype instance eqTerrain :: Eq Terrain
instance showTerrain :: Show Terrain where
  show = genericShow

newtype Mode = Mode String

derive instance genericMode :: Generic Mode _
derive newtype instance eqMode :: Eq Mode
instance showMode :: Show Mode where
  show = genericShow

--------------------------------
-- Helper types and functions --
--------------------------------

type FilterFn a = a -> Boolean

data TargetPosition a
  = TargetPt Int Int
  | TargetObj a
  | -- RoomObject a
    TargetPos RoomPosition

