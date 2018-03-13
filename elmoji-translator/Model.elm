module Model exposing (..)

import EmojiConverter exposing (textToEmoji, emojiToText)


type alias Model =
    { currentText : String
    , translateDirection: Direction
    }


type Direction
    = TextToEmoji
    | EmojiToText

type Cat
    = Dagwood
    | Sully

init : Model
init =
    { currentText = ""
    , translateDirection = TextToEmoji
    }


translateText : String -> Model -> String
translateText key { currentText, translateDirection } =
    case translateDirection of
        EmojiToText ->
            emojiToText key currentText

        TextToEmoji ->
            textToEmoji key currentText


switchTranslateMode : Model -> Cat -> String
switchTranslateMode model cat =
    case model.translateDirection of
        EmojiToText ->
            "textToEmoji"

        TextToEmoji ->
            "emojiToText"


defaultKey : String
defaultKey =
    "😅"
