module Screeps.Color where

import Prelude (class Eq, class Show)
import Data.Generic.Rep (class Generic)
import Data.Show.Generic (genericShow)

newtype Color = Color Int

derive instance Generic Color _
derive newtype instance eqColor :: Eq Color 
instance showColor :: Show Color where
  show = genericShow

foreign import color_red :: Color
foreign import color_purple :: Color
foreign import color_blue :: Color
foreign import color_cyan :: Color
foreign import color_green :: Color
foreign import color_yellow :: Color
foreign import color_orange :: Color
foreign import color_brown :: Color
foreign import color_grey :: Color
foreign import color_white :: Color

