module Elm.Actions where

import Elm.Model exposing (Model)
import Effects exposing (Effects)

type Action 
  = NoOp 
  | UpdateTime Float


update : Action -> Model -> ( Model, Effects.Effects Action )
update action model =
  case action of
    NoOp ->
      ( model, Effects.none )
    UpdateTime value ->
      ( { model | time = value }, Effects.none )