module Elm.Init where

import Elm.Model exposing (model)
import Effects exposing (Effects)
import Elm.Time exposing (currentTime)
import Elm.Weather exposing (getWeather)
import Elm.Froodle exposing (getFroodle)
import Elm.Birthdays exposing (getBirthdays)
import Elm.Time exposing (getCurrentTime)

init = ( model, Effects.batch [getWeather, getFroodle, getBirthdays, getCurrentTime] )