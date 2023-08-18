module Routing exposing (parseUrlToRoute, pushUrl)

import Browser.Navigation as Navigation exposing (Key)
import Types exposing (Msg, Route(..))
import Url exposing (Url)
import Url.Parser as Parser exposing ((</>))


pushUrl : Key -> Route -> Cmd Msg
pushUrl key route =
    let
        url =
            case route of
                Index ->
                    "/"

                Ecosystem ->
                    "/ecosystem"

                SmartContracts ->
                    "/contracts"

                AuthzCheck ->
                    "/authz"

                SubEcosystem subProject ->
                    "/ecosystem/" ++ subProject

                SubContracts subContract ->
                    "/contracts/" ++ subContract

                NotFound ->
                    "/four-oh-four"
    in
    Navigation.pushUrl key url



-- loadUrl : Route -> Cmd Msg
-- loadUrl route =
--     let
--         url =
--             case route of
--                 Index ->
--                     "/"
--                 Ecosystem ->
--                     "/ecosystem"
--                 SmartContracts ->
--                     "/contracts"
--                 AboutUs ->
--                     "/about"
--                 SubEcosystem subProject ->
--                     "/ecosystem/" ++ subProject
--                 SubContracts subContract ->
--                     "/contracts/" ++ subContract
--                 NotFound ->
--                     "/four-oh-four"
--     in
--     Navigation.load url


routeParser : Parser.Parser (Route -> a) a
routeParser =
    Parser.oneOf
        [ Parser.map Index Parser.top
        , Parser.map Ecosystem (Parser.s "ecosystem")
        , Parser.map SmartContracts (Parser.s "contracts")
        , Parser.map AuthzCheck (Parser.s "authz")
        , Parser.map SubContracts (Parser.s "contracts" </> Parser.string)
        , Parser.map SubEcosystem (Parser.s "ecosystem" </> Parser.string)
        , Parser.map NotFound (Parser.s "not_found")
        ]


parseUrlToRoute : Url -> Route
parseUrlToRoute url =
    Maybe.withDefault NotFound (Parser.parse routeParser url)
