module HelloDom exposing (..)

import Html exposing (text, div, h1, p)
import Html.Attributes exposing (class)

main : Html.Html msg
main =
  div [ class "elm-div" ] [
    h1 [ class "banner" ] [ text "This is a DOM element generated by Elm" ]
      , p [] [ text "A paragraph element" ]
      , p [] [ text "The second paragraph element" ]
  ]