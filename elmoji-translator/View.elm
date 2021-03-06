module View exposing (..)

import Html
import Html.Attributes
import Html.Events
import Model exposing (defaultKey, switchTranslateMode, translateText)
import Update


mainComponent : Model.Model -> Html.Html Update.Msg
mainComponent model =
    Html.section
        [ Html.Attributes.class "container" ]
        [ Html.div
            [ Html.Attributes.class "input-field" ]
            [ Html.input
                [ Html.Attributes.type_ "text"
                , Html.Attributes.class "center"
                , Html.Attributes.placeholder "Let's Translate!"
                , Html.Events.onInput Update.SetCurrentText
                , Html.Attributes.value model.currentText
                ]
                []
            ]
        , Html.p
            [ Html.Attributes.class "center output-text emoji-size" ]
            [ Html.text (translateText defaultKey model) ]
        ]


directionLever : Model.Model -> Html.Html Update.Msg
directionLever model =
    Html.div
        [ Html.Attributes.class "switch center"
        , Html.Events.onClick (Update.ChangeDirection model.translateDirection)
        ]
        [ Html.label
            []
            [ Html.input
                [ Html.Attributes.type_ "checkbox" ]
                []
            , Html.span
                [ Html.Attributes.class "lever" ]
                []
            ]
        , Html.p
            []
            [ Html.text (toString model.translateDirection) ]
        ]


navBar : Html.Html Update.Msg
navBar =
    Html.nav
        []
        [ Html.div
            [ Html.Attributes.class "nav-wrapper light-blue lighten-2" ]
            [ Html.div
                [ Html.Attributes.class "brand-logo center" ]
                [ Html.text "Elmoji Translator" ]
            ]
        ]


cssLink : Html.Html Update.Msg
cssLink =
    Html.node "link"
        [ Html.Attributes.rel "stylesheet"
        , Html.Attributes.href "stylesheets/main.css"
        ]
        []


view : Model.Model -> Html.Html Update.Msg
view model =
    Html.div
        []
        [ cssLink
        , navBar
        , mainComponent model
        , directionLever model
        ]
