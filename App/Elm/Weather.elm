module Elm.Weather where

import Html exposing (text, div)
import Html.Attributes exposing (class)

weather model =
  div [ class "widget" ] <| htmlList model

htmlList model =
  [ div [] 
    [ text "temperature: "
    , text <| toString <| kelvinToCelsius model.weather.temp
    , text " °C"
    ]
  ]

kelvinToCelsius t =
  round <| t - 273.15