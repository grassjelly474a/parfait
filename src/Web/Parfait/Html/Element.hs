{-# LANGUAGE OverloadedStrings #-}

module Web.Parfait.Html.Element
  ( Element
  , text
  , div_
  , h1
  , h2
  , h3
  , h4
  , p
  , a
  , button
  ) where

import Data.Text (Text)
import Web.Parfait.Html.Attribute
import qualified Web.Parfait.Vdom as Vdom


type Element = Vdom.Element


text :: Text -> Element msg
text = Vdom.Text


div_ :: [Attribute msg] -> [Element msg] -> Element msg
div_ = Vdom.Node "div"


h1 :: [Attribute msg] -> [Element msg] -> Element msg
h1 = Vdom.Node "h1"


h2 :: [Attribute msg] -> [Element msg] -> Element msg
h2 = Vdom.Node "h2"


h3 :: [Attribute msg] -> [Element msg] -> Element msg
h3 = Vdom.Node "h3"


h4 :: [Attribute msg] -> [Element msg] -> Element msg
h4 = Vdom.Node "h4"


p :: [Attribute msg] -> [Element msg] -> Element msg
p = Vdom.Node "p"


a :: [Attribute msg] -> [Element msg] -> Element msg
a = Vdom.Node "a"


button :: [Attribute msg] -> [Element msg] -> Element msg
button = Vdom.Node "button"
