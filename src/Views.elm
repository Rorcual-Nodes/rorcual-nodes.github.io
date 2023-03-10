module Views exposing (..)

import Data exposing (..)
import Dict
import Html exposing (Html, a, article, button, div, h1, h2, h3, h4, img, input, p, pre, section, small, span, table, tbody, td, text, th, thead, tr)
import Html.Attributes exposing (alt, class, href, id, src, target, value)
import Html.Events exposing (onClick, onInput)
import List exposing (any)
import Set
import Types exposing (..)
import Url exposing (Protocol(..))


bodyView : Model -> List (Html Msg)
bodyView model =
    [ div [ id "root" ]
        [ div [ class "kujira blue screen-footer" ]
            [ div [ class "header" ]
                [ img [ src "assets/logo/rorcual.png", alt "Rorcual", class "logo" ] []
                , img [ src "assets/logo/rorcual.png", alt "Rorcual", class "logo--mobile" ] []
                , div [ class "header__buttons" ]
                    [ div [ class "wallet text-right" ]
                        [ a [ href "https://blue.kujira.app/stake/kujiravaloper1453e4qfcmhwyqrs2sgqmlgckzvmsgdvzzq4zdd", target "_blank", Html.Attributes.style "text-decoration" "inherit" ]
                            [ button [ class "md-button md-button--grey md-button--nowrap" ]
                                [ img [ src "assets/icons/stake.svg" ] []
                                , span [] [ text "Stake with Us" ]
                                ]
                            ]
                        ]
                    ]
                ]
            , div []
                [ div [ class "row px-1 mx-0 py-6" ]
                    [ div [ class "col-12 col-md-4 col-lg-3 col-xl-2" ]
                        [ div [ class "menutabs" ]
                            (menutabs model)
                        ]
                    , case model.currentRoute of
                        Home ->
                            dashboardView model

                        Ecosystem ->
                            ecosystemView model

                        SmartContracts ->
                            smartContractsView model

                        AboutUs ->
                            aboutView model

                        SubEcosystem subProject ->
                            subEcosystemsView model subProject

                        SubContracts subContract ->
                            subContractsView model subContract

                        NotFound ->
                            div [] [ text "Error 404 Not Found" ]
                    ]
                ]
            , if model.popUp == True then
                div [ class "notification" ]
                    [ div [ class "notification-visible", Html.Attributes.style "visibility" "visible" ]
                        (case model.notification of
                            Success message ->
                                [ div [ class "notification-wrapper" ] [ img [ src "./assets/icons/checkmark.svg" ] [] ], text message ]

                            Error error ->
                                [ div [ class "notification-wrapper" ] [ img [ src "./assets/icons/xmark.svg" ] [] ], text error ]

                            Warning warning ->
                                [ div [ class "notification-wrapper" ] [ img [ src "./assets/icons/alert.svg" ] [] ], text warning ]
                        )
                    ]

              else
                div [ class "notification" ]
                    [ div [ class "notification-visible", Html.Attributes.style "visibility" "hidden" ] []
                    ]
            ]
        , div [ class "footer" ]
            [ div [ class "tips" ]
                [ h2 []
                    [ div [ class "raw" ]
                        [ pre [ Html.Attributes.style "border-radius" "10rem" ]
                            [ text "Tips: "
                            , text "kujira1n86sr2nt4wxp5malpfrjmvw76u5vt43r5w5ac2"
                            , span [ class "copy-button", onClick (Copy "kujira1n86sr2nt4wxp5malpfrjmvw76u5vt43r5w5ac2") ]
                                [ img [ src "assets/icons/copy.svg" ] [] ]
                            ]
                        ]
                    ]
                ]
            , div [ class "footer__social" ]
                [ a
                    [ class "social"
                    , href
                        "https://twitter.com/Rorcual_nodes"
                    , target "_blank"
                    , Html.Attributes.style "text-decoration" "none"
                    , Html.Attributes.style "color" "#fff"
                    ]
                    [ img
                        [ src "assets/socials/twitter.svg"
                        ]
                        []
                    ]
                , a
                    [ class "social"
                    , href
                        "https://github.com/Rorcual-Nodes"
                    , target "_blank"
                    , Html.Attributes.style "text-decoration" "none"
                    , Html.Attributes.style "color" "#fff"
                    ]
                    [ img
                        [ src "assets/socials/github.svg"
                        ]
                        []
                    ]
                ]
            ]
        ]
    ]



-- VIEWS


dashboardView : Model -> Html Msg
dashboardView model =
    let
        viewContracts =
            Set.size (Set.fromList (List.map (\project -> project.info.team) model.projects))
    in
    div [ class "col-12 col-md-8 col-lg-9 col-xl-8 dashboard mt-4 mt-md-3" ]
        [ h1 [ class "text-center text-md-left" ] [ text "Dashboard" ]
        , h2 [ class "mb-2" ] [ text "Welcome to Kujira's contract directory." ]
        , div [ class "row" ]
            [ div [ class "col-12 col-lg-4 col-fhd-4 mt-3" ]
                [ div [ class "box" ]
                    [ div [ class "md-row h-full wrap", Html.Attributes.style "align-content" "center" ]
                        [ div [ class "col-6" ]
                            [ div [ class "md-flex dir-c ai-c jc-c py-2" ]
                                [ h3 [] [ text "Projects" ]
                                , div [ class "token mt-q1 arrow" ]
                                    [ span [] [ text (String.fromInt (List.length model.projects)) ]
                                    , small [] [ text "projects." ]
                                    ]
                                ]
                            ]
                        , div [ class "col-6" ]
                            [ div [ class "md-flex dir-c ai-c jc-c bl py-2" ]
                                [ h3 [] [ text "Contracts" ]
                                , div [ class "token mt-q1 arrow" ]
                                    [ span [] [ text (String.fromInt (List.length (List.concatMap (\project -> project.contracts) model.projects))) ]
                                    , small [] [ text "contracts." ]
                                    ]
                                ]
                            ]
                        , div [ class "col-6" ]
                            [ div [ class "md-flex dir-c ai-c jc-c bt py-2" ]
                                [ h3 [] [ text "Teams" ]
                                , div [ class "token mt-q1 arrow" ]
                                    [ span [] [ text (String.fromInt viewContracts) ]
                                    , small [] [ text "teams" ]
                                    ]
                                ]
                            ]
                        , div [ class "col-6" ]
                            [ div [ class "md-flex dir-c ai-c jc-c bt bl py-2" ]
                                [ h3 [] [ text "Random Facts" ]
                                , div [ class "token mt-q1 arrow" ]
                                    [ span [] [ text (String.fromInt (List.length model.projects)) ]
                                    , small [] [ text "facts." ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ]
            , div [ class "col-12 col-lg-4 col-fhd-4 flex" ]
                [ section [ class "ValidatorBox box flex dir-c ai-s mt-3" ]
                    [ h3 []
                        [ text "Oracle Exchange Rates"
                        , a
                            [ class "social"
                            , href
                                "https://orca.kujira.app"
                            , target "_blank"
                            , Html.Attributes.style "text-decoration" "none"
                            , Html.Attributes.style "color" "#fff"
                            , Html.Attributes.style "margin-left" "0.5rem"
                            ]
                            [ img
                                [ src "assets/protocols/orca.svg"
                                , Html.Attributes.style "width" "18px"
                                ]
                                []
                            ]
                        ]
                    , div [ class "w-full" ]
                        [ div [ class "row" ]
                            [ div [ class "col-12" ]
                                [ table [ class "md-table revenue-table condensed" ]
                                    [ thead []
                                        [ th [] [ text "Denom" ]
                                        , th [] [ text "Rate" ]
                                        ]
                                    , tbody []
                                        (List.map
                                            (\rate ->
                                                tr []
                                                    [ td [ class "denom-c" ] [ text rate.denom ]
                                                    , td [ class "amount-c" ] [ text (floatToDisplay rate.rate) ]
                                                    ]
                                            )
                                            model.exchangeRates
                                        )
                                    ]
                                ]
                            ]
                        ]
                    ]
                ]
            , div [ class "col-12 col-lg-12 col-fhd-4 mt-3" ] (latestProjects model)
            , a
                [ href "https://forms.gle/vy5TRZUeHoK5ejqq5"
                , target "_blank"
                , Html.Attributes.style "text-decoration" "none"
                ]
                [ button [ class "md-button md-button--small md-button--reverse md-button--icon-right ml-2" ]
                    [ text "Submit a Project" ]
                ]
            ]
        ]


latestProjects : Model -> List (Html Msg)
latestProjects model =
    let
        latest =
            List.take 3 <| List.reverse (List.sortBy (\project -> project.info.createDate) model.projects)
    in
    [ h1 [ class "text-center text-md-left mb-2" ] [ text "Latest Projects" ]
    , div [ class "row" ]
        (List.map
            projectView
            latest
        )
    ]


ecosystemView : Model -> Html Msg
ecosystemView model =
    let
        sortedProjects =
            List.sortBy (\project -> project.info.name) model.projects

        filteredProjects =
            filterCategory model.searchTerm
                (case model.selectedCategory of
                    All ->
                        "All"

                    Selected category ->
                        categoryToString category
                )
                sortedProjects
    in
    div [ class "col-12 col-md-8 col-lg-9 col-xl-8 mt-4 mt-md-3" ]
        [ h1 [ class "mb-0" ] [ text "Projects" ]
        , h2 [ class "mb-2" ] [ text "Explore the ecosystem of Kujira." ]
        , div [ class "md-row mb-3 pad" ]
            [ div [ class "col-12" ]
                [ div [ class "md-flex" ]
                    [ div [ class "md-input md-input--nolabel condensed grow mr-1 md-input--light validator-search" ]
                        [ input [ class "search", Html.Attributes.placeholder "Search", value model.searchTerm, onInput Search ] []
                        , button []
                            [ img [ src "assets/icons/search.svg" ] []
                            ]
                        ]
                    , dropdownCatSelector model
                    , p [ class "my-a ml-2 condensed" ] [ text (String.fromInt (List.length filteredProjects) ++ " Projects found.") ]
                    ]
                ]
            ]
        , div [ class "row" ]
            (List.map
                projectView
                filteredProjects
            )
        , a [ class "scroll-to-top-button", onClick ScrollToTop, href "#" ] [ img [ src "assets/icons/chevron-up.svg" ] [] ]
        ]


subEcosystemsView : Model -> String -> Html Msg
subEcosystemsView model projectName =
    let
        project =
            model.projects
                |> List.filterMap
                    (\p ->
                        if String.toLower p.info.name == String.toLower (String.replace "-" " " projectName) then
                            Just p

                        else
                            Nothing
                    )
                |> List.head
                |> Maybe.withDefault { info = zeroInfo, contracts = [] }
    in
    div [ class "col-12 col-md-8 col-lg-9 col-xga-8 mt-4 mt-md-3 govern" ]
        [ a [ class "proposal__back mb-2 ml-2", href "#", onClick Back ] [ img [ src "./assets/icons/arrow-left.svg" ] [], text "Back to all Projects" ]
        , div [ class "row" ]
            -- FirstDiv
            [ div [ class "col-12 col-xl-9" ]
                [ section [ class "ValidatorBox box mb-4" ]
                    [ article [ class "ValidatorLabelValueItem" ]
                        [ div []
                            [ div [ class "flex ai-c condensed" ]
                                [ div []
                                    [ h1 [] [ text project.info.name ]
                                    , a
                                        [ href
                                            (case project.info.website of
                                                Just url ->
                                                    Url.toString url

                                                Nothing ->
                                                    "#"
                                            )
                                        , target "_blank"
                                        , Html.Attributes.style "text-decoration" "none"
                                        , Html.Attributes.style "color" "#fff"
                                        ]
                                        [ h2
                                            [ class "condensed"
                                            ]
                                            [ text
                                                (case project.info.website of
                                                    Just url ->
                                                        Url.toString url

                                                    Nothing ->
                                                        "N/A"
                                                )
                                            ]
                                        ]
                                    ]
                                , div [ class "avatar-wrapper" ]
                                    [ img [ src ("./assets/protocols/" ++ project.info.logo), alt "Icon", class "avatar" ] [] ]
                                ]
                            , div [ class "ValidatorBox__social flex mb-2" ]
                                [ case project.info.twitter of
                                    Just url ->
                                        a
                                            [ class "social"
                                            , href
                                                (Url.toString url)
                                            , target "_blank"
                                            , Html.Attributes.style "text-decoration" "none"
                                            , Html.Attributes.style "color" "#fff"
                                            ]
                                            [ img
                                                [ src "./assets/socials/twitter.svg"
                                                ]
                                                []
                                            ]

                                    Nothing ->
                                        div [] []
                                , case project.info.discord of
                                    Just url ->
                                        a
                                            [ class "social"
                                            , href
                                                (Url.toString url)
                                            , target "_blank"
                                            , Html.Attributes.style "text-decoration" "none"
                                            , Html.Attributes.style "color" "#fff"
                                            ]
                                            [ img
                                                [ src "./assets/socials/discord.svg"
                                                ]
                                                []
                                            ]

                                    Nothing ->
                                        div [] []
                                , case project.info.telegram of
                                    Just url ->
                                        a
                                            [ class "social"
                                            , href
                                                (Url.toString url)
                                            , target "_blank"
                                            , Html.Attributes.style "text-decoration" "none"
                                            , Html.Attributes.style "color" "#fff"
                                            ]
                                            [ img
                                                [ src "./assets/socials/telegram.svg"
                                                ]
                                                []
                                            ]

                                    Nothing ->
                                        div [] []
                                , case project.info.github of
                                    Just url ->
                                        a
                                            [ class "social"
                                            , href
                                                (Url.toString url)
                                            , target "_blank"
                                            , Html.Attributes.style "text-decoration" "none"
                                            , Html.Attributes.style "color" "#fff"
                                            ]
                                            [ img
                                                [ src "./assets/socials/github.svg"
                                                ]
                                                []
                                            ]

                                    Nothing ->
                                        div [] []
                                ]
                            , h4 [ class "condensed mt-1" ] [ text "Team" ]
                            , p [] [ span [ class "value" ] [ text project.info.team ] ]
                            , h4 [ class "condensed mt-1" ] [ text "Description" ]
                            , p [] [ span [] [ text project.info.description ] ]
                            , h4 [ class "condensed mt-1" ] [ text "Contracts" ]
                            , p [] [ span [ class "value" ] [ text (String.fromInt (List.length project.contracts)) ] ]
                            , div [ class "flex ai-c mt-2 condensed" ]
                                [ p []
                                    [ span [ class "tag tag--teal pointer" ]
                                        [ text (categoryToString project.info.category)
                                        ]
                                    ]
                                , p [ class "tag--right" ]
                                    (List.map
                                        (\tag ->
                                            span [ class "tag tag--grey pointer" ] [ text tag ]
                                        )
                                        (List.map (\tags -> tagToString tags) project.info.tags)
                                    )
                                ]
                            ]
                        ]
                    ]
                ]

            --Second Div
            , case project.contracts of
                [] ->
                    div [] []

                _ ->
                    div [ class "col-12 col-xl-9" ]
                        [ section [ class "ValidatorBox box mb-4" ]
                            [ article [ class "ValidatorLabelValueItem" ]
                                [ div [ Html.Attributes.style "max-height" "300px", Html.Attributes.style "overflow-y" "auto" ]
                                    [ table [ class "md-table condensed" ]
                                        [ Html.colgroup []
                                            [ Html.col [ Html.Attributes.style "width" "5%" ] []
                                            , Html.col [ Html.Attributes.style "width" "25%" ] []
                                            , Html.col [ Html.Attributes.style "width" "70%" ] []
                                            ]
                                        , thead []
                                            [ tr []
                                                [ th [] [ text "Code_id" ]
                                                , th [] [ text "Label" ]
                                                , th [] [ text "Address" ]
                                                ]
                                            ]
                                        , tbody []
                                            (List.map
                                                (\contract ->
                                                    tr []
                                                        [ td [] [ text (String.fromInt contract.code_id) ]
                                                        , td []
                                                            [ a
                                                                [ href "#"
                                                                , Html.Attributes.style "text-decoration" "none"
                                                                , Html.Attributes.style "color" "#fff"
                                                                , onClick (Current (SubContracts contract.address))
                                                                ]
                                                                [ text contract.label ]
                                                            ]
                                                        , td []
                                                            [ a
                                                                [ href ("https://finder.kujira.app/kaiyo-1/contract/" ++ contract.address)
                                                                , target "_blank"
                                                                , Html.Attributes.style "text-decoration" "none"
                                                                , Html.Attributes.style "color" "#fff"
                                                                ]
                                                                [ text contract.address ]
                                                            ]
                                                        ]
                                                )
                                                project.contracts
                                            )
                                        ]
                                    ]
                                ]
                            ]
                        ]
            ]
        ]


smartContractsView : Model -> Html Msg
smartContractsView model =
    let
        sortedContracts =
            List.sortBy (\contract -> contract.code_id) (List.concatMap (\project -> project.contracts) model.projects)

        filteredContracts =
            filterTeam model model.searchTerm model.selectedTeam sortedContracts
    in
    div [ class "col-12 col-md-8 col-lg-9 col-xl-8 mt-4 mt-md-3" ]
        [ h1 [ class "mb-0" ] [ text "Contracts" ]
        , h2 [ class "mb-2" ] [ text "Select one of the teams in the scroll down menu." ]
        , div [ class "md-row mb-3 pad" ]
            [ div [ class "col-12" ]
                [ div [ class "md-flex" ]
                    [ div [ class "md-input md-input--nolabel condensed grow mr-1 md-input--light validator-search" ]
                        [ input [ class "search", Html.Attributes.placeholder "Search", value model.searchTerm, onInput Search ] []
                        , button []
                            [ img [ src "assets/icons/search.svg" ] []
                            ]
                        ]
                    , dropdownTeamSelector model sortedContracts
                    , p [ class "my-a ml-2 condensed" ] [ text (String.fromInt (List.length filteredContracts) ++ " Protocols found.") ]
                    ]
                ]
            ]
        , div [ class "row" ]
            (List.map
                (contractView
                    model
                )
                filteredContracts
            )
        , a [ class "scroll-to-top-button", onClick ScrollToTop, href "#" ] [ img [ src "assets/icons/chevron-up.svg" ] [] ]
        ]


subContractsView : Model -> String -> Html Msg
subContractsView model contract =
    let
        selectedProject =
            List.filter (\p -> p.contracts /= []) model.projects

        selectedContract =
            List.concatMap (\p -> List.filter (\c -> c.address == contract) p.contracts) selectedProject

        currentContract =
            Maybe.withDefault
                { address = ""
                , code_id = 0
                , creator = ""
                , admin = ""
                , label = ""
                }
                (List.head selectedContract)

        currentProject =
            Maybe.withDefault
                { info =
                    { id = 0
                    , createDate = ""
                    , name = ""
                    , team = ""
                    , website = Nothing
                    , twitter = Nothing
                    , discord = Nothing
                    , telegram = Nothing
                    , github = Nothing
                    , category = Defi
                    , tags = [ None ]
                    , description = ""
                    , logo = ""
                    , ids = []
                    }
                , contracts = []
                }
                (List.head <| List.filter (\p -> List.member currentContract.code_id p.info.ids) model.projects)
    in
    div [ class "col-12 col-md-8 col-lg-9 col-xga-8 mt-4 mt-md-3 govern" ]
        [ a [ class "proposal__back mb-2 ml-2", href "/contracts", onClick Back ] [ img [ src "./assets/icons/arrow-left.svg" ] [], text "Back to Contracts" ]
        , div [ class "row" ]
            [ div [ class "col-12 col-lg-6 col-fhd-4 flex" ]
                [ section [ class "ValidatorBox box mb-4" ]
                    [ article [ class "ValidatorLabelValueItem" ]
                        [ div []
                            [ div [ class "flex ai-c condensed" ]
                                [ div []
                                    [ h1 [] [ text currentContract.label ]
                                    , h2 [ class "condensed" ] [ span [ class "value" ] [ a [ href ("https://finder.kujira.app/kaiyo-1/contract/" ++ currentContract.address), target "_blank", Html.Attributes.style "text-decoration" "none", Html.Attributes.style "color" "#fff" ] [ text currentContract.address ] ] ]
                                    ]
                                , div [ class "avatar-wrapper" ]
                                    [ img
                                        [ src
                                            ("/assets/protocols/"
                                                ++ (case
                                                        Dict.get
                                                            (case getContractParentName model currentContract of
                                                                Just name ->
                                                                    name

                                                                Nothing ->
                                                                    "Unkown"
                                                            )
                                                            logoDict
                                                    of
                                                        Just logo ->
                                                            logo

                                                        Nothing ->
                                                            "unknown.svg"
                                                   )
                                            )
                                        , alt "Icon"
                                        , class "avatar"
                                        ]
                                        []
                                    ]
                                ]
                            , h4 [ class "condensed" ] [ text "Label" ]
                            , p [] [ span [ class "value" ] [ text (transformString currentContract.label) ] ]
                            , h4 [ class "condensed" ] [ text "Code ID" ]
                            , p [] [ span [ class "value" ] [ text (String.fromInt currentContract.code_id) ] ]
                            , h4 [ class "condensed" ] [ text "Creator" ]
                            , p [] [ span [ class "value" ] [ text currentContract.creator ] ]
                            , h4 [ class "condensed" ] [ text "Admin" ]
                            , p [] [ span [ class "value" ] [ text currentContract.admin ] ]
                            ]
                        ]
                    ]
                ]
            , projectView currentProject
            , div [ class "col-12 col-md-12 col-lg-10 col-xga-10 govern" ]
                [ div [ class "proposal" ]
                    [ article [ class "box mb-2" ]
                        [ h1 [ class "condensed" ] [ text "Raw Info" ]
                        , div [ class "md-flex dir-c ai-s mt-3" ]
                            [ div [ class "raw mt-a" ]
                                [ pre []
                                    [ text
                                        rawText
                                    ]
                                , span [ class "copy-button", onClick (Copy rawText) ] [ img [ src "./assets/icons/copy.svg" ] [] ]
                                ]
                            ]
                        ]
                    ]
                ]
            ]
        ]


rawText =
    """{
        "address": "kujira1qk00h5atutpsv900x202pxx42npjr9thg58dnqpa72f2p7m2luase444a7",
        "contract_info": {
            "code_id": "11",
            "creator": "kujira1ghmq7k50rwpsnye39aefngd2k7x9kc2hrqq5xd",
            "admin": "kujira1ghmq7k50rwpsnye39aefngd2k7x9kc2hrqq5xd",
            "label": "USK Controller",
            "created": null,
            "ibc_port_id": "",
            "extension": null
        }
    }"""



-- View Utilities


projectView : Project -> Html Msg
projectView project =
    a
        [ class "col-12 col-lg-4 col-fhd-4 flex"
        , href "#"
        , onClick (Current (SubEcosystem (String.toLower (String.replace " " "-" project.info.name))))
        , Html.Attributes.style "text-decoration" "none"
        , Html.Attributes.style "color" "#fff"
        ]
        [ section [ class "flex ValidatorBox box mb-4" ]
            [ article [ class "ValidatorLabelValueItem" ]
                [ div [ class "flex", Html.Attributes.style "flex-direction" "column", Html.Attributes.style "height" "-webkit-fill-available" ]
                    [ div [ class "flex ai-c condensed" ]
                        [ div []
                            [ h1 [] [ text project.info.name ]
                            , a
                                [ href
                                    (case project.info.website of
                                        Just url ->
                                            Url.toString url

                                        Nothing ->
                                            "#"
                                    )
                                , target "_blank"
                                , Html.Attributes.style "text-decoration" "none"
                                , Html.Attributes.style "color" "#fff"
                                ]
                                [ h2
                                    [ class "condensed url"
                                    ]
                                    [ text
                                        (case project.info.website of
                                            Just url ->
                                                Url.toString url

                                            Nothing ->
                                                "N/A"
                                        )
                                    ]
                                ]
                            ]
                        , div [ class "avatar-wrapper" ]
                            [ img [ src ("./assets/protocols/" ++ project.info.logo), alt "Icon", class "avatar" ] [] ]
                        ]
                    , div [ class "ValidatorBox__social flex mb-2" ]
                        [ case project.info.twitter of
                            Just url ->
                                a
                                    [ class "social"
                                    , href
                                        (Url.toString url)
                                    , target "_blank"
                                    , Html.Attributes.style "text-decoration" "none"
                                    , Html.Attributes.style "color" "#fff"
                                    ]
                                    [ img
                                        [ src "./assets/socials/twitter.svg"
                                        ]
                                        []
                                    ]

                            Nothing ->
                                div [] []
                        , case project.info.discord of
                            Just url ->
                                a
                                    [ class "social"
                                    , href
                                        (Url.toString url)
                                    , target "_blank"
                                    , Html.Attributes.style "text-decoration" "none"
                                    , Html.Attributes.style "color" "#fff"
                                    ]
                                    [ img
                                        [ src "./assets/socials/discord.svg"
                                        ]
                                        []
                                    ]

                            Nothing ->
                                div [] []
                        , case project.info.telegram of
                            Just url ->
                                a
                                    [ class "social"
                                    , href
                                        (Url.toString url)
                                    , target "_blank"
                                    , Html.Attributes.style "text-decoration" "none"
                                    , Html.Attributes.style "color" "#fff"
                                    ]
                                    [ img
                                        [ src "./assets/socials/telegram.svg"
                                        ]
                                        []
                                    ]

                            Nothing ->
                                div [] []
                        , case project.info.github of
                            Just url ->
                                a
                                    [ class "social"
                                    , href
                                        (Url.toString url)
                                    , target "_blank"
                                    , Html.Attributes.style "text-decoration" "none"
                                    , Html.Attributes.style "color" "#fff"
                                    ]
                                    [ img
                                        [ src "./assets/socials/github.svg"
                                        ]
                                        []
                                    ]

                            Nothing ->
                                div [] []
                        ]
                    , h4 [ class "condensed mt-1" ] [ text "Team" ]
                    , p [ Html.Attributes.style "margin-top" "0.24rem" ] [ span [ class "value" ] [ text project.info.team ] ]
                    , h4 [ class "condensed mt-1" ] [ text "Description" ]
                    , p [ Html.Attributes.style "margin-top" "0.24rem" ] [ span [] [ text project.info.description ] ]
                    , div [ Html.Attributes.style "margin-top" "auto" ]
                        [ div [ class "flex ai-c mt-2 condensed" ]
                            [ p []
                                [ span [ class "tag tag--teal pointer" ]
                                    [ text (categoryToString project.info.category)
                                    ]
                                ]
                            , p [ class "tag--right" ]
                                (List.map
                                    (\tag ->
                                        span [ class "tag tag--grey pointer" ] [ text tag ]
                                    )
                                    (List.map (\tags -> tagToString tags) project.info.tags)
                                )
                            ]
                        ]
                    ]
                ]
            ]
        ]


contractView : Model -> Contract -> Html Msg
contractView model contract =
    a
        [ class "col-12 col-lg-6 col-fhd-4 flex"
        , href ("/contracts/" ++ contract.address)
        , Html.Attributes.style "text-decoration" "none"
        , Html.Attributes.style "color" "#fff"
        , onClick (Current (SubContracts contract.address))
        ]
        [ section [ class "ValidatorBox box mb-4" ]
            [ article [ class "ValidatorLabelValueItem" ]
                [ div []
                    [ div [ class "flex ai-c" ]
                        [ div []
                            [ h4 [ class "condensed" ] [ text "Protocol" ]
                            , p [ Html.Attributes.style "margin-top" "0.24rem" ]
                                [ span [ class "value" ]
                                    [ text
                                        (case getContractParentName model contract of
                                            Just name ->
                                                name

                                            Nothing ->
                                                "Unknown"
                                        )
                                    ]
                                ]
                            , h4 [ class "condensed" ] [ text "Label" ]
                            , p [ Html.Attributes.style "margin-top" "0.24rem" ] [ span [ class "value" ] [ text (transformString contract.label) ] ]
                            ]
                        , div [ class "avatar-wrapper" ]
                            [ img
                                [ src
                                    ("assets/protocols/"
                                        ++ (case
                                                Dict.get
                                                    (case getContractParentName model contract of
                                                        Just name ->
                                                            name

                                                        Nothing ->
                                                            "Unknown"
                                                    )
                                                    logoDict
                                            of
                                                Just logo ->
                                                    logo

                                                Nothing ->
                                                    "unknown.svg"
                                           )
                                    )
                                , alt "Icon"
                                , class "avatar"
                                ]
                                []
                            ]
                        ]
                    , h4 [ class "condensed" ] [ text "Code ID" ]
                    , p [ Html.Attributes.style "margin-top" "0.24rem" ] [ span [ class "value" ] [ text (String.fromInt contract.code_id) ] ]
                    , h4 [ class "condensed" ] [ text "Contract" ]
                    , p [ Html.Attributes.style "margin-top" "0.24rem" ] [ span [ class "value" ] [ a [ href ("https://finder.kujira.app/kaiyo-1/contract/" ++ contract.address), target "_blank", Html.Attributes.style "text-decoration" "none", Html.Attributes.style "color" "#fff" ] [ text contract.address ] ] ]
                    , h4 [ class "condensed" ] [ text "Creator" ]
                    , p [ Html.Attributes.style "margin-top" "0.24rem" ] [ span [ class "value" ] [ text contract.creator ] ]
                    , h4 [ class "condensed" ] [ text "Admin" ]
                    , p [ Html.Attributes.style "margin-top" "0.24rem" ] [ span [ class "value" ] [ text contract.admin ] ]
                    ]
                ]
            ]
        ]


menutabs : Model -> List (Html Msg)
menutabs model =
    [ a
        [ class
            (if model.currentRoute == Home then
                "current"

             else
                ""
            )
        , onClick (Current Home)
        , href "#"
        ]
        [ img [ src "assets/icons/ratesbar.svg" ] [], span [] [ text "Dashboard" ] ]
    , a
        [ class
            (if model.currentRoute == Ecosystem then
                "current"

             else
                ""
            )
        , onClick (Current Ecosystem)
        , href "#"
        ]
        [ img [ src "assets/icons/ecosystem.svg" ] [], span [] [ text "Ecosystem" ] ]
    , a
        [ class
            (case model.currentRoute of
                SmartContracts ->
                    "current"

                SubContracts _ ->
                    "current"

                _ ->
                    ""
            )
        , onClick (Current SmartContracts)
        , href "#"
        ]
        [ img [ src "assets/icons/contracts.svg" ] [], span [] [ text "Smart Contracts" ] ]
    , a
        [ class
            (if model.currentRoute == AboutUs then
                "current"

             else
                ""
            )
        , onClick (Current AboutUs)
        , href "#"
        ]
        [ img [ src "assets/icons/info.svg" ] [], span [] [ text "About Us" ] ]
    ]


aboutView : Model -> Html Msg
aboutView model =
    div [ class "col-12 col-md-8 col-lg-9 col-xl-8 dashboard mt-4 mt-md-3 mb-2" ]
        [ h1 [ class "text-center text-md-left" ] [ text "About Us" ]
        , div [ class "row" ]
            [ div [ class "col-12 col-lg-8 col-fhd-4 " ]
                [ section [ class "ValidatorBox box flex dir-c" ]
                    [ p [ class "description" ] [ text "Rorcual Nodes is a project developed by two crypto enthusiasts that got hooked by the Kujira project. \n We aim to become one of the main validators in the Kujira Blockchain, adding value to the community and security to the Blockchain." ]
                    ]
                ]
            ]
        , div [ class "col-12 col-lg-12 col-fhd-4 mt-3" ]
            [ div [ class "row" ]
                [ div
                    [ class "col-12 col-lg-4 col-fhd-4 mt-3 flex"
                    ]
                    [ section [ class "flex ValidatorBox box" ]
                        [ div []
                            [ img [ src "assets/icons/key.svg", alt "Icon", class "icon" ] []
                            , h4 [ class "mt-1" ] [ text "Security" ]
                            , p [ class "description mt-2" ] [ text "Security is our main priority. We are always evaluating the best technologies to prevent downtime and double signing. Rorcual is operated by a highly reduced and trusted team, so everything is always under control." ]
                            ]
                        ]
                    ]
                , div
                    [ class "col-12 col-lg-4 col-fhd-4 mt-3 flex"
                    ]
                    [ section [ class "flex ValidatorBox box" ]
                        [ div []
                            [ img [ src "assets/icons/share.svg", alt "Icon", class "icon" ] []
                            , h4 [ class "mt-1" ] [ text "Communication" ]
                            , p [ class "description mt-2" ] [ text "It’s our focus create a platform where all delegators are treated as investors in a company. Every  governance decision should be meditated and explained to the community so everyone can understand the evolution of Kujira Blockchain." ]
                            ]
                        ]
                    ]
                , div
                    [ class "col-12 col-lg-4 col-fhd-4 mt-3 flex"
                    ]
                    [ section [ class "flex ValidatorBox box" ]
                        [ div []
                            [ img [ src "assets/icons/link.svg", alt "Icon", class "icon" ] []
                            , h4 [ class "mt-1" ] [ text "Decentralization" ]
                            , p [ class "description mt-2" ] [ text "Our main and backup setups are separated geographically and on different providers, so availability of the nodes is guaranteed. By delegating to Rorcual, you are contributing to the decentralization and security of the Kujira network." ]
                            ]
                        ]
                    ]
                ]
            ]
        ]


filterTeam : Model -> String -> String -> List Contract -> List Contract
filterTeam model searchTerm selectedTeam contracts =
    let
        matchSearch =
            case searchTerm of
                "" ->
                    always True

                _ ->
                    let
                        search =
                            String.toLower searchTerm
                    in
                    \contract ->
                        any (\field -> field |> String.toLower |> String.contains search)
                            [ contract.label
                            , String.fromInt contract.code_id
                            , contract.address
                            , contract.creator
                            , contract.admin
                            ]
    in
    case selectedTeam of
        "All" ->
            List.filter matchSearch contracts

        _ ->
            List.filter (\contract -> getContractParentTeam model contract == Just selectedTeam) contracts
                |> List.filter matchSearch


getContractParentTeam : Model -> Contract -> Maybe String
getContractParentTeam model contract =
    let
        projectWithContract =
            List.filter (\p -> List.any (\c -> c.address == contract.address) p.contracts) model.projects

        parentTeam =
            case projectWithContract of
                [] ->
                    Nothing

                [ project ] ->
                    Just project.info.team

                _ ->
                    -- This should not happen, but handle the case to avoid a potential error
                    Nothing
    in
    parentTeam


getContractParentName : Model -> Contract -> Maybe String
getContractParentName model contract =
    let
        projectWithContract =
            List.filter (\p -> List.any (\c -> c.address == contract.address) p.contracts) model.projects

        parentName =
            case projectWithContract of
                [] ->
                    Nothing

                [ project ] ->
                    Just project.info.name

                _ ->
                    -- This should not happen, but handle the case to avoid a potential error
                    Nothing
    in
    parentName


filterCategory : String -> String -> List Project -> List Project
filterCategory searchTerm selectedCategory projects =
    let
        categorySearch =
            case searchTerm of
                "" ->
                    always True

                _ ->
                    let
                        search =
                            String.toLower searchTerm
                    in
                    \project ->
                        any (\field -> field |> String.toLower |> String.contains search)
                            [ project.info.name
                            , categoryToString project.info.category
                            , project.info.team
                            , tagsToString project.info.tags
                            ]
    in
    case selectedCategory of
        "All" ->
            List.filter categorySearch projects

        _ ->
            List.filter (\project -> categoryToString project.info.category == selectedCategory) projects
                |> List.filter categorySearch



-- SelectCategory


dropdownCatSelector : Model -> Html Msg
dropdownCatSelector model =
    case model.dropDown of
        Open ->
            dropdownListCat model

        Close ->
            dropdownSelectedCat model


dropdownSelectedCat : Model -> Html Msg
dropdownSelectedCat model =
    div [ class "swap-input condensed md-input--light swap-input--team", onClick SelectionOpen ]
        [ div [ class "swap-input__selected" ]
            [ span []
                [ text
                    (case model.selectedCategory of
                        All ->
                            "All"

                        Selected cat ->
                            categoryToString cat
                    )
                ]
            , img [ src "assets/icons/chevron-small-down.svg" ] []
            ]
        ]


dropdownListCat : Model -> Html Msg
dropdownListCat model =
    let
        filteredCategories =
            List.filter (\category -> String.contains model.catSearch (String.toLower category)) (List.map categoryToString categoryOptions)

        catOptions : List (Html Msg)
        catOptions =
            a [ href "#", onClick (CategorySelect All) ]
                [ text
                    ("All ("
                        ++ String.fromInt (List.length model.projects)
                        ++ ")"
                    )
                ]
                :: List.map
                    (\category ->
                        a [ href "#", onClick (CategorySelect (Selected category)) ]
                            [ text
                                (categoryToString category
                                    ++ " ("
                                    ++ String.fromInt
                                        (List.length (List.filter (\project -> project.info.category == category) model.projects))
                                    ++ ")"
                                )
                            ]
                    )
                    (List.map stringToCategory filteredCategories)
    in
    div [ class "swap-input condensed swap-input--team swap-input--open" ]
        [ div [ class "swap-input__selected" ]
            [ div [ class "swap-input__search-icon" ] [ img [ src "assets/icons/search.svg" ] [] ]
            , input [ class "swap-input__search", value model.catSearch, onInput SearchCategory ] []
            , img [ src "assets/icons/chevron-small-up.svg", onClick SelectionClose ] []
            ]
        , div [ class "swap-input__dropdown", onClick SelectionClose ] catOptions
        ]



-- SelectTeam Utilities


dropdownTeamSelector : Model -> List Contract -> Html Msg
dropdownTeamSelector model contracts =
    case model.dropDown of
        Open ->
            dropdownListTeam model contracts

        Close ->
            dropdownSelectedTeam model


dropdownSelectedTeam : Model -> Html Msg
dropdownSelectedTeam model =
    div [ class "swap-input condensed md-input--light swap-input--team", onClick SelectionOpen ]
        [ div [ class "swap-input__selected" ]
            [ img [ src ("assets/teams/" ++ Maybe.withDefault "unknown.svg" (Dict.get model.selectedTeam teamIconsDict)) ] []
            , span [] [ text model.selectedTeam ]
            , img [ src "assets/icons/chevron-small-down.svg" ] []
            ]
        ]


dropdownListTeam : Model -> List Contract -> Html Msg
dropdownListTeam model contracts =
    let
        orderedTeamIcons =
            List.sortBy (\( team, _ ) -> team) teamIcons

        filteredTeams =
            List.filter (\( team, _ ) -> String.contains model.teamSearch (String.toLower team)) orderedTeamIcons

        teamOptions : List (Html Msg)
        teamOptions =
            List.filterMap
                (\( team, icon ) ->
                    let
                        teamContracts =
                            List.filter (\contract -> getContractParentTeam model contract == Just team) contracts
                    in
                    if List.length teamContracts == 0 then
                        Nothing

                    else
                        Just
                            (a
                                [ onClick (TeamSelected team), href "#" ]
                                [ img
                                    [ src ("assets/teams/" ++ Maybe.withDefault "unknown.svg" (Just icon))
                                    , alt "Icon"
                                    ]
                                    []
                                , text
                                    (team
                                        ++ " ("
                                        ++ String.fromInt
                                            (case team of
                                                "All" ->
                                                    List.length contracts

                                                _ ->
                                                    List.length teamContracts
                                            )
                                        ++ ")"
                                    )
                                ]
                            )
                )
                filteredTeams
    in
    div [ class "swap-input condensed swap-input--team swap-input--open" ]
        [ div [ class "swap-input__selected" ]
            [ div [ class "swap-input__search-icon" ] [ img [ src "assets/icons/search.svg" ] [] ]
            , input [ class "swap-input__search", value model.teamSearch, onInput SearchTeam ] []
            , img [ src "assets/icons/chevron-small-up.svg", onClick SelectionClose ] []
            ]
        , div [ class "swap-input__dropdown", onClick SelectionClose ] teamOptions
        ]


transformString : String -> String
transformString str =
    String.toLower str
        |> String.replace ":" "_"
        |> String.replace " " "_"
        |> String.replace "/" "-"
        |> String.replace ";" "_"
        |> String.replace "__" "_"
        |> String.replace "enable_orca_market_for_luna_collateral_on_usk" "orca_market_usk-luna"
        |> String.replace "enable_luna_as_usk_collateral" "usk_market_luna"
        |> (\s ->
                if String.contains "mainnet" s then
                    String.dropRight 10 s

                else
                    s
           )
        |> addLocal


shortenAddress : String -> String
shortenAddress address =
    String.left 6 address ++ "..." ++ String.right 6 address


addLocal : String -> String
addLocal s =
    if String.startsWith "hub" s || String.startsWith "offer" s || String.startsWith "price" s || String.startsWith "profile" s || String.startsWith "trade" s then
        "local_" ++ s

    else
        s


floatToDisplay : Float -> String
floatToDisplay float =
    String.fromFloat (Basics.toFloat (round (float * 10000)) / 10000)
