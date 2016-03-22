module Elm.Froodle where

import Elm.Elements exposing (widget)
import Json.Decode as Json exposing ((:=))
import Elm.Actions as Actions
import Elm.Tasks.Ajax as Ajax
import Time exposing (..)
import Html exposing (text)
import Markdown

froodle model =
  widget <| [ Markdown.toHtml model.froodle ]

froodleInput =
  Signal.map updateFroodle (Time.every (Time.minute * 10))

updateFroodle t =
  Actions.Run <| getFroodle

getFroodle =
  Ajax.get "https://fleidlof.alnilam.uberspace.de/nodejs/froodle/api/v1/Tasks/56f07d98b5dd41487146d4c2.md?shared=true" froodleData Actions.GetFroodleData

froodleData : Json.Decoder String
froodleData =
    (Json.at ["froodle"] Json.string)