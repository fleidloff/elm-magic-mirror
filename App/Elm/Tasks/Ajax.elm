module Elm.Tasks.Ajax where

import Effects exposing (..)
import Http
import Task

get url decoder action =
  Http.get decoder url
    |> Task.toMaybe
    |> Task.map action
    |> Effects.task

getString url action = 
  Http.getString url 
    |> Task.toMaybe
    |> Task.map action
    |> Effects.task