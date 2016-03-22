module Elm.Weather where

import Html exposing (text, div, br)
import Html.Attributes exposing (class)
import Elm.Tasks.Ajax as Ajax
import Elm.Actions as Actions
import Json.Decode as Json exposing ((:=))
import Elm.Model exposing (Weather)
import Time exposing (..)
import Effects exposing (Effects)
import Elm.Time exposing (currentTime)
import Elm.Elements exposing (widget)

weather model =
  widget <| htmlList model

htmlList model =
  case model.weather.temp of
    0.0 -> [ ]
    _ ->
      [ text "Temperatur: "
      , text <| toString <| kelvinToCelsius model.weather.temp
      , text " °C"
      , br [] []
      , text "Sonnenaufgang: "
      , text <| currentTime <| toFloat <| model.weather.sunrise * 1000
      , br [] []
      , text "Sonnenuntergang: "
      , text <| currentTime <| toFloat <| model.weather.sunset * 1000
      , br [] []
      , text <| model.weather.name 
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
  Json.object4 Weather
    (Json.at ["main", "temp"] Json.float)
    (Json.at ["sys", "sunset"] Json.int)
    (Json.at ["sys", "sunrise"] Json.int)
    (Json.at ["name"] Json.string)