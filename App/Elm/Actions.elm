module Elm.Actions where

import Elm.Model exposing (Model)
import Effects exposing (Effects)
import Elm.Types exposing (Weather)
import Debug

type Action 
  = NoOp 
  | Run (Effects Action)
  | UpdateTime Float
  | GetWeatherData (Maybe Weather)


update : Action -> Model -> ( Model, Effects.Effects Action )
update action model =
  case action of
    NoOp ->
      ( model, Effects.none )
    Run e ->
      ( model, e )
    UpdateTime value ->
      ( { model | time = value }, Effects.none )
    GetWeatherData maybeWeather ->
      let
        d = Debug.log "weather" maybeWeather
        weather = model.weather
        w = (Maybe.withDefault weather maybeWeather)
        newWeather = { weather | temp = w.temp, sunrise = w.sunrise, sunset = w.sunset }
      in
        ({ model | weather = newWeather }, Effects.none)