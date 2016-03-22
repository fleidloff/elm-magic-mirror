module Elm.Actions where

import Elm.Model exposing (Model, Weather)
import Effects exposing (Effects)
import Debug

type Action 
  = NoOp 
  | Run (Effects Action)
  | UpdateTime Float
  | GetWeatherData (Maybe Weather)
  | GetFroodleData (Maybe String)
  | GetFroodleBirthdayData (Maybe String)


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
        newWeather = { weather | temp = w.temp, sunrise = w.sunrise, sunset = w.sunset, name = w.name }
      in
        ({ model | weather = newWeather }, Effects.none)
    GetFroodleData maybeString ->
      let
        d = Debug.log "froodle" maybeString
        froodle = model.froodle
        newFroodle = (Maybe.withDefault froodle maybeString)
      in
        ({ model | froodle = newFroodle }, Effects.none)
    GetFroodleBirthdayData maybeString ->
      let
        d = Debug.log "froodle birthdays" maybeString
        birthdays = model.birthdays
        newBirthdays = (Maybe.withDefault birthdays maybeString)
      in
        ({ model | birthdays = newBirthdays }, Effects.none)