module Elm.Weather where

import Html exposing (text, div)
import Html.Attributes exposing (class)
import Elm.Tasks.Ajax as Ajax
import Elm.Actions as Actions
import Json.Decode as Json exposing ((:=))
import Elm.Types exposing (Weather)
import Time exposing (..)
import Effects exposing (Effects)

weather model =
  div [ class "widget" ] <| htmlList model

htmlList model =
  case model.weather.temp of
    0.0 -> [ div [] [] ]
    _ ->
      [ div [] 
        [ text "Temperatur: "
        , text <| toString <| kelvinToCelsius model.weather.temp
        , text " °C"
        ]
      ]

kelvinToCelsius t =
  round <| t - 273.15

weatherInput =
  Signal.map updateWeather (Time.every Time.hour)

updateWeather t =
  Actions.Run <| getWeather

getWeather : Effects Actions.Action
getWeather =
  Ajax.get "http://api.openweathermap.org/data/2.5/weather?id=2848756&appid=1465be17ba0ad9f9f2801b5bcbb79e0f" weatherData Actions.GetWeatherData

weatherData : Json.Decoder Weather
weatherData =
  Json.at ["main"] <|
    Json.object1 Weather
      ("temp" := Json.float)