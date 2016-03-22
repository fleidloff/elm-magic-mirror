module Elm.Birthdays where

import Elm.Elements exposing (widget)
import Json.Decode as Json exposing ((:=))
import Elm.Actions as Actions
import Elm.Tasks.Ajax as Ajax
import Time exposing (..)
import Html exposing (div)
import Markdown
import Elm.Time exposing (currentMonth)

birthdays model =
  div [] [ Markdown.toHtml model.birthdays ]

birthdaysInput =
  Signal.map updateBirthdays (Time.every (Time.hour * 12))

updateBirthdays t =
  Actions.Run <| getBirthdays

getBirthdays =
  Ajax.getString getUrl Actions.GetFroodleBirthdayData

{-| use different files for different months
-}  
getUrl = 
  "http://fleidlof.alnilam.uberspace.de/nodejs/froodle/api/v1/Tasks/56d695a0605e4d52509df221.md?shared=true"