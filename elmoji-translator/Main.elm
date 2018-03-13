module Main exposing (..)

import Html
import View
import Model exposing (Model)
import Update exposing (Msg)


main : Program Never Model Msg
main =
    Html.beginnerProgram
        { model = Model.init
        , view = View.view
        , update = Update.update
        }
