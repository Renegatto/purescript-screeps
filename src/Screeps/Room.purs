-- | Corresponds to the Screeps API [Room](http://support.screeps.com/hc/en-us/articles/203079011-Room)
module Screeps.Room where

import Prelude
import Control.Monad.Eff                (Eff)
--import Data.Traversable                 (traverse)
import Data.Argonaut.Core               (Json, toArray)
--import Data.Argonaut.Decode.Class       (class DecodeJson, decodeJson)
--import Data.Argonaut.Decode.Combinators ((.??), (.?))
import Data.Either                      (Either(Left,Right))
import Data.Maybe                       (Maybe(..), maybe)

import Screeps.Color                    (Color)
import Screeps.Effects                  (CMD, TICK)
import Screeps.Types                    (FilterFn, Mode, TargetPosition(..), Terrain)
import Screeps.Controller               (Controller)
import Screeps.FindType                 (FindType, LookType, Path)
import Screeps.RoomPosition.Type        (RoomPosition, x, y)
import Screeps.RoomObject               (Room, class RoomObject)
import Screeps.Storage                  (Storage)
import Screeps.Structure                (StructureType)
import Screeps.Terminal                 (Terminal)
import Screeps.FFI (runThisEffFn1, runThisEffFn2, runThisEffFn3, runThisEffFn4, runThisEffFn5,
                    runThisFn1,    runThisFn2,    runThisFn3,    runThisFn6,
                    selectMaybes,  toMaybe,
                    unsafeField,   unsafeOptField)
import Screeps.ReturnCode (ReturnCode)

foreign import data RoomGlobal :: *
foreign import getRoomGlobal :: forall e. Eff (tick :: TICK | e) RoomGlobal

-- TODO: costCallback option
type PathOptions o =
  { ignoreCreeps :: Maybe Boolean
  , ignoreDestructibleStructures :: Maybe Boolean
  , ignoreRoads :: Maybe Boolean
  , ignore :: Maybe (Array RoomPosition)
  , avoid :: Maybe (Array RoomPosition)
  , maxOps :: Maybe Int
  , heuristicWeight :: Maybe Number
  , serialize :: Maybe Boolean
  , maxRooms :: Maybe Int
  | o }

pathOpts :: PathOptions ()
pathOpts =
  { ignoreCreeps: Nothing
  , ignoreDestructibleStructures: Nothing
  , ignoreRoads: Nothing
  , ignore: Nothing
  , avoid: Nothing
  , maxOps: Nothing
  , heuristicWeight: Nothing
  , serialize: Nothing
  , maxRooms: Nothing }

controller :: Room -> Maybe Controller
controller room = toMaybe $ unsafeField "controller" room

energyAvailable :: Room -> Int
energyAvailable = unsafeField "energyAvailable"

energyCapacityAvailable :: Room -> Int
energyCapacityAvailable = unsafeField "energyCapacityAvailable"

memory :: forall props. Room -> { | props }
memory = unsafeField "energyAvailable"

mode :: Room -> Mode
mode = unsafeField "mode"

name :: Room -> String
name = unsafeField "name"

storage :: Room -> Maybe Storage
storage room = toMaybe $ unsafeField "storage" room

terminal :: Room -> Maybe Terminal
terminal room = toMaybe $ unsafeField "terminal" room

serializePath :: RoomGlobal -> Path -> String
serializePath = runThisFn1 "serializePath"

deserializePath :: RoomGlobal -> String -> Path
deserializePath = runThisFn1 "deserializePath"

createConstructionSite :: forall a e. Room -> TargetPosition a -> StructureType -> Eff (cmd :: CMD | e) ReturnCode
createConstructionSite room (TargetPt x' y') strucType = runThisEffFn3 "createConstructionSite" room x' y' strucType
createConstructionSite room (TargetPos pos) strucType = runThisEffFn2 "createConstructionSite" room pos strucType
createConstructionSite room (TargetObj obj) strucType = runThisEffFn2 "createConstructionSite" room obj strucType

createFlag :: forall a e. Room -> TargetPosition a -> Eff (cmd :: CMD | e) ReturnCode
createFlag room (TargetPt x' y') = runThisEffFn2 "createFlag" room x' y'
createFlag room (TargetPos pos) = runThisEffFn1 "createFlag" room pos
createFlag room (TargetObj obj) = runThisEffFn1 "createFlag" room obj

createFlagWithName :: forall a e. Room -> TargetPosition a -> String -> Eff (cmd :: CMD | e) ReturnCode
createFlagWithName room (TargetPt x' y') name' = runThisEffFn3 "createFlag" room x' y' name'
createFlagWithName room (TargetPos pos) name' = runThisEffFn2 "createFlag" room pos name'
createFlagWithName room (TargetObj obj) name' = runThisEffFn2 "createFlag" room obj name'

createFlagWithColor :: forall a e. Room -> TargetPosition a -> String -> Color -> Eff (cmd :: CMD | e) ReturnCode
createFlagWithColor room (TargetPt x' y') name' color = runThisEffFn4 "createFlag" room x' y' name' color
createFlagWithColor room (TargetPos pos) name' color = runThisEffFn3 "createFlag" room pos name' color
createFlagWithColor room (TargetObj obj) name' color = runThisEffFn3 "createFlag" room obj name' color

createFlagWithColors :: forall a e. Room -> TargetPosition a -> String -> Color -> Color -> Eff (cmd :: CMD | e) ReturnCode
createFlagWithColors room (TargetPt x' y') name' color color2 =
  runThisEffFn5 "createFlag" room x' y' name' color color2
createFlagWithColors room (TargetPos pos) name' color color2 =
  runThisEffFn4 "createFlag" room pos name' color color2
createFlagWithColors room (TargetObj obj) name' color color2 =
  runThisEffFn4 "createFlag" room obj name' color color2

find :: forall a. Room -> FindType a -> Array a
find = runThisFn1 "find"

find' :: forall a. Room -> FindType a -> FilterFn a -> Array a
find' room findType filter = runThisFn2 "find" room findType { filter }

data RoomIdentifier = RoomName String | RoomObj Room

foreign import findExitToImpl :: forall a.
  Room ->
  a ->
  (ReturnCode -> Either ReturnCode (FindType RoomPosition)) ->
  (FindType RoomPosition -> Either ReturnCode (FindType RoomPosition)) ->
  Either ReturnCode (FindType RoomPosition)

findExitTo :: Room -> RoomIdentifier -> Either ReturnCode (FindType RoomPosition)
findExitTo room (RoomName otherRoomName) = findExitToImpl room otherRoomName Left Right
findExitTo room (RoomObj otherRoom) = findExitToImpl room otherRoom Left Right

findPath :: Room -> RoomPosition -> RoomPosition -> Path
findPath = runThisFn2 "findPath"

findPath' :: forall o. Room -> RoomPosition -> RoomPosition -> PathOptions o -> Path
findPath' room pos1 pos2 opts = runThisFn3 "findPath" room pos1 pos2 (selectMaybes opts)

getPositionAt :: Room -> Int -> Int -> RoomPosition
getPositionAt = runThisFn2 "getPositionAt"

-- lookAt omitted - use lookForAt
-- lookAtArea omitted - use lookForAtArea

data LookResult a = LookResult {
    resultType    :: LookType a
  , terrain       :: Maybe Terrain
  , structureType :: Maybe StructureType
  , x             :: Int
  , y             :: Int
  }

decodeLookResults :: forall a. Json
                  -> Either String
                           (Array (LookResult a))
decodeLookResults = maybe (Left      "Top object is not an array")
                          (Right <<< map decodeIt                )
                <<< toArray

decodeIt :: forall a. Json -> LookResult a
decodeIt o = LookResult { resultType, terrain, structureType, x, y }
  where
    resultType    = unsafeField    "type"          o
    terrain       = unsafeOptField "terrain"       o
    structureType = unsafeOptField "structureType" o
    x             = unsafeField    "x"             o
    y             = unsafeField    "y"             o

lookForAt :: forall                   a.
             Room
          -> LookType                 a
          -> TargetPosition           a
          -> Either String
                   (Array (LookResult a))
lookForAt room lookType (TargetPt  x' y') = decodeLookResults $ runThisFn3 "lookForAt" room lookType x' y'
lookForAt room lookType (TargetPos pos  ) = decodeLookResults $ runThisFn2 "lookForAt" room lookType pos
lookForAt room lookType (TargetObj obj  ) = decodeLookResults $ runThisFn2 "lookForAt" room lookType obj

-- TODO: Make it nicer, by selecting x/y from two positions.
lookForAtArea :: forall a. Room -> LookType a -> Int -> Int -> Int -> Int -> Either String (Array (LookResult a))
lookForAtArea r ty top left bot right = decodeLookResults
                                      $ debugIt "result"
                                      $ debugRunThisFn6 "lookForAt" r ty top left bot right true

foreign import debugIt :: forall a. String -> a -> a

foreign import debugRunThisFn6 :: forall this a b c d e f g. String -> this -> a -> b -> c -> d -> e -> f -> g

lookForInRange :: forall a. Room -> LookType a -> RoomPosition -> Int -> Either String (Array (LookResult a))
lookForInRange r ty p range = lookForAtArea r ty (debugIt "y min" (y p-range))
                                                 (debugIt "x min" (x p-range))
                                                 (debugIt "y max" (y p+range))
                                                 (debugIt "x max" (x p+range))
    
