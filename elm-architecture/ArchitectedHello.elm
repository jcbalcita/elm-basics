module ArchitectedHello exposing (..)

import Html exposing (..)
import Html.Attributes exposing (style, value)
import Html.Events exposing (onClick, onInput)


main : Program Never Model Msg
main =
    Html.beginnerProgram { model = model, view = view, update = update }


type alias Model =
    { text : String
    , size : Int
    , inputText : String
    }


model : Model
model =
    { text = "Hello world"
    , size = 1
    , inputText = ""
    }


type Msg
    = Text String
    | SizeUp
    | SizeDown
    | Input String


update : Msg -> Model -> Model
update msg model =
    case msg of
        Text str ->
            { model | text = model.text ++ str }
        SizeUp ->
            { model | size = model.size + 1 }
        SizeDown ->
            { model | size = model.size - 1 }
        Input str ->
            { model | inputText = str }


myStyle : Int -> Attribute msg
myStyle size =
    style
        [ ( "fontSize", toString size ++ "em" )
        , ( "color", "teal" )
        ]


view : Model -> Html Msg
view model =
    div []
        [ div [ myStyle model.size ] [ text model.text ]
        , input [ onInput Input ] []
        , button [ onClick (Text model.inputText) ] [ text "Add text to model" ]
        , button [ onClick SizeUp ] [ text "+" ]
        , button [ onClick SizeDown ] [ text "-" ]
        ]
