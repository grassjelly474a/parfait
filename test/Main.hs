{-# LANGUAGE OverloadedStrings #-}

module Main (main) where

import qualified Data.Text as T
import Web.Parfait.App
import Web.Parfait.Html.Attribute
import Web.Parfait.Html.Element


type Model = Int


init_ :: Model
init_ = 0


data Msg
  = Inc
  | Dec


update :: Msg -> Model -> Model
update msg model =
  case msg of
    Inc -> model + 1
    Dec -> model - 1


view :: Model -> Element Msg
view model =
  div_
    [class_ "parfait-test"]
    [ h1 [] [text "Parfait Test"]
    , h3 [] [text $ T.pack $ show model]
    , button [] [text "+"]
    , button [] [text "-"]
    ]


main :: IO ()
main = do
  let app = mkSimpleApp init_ update view
  runApp 8080 () app
