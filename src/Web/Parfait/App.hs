{-# LANGUAGE OverloadedStrings #-}

module Web.Parfait.App
  ( App
  , mkSimpleApp
  , mkApp
  , runApp
  ) where

import qualified Data.Text.Lazy.Builder as B
import Web.Parfait.Html.Element (Element)
import Web.Parfait.Html.Serialize
import Web.Scotty


data App arg model msg = App
  { initApp :: !(arg -> model)
  , updateApp :: !(msg -> model -> model)
  , viewApp :: !(model -> Element msg)
  }


mkSimpleApp :: model -> (msg -> model -> model) -> (model -> Element msg) -> App () model msg
mkSimpleApp init = App $ \_ -> init


mkApp :: (arg -> model) -> (msg -> model -> model) -> (model -> Element msg) -> App arg model msg
mkApp = App


runApp :: Int -> arg -> App arg model msg -> IO ()
runApp port arg app = do
  let docStr = B.toLazyText $ serializeDocument $ viewApp app $ initApp app arg
  scotty port
    $ get "/"
    $ html docStr
