module Elm.Model where

type alias Model = 
  { text: String
  , reverse: Bool
  , time: Float 
  }

model : Model
model = 
  { text = "Why u no model?"
  , reverse = True
  , time = 0.0
  }