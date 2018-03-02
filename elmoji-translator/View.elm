module View exposing (..)

import Update
import Model exposing (defaultKey, translateText, switchTranslateMode)
import Html
import Html.Events
import Html.Attributes


view : Model.Model -> Html.Html Update.Msg
view model =
    Html.div
        []
        [ Html.node "link"
            [ Html.Attributes.rel "stylesheet"
            , Html.Attributes.href "stylesheets/main.css"
            ]
            []
        , Html.nav
            []
            [ Html.div
                [ Html.Attributes.class "nav-wrapper light-blue lighten-2" ]
                [ Html.div
                    [ Html.Attributes.class "brand-logo center" ]
                    [ Html.text "Elmoji Translator" ]
                ]
            ]
        , Html.section
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
            , Html.div
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
                    [ Html.text (toString(model.translateDirection)) ]
                ]
        ]
