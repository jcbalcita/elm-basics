module Main exposing (..)

import Html exposing (Html, div, text, program)
import Html.Attributes exposing (style)
import Mouse exposing (moves, clicks)

main =
  program
  { init = init
  , view = view
  , update = update
  , subscriptions = subscriptions
  }


type alias Model =
  { x : Int
  , y : Int
  , color : String
  }


type Msg
  = MoveMessage Mouse.Position
  | ClickMessage Mouse.Position


init =
  ( Model 0 0 "red", Cmd.none)


update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    MoveMessage position ->
      ({model | x = position.x, y = position.y}, Cmd.none)

    ClickMessage _ ->
      ({model | color = changeColor model}, Cmd.none)


subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.batch
    [ Mouse.moves MoveMessage
    , Mouse.clicks ClickMessage
    ]


changeColor : Model -> String
changeColor { color } =
  case color of
    "blue" -> "red"
    "red" -> "blue"
    _ -> "red"


view : Model -> Html Msg
view model =
  div [ style [( "color", model.color )] ]
  [ text
      ((toString model.x) ++ " " ++ (toString model.y))
  ]
