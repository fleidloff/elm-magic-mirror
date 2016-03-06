module Elm.View where

import Html exposing (Html, text, div, fromElement)
import Graphics.Element exposing (image)
import Signal exposing (Address)
import Elm.Actions exposing (Action)
import Elm.Model exposing (Model)
import Elm.Elements exposing (gContainer, row, col, bottom)
import Elm.Time exposing (time)

view : Address Action -> Model -> Html
view address model =
      div [] 
        [ gContainer 
            [ row 
                [ col 6
                    [ text "weather" 
                    ]
                , col 6 
                    [ time model ]
                ]
            , bottom
                [ row
                    [ col 6
                        [ text "http://api.openweathermap.org/data/2.5/weather?id=2848756&appid=1465be17ba0ad9f9f2801b5bcbb79e0f"
                        , text "http://openweathermap.org/weather-conditions"
                        , text "Countdown Timer, Weather, Todos, free text, football scores, news, spotify player playing info, shopping list" 
                        ]
                    , col 6 
                        [ text "..." ]
                    ]
                ]
            ]
        ]
    