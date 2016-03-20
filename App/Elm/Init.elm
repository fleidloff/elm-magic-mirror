module Elm.Init where

import Elm.Model exposing (model)
import Effects exposing (Effects)
import Elm.Time exposing (currentTime)
import Elm.Weather exposing (getWeather)

init = ( model, getWeather )