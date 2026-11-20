{-# LANGUAGE OverloadedStrings #-}

module Web.Parfait.Html.Attribute
  ( Attribute
  , class_
  ) where

import Data.Text (Text)
import qualified Web.Parfait.Vdom as Vdom


type Attribute = Vdom.Attribute


class_ :: Text -> Attribute msg
class_ = Vdom.Attribute "class"
