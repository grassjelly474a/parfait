module Web.Parfait.Vdom
  ( Element (..)
  , Attribute (..)
  ) where

import Data.Text (Text)


data Element msg
  = Text !Text
  | Node !Text ![Attribute msg] ![Element msg]


data Attribute msg
  = Attribute !Text !Text
  | Property !Text
