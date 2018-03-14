module Main exposing (..)

import Html exposing (Html, div, text, program)
import Mouse
import Keyboard


type alias Model =
  Int


init : ( number, Cmd msg )
init =
  ( 0, Cmd.none )


type Msg
  = MouseMsg Mouse.Position
  | KeyMsg Keyboard.KeyCode


view : a -> Html msg
view model =
  div []
      [ text (toString model) ]


update : Msg -> number -> ( number, Cmd msg )
update msg model =
  case msg of
    MouseMsg position ->
      ( model + 1, Cmd.none )

    KeyMsg code ->
      ( model + 2, Cmd.none )


subscriptions : a -> Sub Msg
subscriptions model =
  Sub.batch
    [ Mouse.clicks MouseMsg
    , Keyboard.downs KeyMsg
    ]


main : Program Never number Msg
main =
  program
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }
