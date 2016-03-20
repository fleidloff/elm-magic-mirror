module Elm.Model where

type alias Model = 
  { text: String
  , time: Float 
  , weather: 
    { temp: Float
    }
  }

model : Model
model = 
  { text = "Why u no model?"
  , time = 0.0
  , weather = 
    { temp = 279.15
    } 
  }