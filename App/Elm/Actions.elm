module Elm.Actions where

import Elm.Model exposing (Model)
import Effects exposing (Effects)

type Action 
  = NoOp 
  | UpdateString String 
  | UpdateReverse Bool 
  | UpdateTime Float


update : Action -> Model -> ( Model, Effects.Effects Action )
update action model =
  case action of
    NoOp ->
      ( model, Effects.none )
    UpdateString value ->
      ( { model | text = value }, Effects.none )
    UpdateReverse value ->
      ( { model | reverse = value }, Effects.none )
    UpdateTime value ->
      ( { model | time = value }, Effects.none )