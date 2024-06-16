-- | Internal helper module for JavaScript FFI
module Screeps.FFI where

import Effect
import Prelude

import Effect.Exception.Unsafe (unsafeThrow)
import Control.Monad.Except (runExcept)
import Data.Array (catMaybes)
import Data.Either (either, fromRight)
import Data.Function.Uncurried (Fn3, runFn3)
import Data.Int (fromString)
import Data.Map (Map, fromFoldable, toUnfoldableUnordered)
import Data.Maybe (Maybe(Just, Nothing), isJust, fromJust, maybe)
import Data.Traversable (traverse)
import Data.Tuple (Tuple(..), fst, snd)
import Foreign (Foreign, unsafeFromForeign)
import Foreign.Index ((!))
import Foreign.Keys (keys)
import Partial.Unsafe (unsafePartial)

unsafeOptField :: forall obj val. String -> obj -> Maybe val
unsafeOptField = unsafeOptField_helper Nothing Just

foreign import unsafeIntField :: forall obj. String -> obj -> Int
foreign import unsafeField :: forall obj val. String -> obj -> val
foreign import unsafeOptField_helper :: forall obj val r. r -> (val -> r) -> String -> obj -> r
foreign import unsafeGetFieldEffect :: forall obj val. String -> obj -> Effect val
foreign import unsafeSetFieldEffect :: forall obj val. String -> obj -> val -> Effect Unit
foreign import unsafeDeleteFieldEffect :: forall obj. String -> obj -> Effect Unit
foreign import runThisEffectFn0 :: forall this a. String -> this -> Effect a
foreign import runThisEffectFn1 :: forall this a b. String -> this -> a -> Effect b
foreign import runThisEffectFn2 :: forall this a b c. String -> this -> a -> b -> Effect c
foreign import runThisEffectFn3 :: forall this a b c d. String -> this -> a -> b -> c -> Effect d
foreign import runThisEffectFn4 :: forall this a b c d e. String -> this -> a -> b -> c -> d -> Effect e
foreign import runThisEffectFn5 :: forall this a b c d e f. String -> this -> a -> b -> c -> d -> e -> Effect f
foreign import runThisEffectFn6 :: forall this a b c d e f g. String -> this -> a -> b -> c -> d -> e -> f -> Effect g
foreign import runThisFn0 :: forall this a. String -> this -> a
foreign import runThisFn1 :: forall this a b. String -> this -> a -> b
foreign import runThisFn2 :: forall this a b c. String -> this -> a -> b -> c
foreign import runThisFn3 :: forall this a b c d. String -> this -> a -> b -> c -> d
foreign import runThisFn4 :: forall this a b c d e. String -> this -> a -> b -> c -> d -> e
foreign import runThisFn5 :: forall this a b c d e f. String -> this -> a -> b -> c -> d -> e -> f
foreign import runThisFn6 :: forall this a b c d e f g. String -> this -> a -> b -> c -> d -> e -> f -> g

foreign import data NullOrUndefined :: Type -> Type
foreign import _null :: forall a. NullOrUndefined a
foreign import undefined :: forall a. NullOrUndefined a
foreign import notNullOrUndefined :: forall a. a -> NullOrUndefined a
foreign import isNull :: forall a. NullOrUndefined a -> Boolean
foreign import isUndefined :: forall a. NullOrUndefined a -> Boolean
foreign import toMaybeImpl :: forall a m. Fn3 (NullOrUndefined a) m (a -> m) m

toMaybe :: forall a. NullOrUndefined a -> Maybe a
toMaybe n = runFn3 toMaybeImpl n Nothing Just

toNullable :: forall a. Maybe a -> NullOrUndefined a
toNullable = maybe _null notNullOrUndefined

toUndefinable :: forall a. Maybe a -> NullOrUndefined a
toUndefinable = maybe undefined notNullOrUndefined

foreign import data JsObject :: Type
foreign import selectMaybesImpl :: forall a. (Maybe a -> Boolean) -> (Maybe a -> a) -> a -> JsObject

selectMaybes :: forall a. a -> JsObject
selectMaybes obj = unsafePartial $ selectMaybesImpl isJust fromJust obj

foreign import instanceOf :: forall a. String -> a -> Boolean

unsafeObjectToStrMap :: forall a. Foreign -> Map String a
unsafeObjectToStrMap object = either throwIfError identity $ runExcept do
  ks <- keys object
  kvs <- flip traverse ks \key -> Tuple <$> pure key <*> (unsafeFromForeign <$> object ! key)
  pure $ fromFoldable kvs
  where
    throwIfError err =
      unsafeThrow $ "unsafeObjectToStrMap: " <> show err

unsafeObjectToIntMap :: forall a. Foreign -> Map Int a
unsafeObjectToIntMap =
  fromFoldable <<< catMaybes <<< map (\(Tuple k v) -> Tuple <$> fromString k <*> pure v)
               <<< toUnfoldableUnordered <<< unsafeObjectToStrMap
