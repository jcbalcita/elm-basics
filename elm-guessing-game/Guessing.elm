module Guessing exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick, onInput, onClick, onSubmit)


main : Program Never Model Msg
main =
    Html.beginnerProgram { model = model, view = view, update = update }


type alias Model =
    { word : String
    , guess : String
    , isCorrect : Bool
    }


type Msg
    = Answer
    | Change String


model : Model
model =
    Model "Saturday" "" False


view : Model -> Html Msg
view model =
    div [] [
        h2 [] [ text (clueOrReveal model) ]
      , Html.form [ onSubmit (Answer) ] [
            input [ placeholder "Write your guess here", value model.guess, onInput Change ] []
        ]
    ]


update : Msg -> Model -> Model
update msg model =
    case msg of
        Answer ->
            { model | isCorrect = (checkIfCorrect model) }
        Change str ->
            { model | guess = str }


checkIfCorrect : Model -> Bool
checkIfCorrect model =
    model.guess == model.word

clueOrReveal : Model -> String
clueOrReveal model =
    if model.isCorrect then
        "You guessed right! The answer is " ++ model.word
    else
        "I'm thinking of a word that begins with " ++ String.slice 0 1 model.word
