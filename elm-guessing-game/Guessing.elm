module Guessing exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)


main =
    Html.beginnerProgram { model = model, view = view, update = update }


type alias Model =
    { displayText : String }


type Msg
    = Text String


model : Model
model =
    { displayText = "Guessing Game"
    }


view : Model -> Html Msg
view model =
    div [] [ text model.displayText ]


update : Msg -> { b | displayText : a } -> { b | displayText : String }
update msg model =
    case msg of
        Text str ->
            { model | displayText = str }
