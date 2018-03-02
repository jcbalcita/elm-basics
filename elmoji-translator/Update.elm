module Update exposing (..)

import Model exposing (Model, Direction)


type Msg
    = SetCurrentText String
    | ChangeDirection Direction


update : Msg -> Model -> Model
update msg model =
    case msg of
        SetCurrentText newText ->
            { model | currentText = newText }

        ChangeDirection Model.TextToEmoji ->
            { model | translateDirection = Model.EmojiToText, currentText = "" }

        ChangeDirection Model.EmojiToText ->
            { model | translateDirection = Model.TextToEmoji, currentText = "" }
