module Elm.View where

import Html exposing (Html, text, div, fromElement)
import Graphics.Element exposing (image)
import Signal exposing (Address)
import Elm.Actions exposing (Action)
import Elm.Model exposing (Model)
import Elm.Elements exposing (gContainer, row, col, bottom)
import Elm.Time exposing (time)
import Elm.Weather exposing (weather)
import Elm.Froodle exposing (froodle)
import Elm.Birthdays exposing (birthdays)


view : Address Action -> Model -> Html
view address model =
    gContainer 
        [ row 
            [ col 6
                [ weather model ]
            , col 6 
                [ time model ]
            ]
        , bottom
            [ row
                [ col 6
                    [ birthdays model ]
                , col 6 
                    [ froodle model ]
                ]
            ]
        ]
    