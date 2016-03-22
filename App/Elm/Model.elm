module Elm.Model where

type alias Model = 
  { time: Float 
  , weather: Weather
  , froodle: String
  , birthdays: String
  }

type alias 
  Weather =
    { temp: Float
    , sunset: Int
    , sunrise: Int 
    , name: String
    }

model : Model
model = 
  { time = 0.0
  , weather = 
    { temp = 0.0
    , sunrise = 0
    , sunset = 0
    , name = ""
    } 
  , froodle = ""
  , birthdays = ""
  }