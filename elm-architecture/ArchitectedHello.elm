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
    }


model : Model
model =
    { text = "Hello world"
    , size = 1
    }


type Msg
    = AddText String
    | RemoveText
    | SizeUp
    | SizeDown
    | Input String


update : Msg -> Model -> Model
update msg model =
    case msg of
        AddText str ->
            { model | text = model.text ++ str }
        RemoveText ->
            { model | text = "" }
        SizeUp ->
            { model | size = model.size + 1 }
        SizeDown ->
              { model | size  = if model.size > 1 then model.size - 1 else 1 }
        Input str ->
            { model | text = str }


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
        , input [ onInput Input, value model.text ] []
        , button [ onClick (RemoveText) ] [ text "Remove text" ]
        , button [ onClick SizeUp ] [ text "+" ]
        , button [ onClick SizeDown ] [ text "-" ]
        ]
