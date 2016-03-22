module Elm.Elements where 

import Html exposing (div, text, Html, input, label)
import Html.Attributes exposing (type', checked, value, class, style)


row = div [ class "row" ] 

bottom = div [ style [ ("position", "absolute"), ("bottom", "0"), ("width", "100%") ] ] 

col: number -> List Html -> Html
col number = 
  let className = "col col-xs-" ++ (toString number)
  in
    div [ class className ]

gContainer = div [ style [ ("width", "100%") ] ]

widget = div [ class "widget" ]