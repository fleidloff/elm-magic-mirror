import Http
import Json.Decode as Json exposing ((:=))
import Task exposing (..)
import Html exposing (text)

main = 
  let 
  text "foo"

lookupZipCode : String -> Task Http.Error (List String)
lookupZipCode query =
    Http.get places ("http://api.zippopotam.us/us/" ++ query)


places : Json.Decoder (List String)
places =
  let place =
        Json.object2 (\city state -> city ++ ", " ++ state)
          ("place name" := Json.string)
          ("state" := Json.string)
  in
      "places" := Json.list place