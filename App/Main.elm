module Main where

import StartApp
import Elm.View exposing (view)
import Elm.Actions exposing (update)
import Elm.Actions as Actions
import Elm.Model exposing (model)
import Html exposing (Html)
import Task
import Effects exposing (Never, Effects)
import Elm.Time exposing (timeInput)
import Elm.Init exposing (init)
import Elm.Weather exposing (weatherInput)
import Elm.Froodle exposing (froodleInput)


app =
    StartApp.start { init = init, view = view, update = update, inputs = [ timeInput, weatherInput, froodleInput ] }

main =
    app.html

port tasks : Signal (Task.Task Never ())
port tasks =
    app.tasks
