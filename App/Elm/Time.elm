module Elm.Time where

import Time exposing (..)
import Date exposing (hour, minute, second, fromTime, year, month, day)
import Debug
import Graphics.Element exposing (show, Element)
import Elm.Actions as Actions
import Html exposing (text, div, br)
import Html.Attributes exposing (class)


time model =
  div [ class "widget" ] <| htmlList model

htmlList model =
  case model.time of
    0.0 -> 
      [ text "" ]
    _ -> 
      [ div [] [ text <| currentDate model.time ]
      , div [] [ text <| currentTime model.time ]
      , br [] []
      , div [] [ text <| currentSalutation model.time ]
      ] 


timeInput = 
  Signal.map updateCurrentTime (Time.every Time.second)

updateCurrentTime t = Actions.UpdateTime <| t

type DayTime
  = Morning
  | Lunch
  | Afternoon
  | Evening
  | Night 

toDayTime h =
  if h <= 7 then Night else
  if h <= 11 then Morning else
  if h <= 14 then Lunch else 
  if h <= 18 then Afternoon else
  if h <= 22 then Evening 
  else Night
    

currentSalutation t =
  let 
    date' = fromTime t
    hour' = (Date.hour date')
    dt = toDayTime hour'
  in
    case dt of
      Morning -> "Guten Mittag"
      Lunch -> "Guten Mittag"
      Afternoon -> "Guten Nachmittag"
      Evening -> "Guten Abend"
      Night -> "Gute Nacht"

currentTime : Float -> String
currentTime t =
  let 
    date' = fromTime t
    hour' = toString <| Date.hour date'
    minute' = leadingZero <| Date.minute date'
    second' = leadingZero <| Date.second date'
    now = hour' ++ ":" ++ minute' ++ ":" ++ second' ++ " Uhr"
  in 
    now

currentDate : Float -> String
currentDate t =
  let 
    date' = fromTime t
    day' = toString (Date.day date')
    dayOfWeek = germanDayOfWeek <| Date.dayOfWeek date'
    month' = toString <| monthToNumber <| Date.month date'
    year' = leadingZero (Date.year date')
    now = dayOfWeek ++ ", " ++ day' ++ "." ++ month' ++ "." ++ year'
  in 
    now

germanDayOfWeek : Date.Day -> String
germanDayOfWeek dayOfWeek =
  case dayOfWeek of
    Date.Mon -> "Montag"
    Date.Tue -> "Dienstag"
    Date.Wed -> "Mittwoch"
    Date.Thu -> "Donnerstag"
    Date.Fri -> "Friday"
    Date.Sat -> "Samstag"
    Date.Sun -> "Sonntag"

monthToNumber month = 
  case month of
    Date.Jan -> 1 
    Date.Feb -> 2
    Date.Mar -> 3
    Date.Apr -> 4
    Date.May -> 5
    Date.Jun -> 6
    Date.Jul -> 7
    Date.Aug -> 8
    Date.Sep -> 9
    Date.Oct -> 10
    Date.Nov -> 11
    Date.Dec -> 12

leadingZero number = if number < 10 then "0" ++ toString number else toString number

