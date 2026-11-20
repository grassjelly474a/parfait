{-# LANGUAGE OverloadedStrings #-}

module Web.Parfait.Html.Serialize
  ( serializeElement
  , serializeAttribute
  , serializeDocument
  ) where

import Data.Text (Text)
import Data.Text.Lazy.Builder (Builder)
import qualified Data.Text.Lazy.Builder as B
import Web.Parfait.Html.Attribute (Attribute)
import Web.Parfait.Html.Element (Element)
import qualified Web.Parfait.Vdom as Vdom


openingTag :: Text -> Builder
openingTag name =
  "<"
    <> B.fromText name
    <> ">"


openingTagWithAttrs :: Text -> [Attribute msg] -> Builder
openingTagWithAttrs name attrs =
  "<"
    <> B.fromText name
    <> " "
    <> (mconcat $ map serializeAttribute attrs)
    <> ">"


closingTag :: Text -> Builder
closingTag name =
  "</"
    <> B.fromText name
    <> ">"


serializeElement :: Element msg -> Builder
serializeElement (Vdom.Text t) = B.fromText t
serializeElement (Vdom.Node name [] children) =
  openingTag name
    <> (mconcat $ map serializeElement children)
    <> closingTag name
serializeElement (Vdom.Node name attrs children) =
  openingTagWithAttrs name attrs
    <> (mconcat $ map serializeElement children)
    <> closingTag name


serializeAttribute :: Attribute msg -> Builder
serializeAttribute (Vdom.Attribute k v) =
  B.fromText k
    <> "=\""
    <> B.fromText v
    <> "\""
serializeAttribute (Vdom.Property k) = B.fromText k


serializeDocument :: Element msg -> Builder
serializeDocument el =
  "<!DOCTYPE html><html><head></head><body>"
    <> serializeElement el
    <> "</body></html>"
