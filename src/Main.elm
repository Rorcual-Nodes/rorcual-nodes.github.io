port module Main exposing (..)

import Browser exposing (Document, UrlRequest(..))
import Browser.Dom as Dom exposing (setViewport)
import Browser.Navigation as Navigation exposing (Key)
import Data exposing (..)
import Delay
import Dict
import Html.Events exposing (custom)
import Http
import Json.Decode as Decode exposing (Decoder, field, float, list, string)
import Json.Decode.Pipeline exposing (hardcoded, optional, required)
import List exposing (any)
import Routing exposing (parseUrlToRoute)
import Set
import Task
import Types exposing (..)
import Url exposing (Protocol(..), Url)
import Views exposing (..)


main : Program Flags Model Msg
main =
    Browser.application
        { init = init
        , onUrlChange = onUrlChange
        , onUrlRequest = onUrlRequest
        , view = view
        , update = update
        , subscriptions = subscriptions
        }


init : Flags -> Url -> Key -> ( Model, Cmd Msg )
init flags url key =
    let
        parsedUrl =
            parseUrlToRoute url

        newModel =
            { projects = []
            , searchTerm = ""
            , selectedTeam = "All"
            , selectedCategory = All
            , catSearch = ""
            , teamSearch = ""
            , dropDown = Close
            , currentRoute = parsedUrl
            , navigationKey = key
            , copyString = ""
            , notification = Success ""
            , popUp = False
            , exchangeRates = []
            }
    in
    ( newModel
    , Cmd.batch
        [ getProjects
        , Routing.pushUrl key Home
        , getRates
        ]
    )



-- API Queries


apiUrl : String
apiUrl =
    "http://api.rorcualnodes.com:3000"


getProjects : Cmd Msg
getProjects =
    Http.get
        { url = apiUrl ++ "/projects"
        , expect =
            Http.expectJson
                GotProjects
                projectDecoder
        }


projectDecoder : Decoder (List ProjectInfo)
projectDecoder =
    Decode.list
        (Decode.succeed ProjectInfo
            |> required "ID" Decode.int
            |> required "CreatedAt" Decode.string
            |> required "Name" Decode.string
            |> required "Team" Decode.string
            |> required "Website" (Decode.map Url.fromString Decode.string)
            |> optional "Twitter" (Decode.map Url.fromString Decode.string) Nothing
            |> optional "Discord" (Decode.map Url.fromString Decode.string) Nothing
            |> optional "Telegram" (Decode.map Url.fromString Decode.string) Nothing
            |> optional "Github" (Decode.map Url.fromString Decode.string) Nothing
            |> required "Category" (Decode.map stringToCategory Decode.string)
            |> required "Tags" (Decode.list (Decode.map stringToTag Decode.string))
            |> required "Description" Decode.string
            |> required "Name" (Decode.string |> Decode.map (\name -> Maybe.withDefault "unknown.svg" (Dict.get name logoDict)))
            |> required "Ids"
                (Decode.nullable (Decode.list Decode.int)
                    |> Decode.map (Maybe.withDefault [])
                )
        )



-- Data Utilities


fetchData : Cmd Msg
fetchData =
    Http.get
        { url = apiUrl ++ "/contracts"
        , expect =
            Http.expectJson
                GotContracts
                contractDecoder
        }


contractDecoder : Decode.Decoder (List Contract)
contractDecoder =
    Decode.list
        (Decode.map5 Contract
            (Decode.field "Address" Decode.string)
            (Decode.field "Code_id" Decode.int)
            (Decode.field "Creator" Decode.string)
            (Decode.field "Admin" Decode.string)
            (Decode.field "Label" Decode.string)
        )



-- Rates Utilities


getRates : Cmd Msg
getRates =
    Http.get
        { url = "https://lcd.kaiyo.kujira.setten.io/oracle/denoms/exchange_rates"
        , expect =
            Http.expectJson
                GotRates
                ratesDecoder
        }


ratesDecoder : Decode.Decoder (List Rates)
ratesDecoder =
    Decode.field "exchange_rates"
        (Decode.list
            (Decode.map2 Rates
                (field "denom" string)
                (field "amount" string
                    |> Decode.andThen
                        (\stringValue ->
                            case String.toFloat stringValue of
                                Just floatValue ->
                                    Decode.succeed floatValue

                                Nothing ->
                                    Decode.fail "Amount field is not parseable as float"
                        )
                )
            )
        )



-- Commands


showPopUp : Notification -> Cmd Msg
showPopUp notification =
    Cmd.map PopUp (Task.perform identity (Task.succeed notification))


resetViewport : Cmd Msg
resetViewport =
    Task.perform (\_ -> NoOp) (Dom.setViewport 0 0)



-- Ports


port copyToClipboard : String -> Cmd msg


port copyResult : (String -> msg) -> Sub msg



-- Update Function


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        GotProjects (Ok infos) ->
            let
                newProjects =
                    List.map
                        (\projectInfo ->
                            { info = projectInfo
                            , contracts = []
                            }
                        )
                        infos
            in
            ( { model | projects = newProjects }, fetchData )

        GotProjects (Err error) ->
            let
                errorMessage =
                    case error of
                        Http.Timeout ->
                            "Request timed out"

                        Http.NetworkError ->
                            "Network error"

                        Http.BadStatus response ->
                            "Bad status: " ++ String.fromInt response

                        Http.BadBody string ->
                            "Bad response body: " ++ string

                        Http.BadUrl url ->
                            "Bad request URL: " ++ url

                notification =
                    Error errorMessage
            in
            ( model, showPopUp notification )

        GotContracts (Ok newContracts) ->
            let
                updateProjectContracts project =
                    let
                        matchingContracts =
                            List.filter
                                (\contract -> List.member contract.code_id project.info.ids)
                                newContracts
                    in
                    { project | contracts = matchingContracts }
            in
            let
                updatedProjects =
                    List.map updateProjectContracts model.projects
            in
            ( { model | projects = updatedProjects }, Cmd.none )

        GotContracts (Err error) ->
            let
                errorMessage =
                    case error of
                        Http.Timeout ->
                            "Request timed out"

                        Http.NetworkError ->
                            "Network error"

                        Http.BadStatus response ->
                            "Bad status: " ++ String.fromInt response

                        Http.BadBody string ->
                            "Bad response body: " ++ string

                        Http.BadUrl url ->
                            "Bad request URL: " ++ url

                notification =
                    Error errorMessage
            in
            ( model, showPopUp notification )

        GotRates (Ok rates) ->
            ( { model | exchangeRates = rates }
            , Cmd.none
            )

        GotRates (Err error) ->
            let
                errorMessage =
                    case error of
                        Http.Timeout ->
                            "Request timed out"

                        Http.NetworkError ->
                            "Network error"

                        Http.BadStatus response ->
                            "Bad status: " ++ String.fromInt response

                        Http.BadBody string ->
                            "Bad response body: " ++ string

                        Http.BadUrl url ->
                            "Bad request URL: " ++ url

                notification =
                    Error errorMessage
            in
            ( model, showPopUp notification )

        Search term ->
            ( { model | searchTerm = term }, Cmd.none )

        TeamSelected newSelected ->
            ( { model | selectedTeam = newSelected }, Cmd.none )

        CategorySelect newSelected ->
            ( { model | selectedCategory = newSelected }, Cmd.none )

        Current newRoute ->
            ( { model | currentRoute = newRoute, searchTerm = "", dropDown = Close }, Cmd.none )

        SearchTeam team ->
            ( { model | teamSearch = team }, Cmd.none )

        SearchCategory category ->
            ( { model | catSearch = category }, Cmd.none )

        SelectionOpen ->
            ( { model | dropDown = Open }, Cmd.none )

        SelectionClose ->
            ( { model | dropDown = Close }, Cmd.none )

        NoOp ->
            ( model, Cmd.none )

        SendUserToExternalUrl url ->
            ( model, Navigation.load url )

        UserChangedRoute newRoute ->
            ( { model | currentRoute = newRoute }, Cmd.none )

        Copy str ->
            ( model, copyToClipboard str )

        PopUp notification ->
            ( { model | notification = notification, popUp = True }, Cmd.batch [ Delay.after 4000 HidePopUp ] )

        HidePopUp ->
            ( { model | popUp = False }, Cmd.none )

        ScrollToTop ->
            ( model, resetViewport )



-- View Function


view : Model -> Document Msg
view model =
    { title = "Rorcual Nodes"
    , body = bodyView model
    }



-- URL Management


onUrlRequest : UrlRequest -> Msg
onUrlRequest urlRequest =
    case urlRequest of
        External externalUrl ->
            SendUserToExternalUrl externalUrl

        Internal url ->
            NoOp


onUrlChange : Url -> Msg
onUrlChange url =
    Routing.parseUrlToRoute url
        |> UserChangedRoute


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.batch
        [ copyResult (\result -> PopUp (Success result))
        ]
