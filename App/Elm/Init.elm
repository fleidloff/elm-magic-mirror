module Elm.Init where

import Elm.Model exposing (model)
import Effects exposing (Effects)
import Elm.Time exposing (currentTime)

init = ( model, Effects.none )