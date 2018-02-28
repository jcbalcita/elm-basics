module AnotherHello exposing (..)

import Html exposing (..)

checkStatus : Int -> String
checkStatus status =
  if status == 200 then
    "200!"
  else if status == 404 then
    "Page not found"
  else
    "Unknown response"

statusChecks : List String
statusChecks =
  [   checkStatus 200
    , checkStatus 404
    , checkStatus 418
   ]

renderList : List String -> Html.Html msg
renderList list =
  ul []
  (List.map (\l -> li [] [ text l ]) list)

main : Html.Html msg
main =
  div [] [
    h1 [] [ text "List of statuses!" ]
    , renderList statusChecks
  ]