module Elm.Model where

import Elm.Types exposing (Weather)

type alias Model = 
  { text: String
  , time: Float 
  , weather: Weather
  }

model : Model
model = 
  { text = "Why u no model?"
  , time = 0.0
  , weather = 
    { temp = 0.0
    } 
  }