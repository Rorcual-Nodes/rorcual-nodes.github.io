module Data exposing (..)

import Dict
import Types exposing (Category(..), Tag(..))



-- Teams Data


teamIconsDict : Dict.Dict String String
teamIconsDict =
    Dict.fromList teamIcons


teamIcons : List ( String, String )
teamIcons =
    [ ( "All", "server.svg" )
    , ( "Team Kujira", "kujira.svg" )
    , ( "Fuzion", "fuzion.png" )
    , ( "CALC Finance", "calc.svg" )
    , ( "Local Money", "local.svg" )
    , ( "Black Whale", "blackwhale.svg" )
    , ( "Entropic Labs", "entropic_white.svg" )
    , ( "Fitlink", "fitlink.png" )
    , ( "Capybara Labs", "capybaralabs.png" )
    , ( "KUJIRANS", "kujirans.png" )
    , ( "Shrimp Gang", "shrimpgang.png" )
    , ( "Kujira Track", "kujira-track.png" )
    , ( "Cosmos Rescue", "cosmos-rescue.png" )
    , ( "Ghosts In The Chain", "gitc.png" )
    , ( "Axelar", "axelar.jpg" )
    , ( "Squid", "squid.jpg" )
    , ( "Kado", "kado.jpg" )
    , ( "Keplr", "keplr.png" )
    , ( "Terra", "terra.png" )
    , ( "Cosmostation Validator", "cosmostation.png" )
    , ( "Stargaze", "stargaze.jpg" )
    , ( "Rango Exchange", "rango.jpg" )
    , ( "Stride", "stride.png" )
    , ( "Llama Corp", "llamacorp.jpg" )
    , ( "Blockscape", "blockscape.png" )
    , ( "Coinhall", "coinhall.jpg" )
    , ( "Pulsar", "pulsar.jpg" )
    , ( "Nansen", "nansen.png" )
    , ( "DLOYAL Refer", "dloyal.svg" )
    , ( "Unknown Team", "unknown.svg" )
    ]



-- Category Data


categoryOptions : List Category
categoryOptions =
    [ Culture, Defi, Infra, Tools, Exchange, Integrations ]


categoryToString : Category -> String
categoryToString category =
    case category of
        Culture ->
            "Culture"

        Defi ->
            "Defi"

        Infra ->
            "Infrastructure"

        Tools ->
            "Tools"

        Exchange ->
            "Exchange"

        Integrations ->
            "Integrations"


stringToCategory : String -> Category
stringToCategory category =
    case category of
        "Culture" ->
            Culture

        "Defi" ->
            Defi

        "Infrastructure" ->
            Infra

        "Tools" ->
            Tools

        "Exchange" ->
            Exchange

        "Integrations" ->
            Integrations

        _ ->
            Defi



-- Tag Data


stringToTag : String -> Tag
stringToTag string =
    case string of
        "Marketplace" ->
            Marketplace

        "NFT" ->
            NFT

        "Gaming" ->
            Gaming

        "DAO" ->
            DAO

        "Yield" ->
            Yield

        "MM" ->
            MM

        "Liquid" ->
            Liquid

        "Derivatives" ->
            Derivatives

        "Launchpad" ->
            Launchpad

        "RiskMgmt" ->
            RiskMgmt

        "Bridge" ->
            Bridge

        "Node" ->
            Node

        "Oracle" ->
            Oracle

        "Wallet" ->
            Wallet

        "Payments" ->
            Payments

        "Analytics" ->
            Analytics

        "Explorer" ->
            Explorer

        "DEX" ->
            DEX

        "CEX" ->
            CEX

        "Infrastructure" ->
            Infrastructure

        "Staking" ->
            Staking

        "Community" ->
            Community

        "Security" ->
            Security

        _ ->
            None


tagsToString : List Tag -> String
tagsToString tags =
    String.join ", " (List.map tagToString tags)


tagToString : Tag -> String
tagToString tag =
    case tag of
        Marketplace ->
            "Marketplace"

        NFT ->
            "NFT"

        Gaming ->
            "Gaming"

        DAO ->
            "DAO"

        Yield ->
            "Yield Farm"

        MM ->
            "Market Maker"

        Liquid ->
            "Liquid"

        Derivatives ->
            "Derivatives"

        Launchpad ->
            "Launchpad"

        RiskMgmt ->
            "Risk Mgmt"

        Bridge ->
            "Bridge"

        Node ->
            "Node"

        Oracle ->
            "Oracle"

        Wallet ->
            "Wallet"

        Payments ->
            "Payments"

        Analytics ->
            "Analytics"

        Explorer ->
            "Explorer"

        DEX ->
            "DEX"

        CEX ->
            "CEX"

        Infrastructure ->
            "Infrastructure"

        Staking ->
            "Staking"

        Community ->
            "Community"

        Security ->
            "Security"

        None ->
            ""



-- Project Data


logoDict : Dict.Dict String String
logoDict =
    Dict.fromList projectLogo


projectLogo : List ( String, String )
projectLogo =
    [ ( "BOW", "bow.svg" )
    , ( "FIN", "fin.svg" )
    , ( "ORCA", "orca.svg" )
    , ( "USK", "usk.svg" )
    , ( "POD", "pod.png" )
    , ( "Finder", "finder.svg" )
    , ( "Plasma", "plasma.png" )
    , ( "Calculated Finance", "calc.png" )
    , ( "Local Money", "local.svg" )
    , ( "Black Whale", "blackwhale.svg" )
    , ( "Entropy Beacon", "entropic_white.svg" )
    , ( "Senate", "senate.jpg" )
    , ( "Kuji Kast", "kujikast.png" )
    , ( "BFIT by Fitlink", "bfit.png" )
    , ( "SeaShanty", "seashanty.png" )
    , ( "Kujiran's Lucky Reel", "lucky_reel.svg" )
    , ( "KUJIRANS", "kujirans.png" )
    , ( "Shrimp Gang", "shrimpgang.png" )
    , ( "Kujira Track", "kujira-track.png" )
    , ( "Ghosts In The Chain", "gitc.png" )
    , ( "Cosmos Rescue", "cosmos-rescue.png" )
    , ( "Cosmobot", "cosmobot.png" )
    , ( "Satellite", "axelar.jpg" )
    , ( "Squid Router", "squid.jpg" )
    , ( "Kado", "kado.jpg" )
    , ( "Keplr", "keplr.png" )
    , ( "Station", "station.png" )
    , ( "Cosmostation", "cosmostation.png" )
    , ( "Stargaze", "stargaze.jpg" )
    , ( "Rango Exchange", "rango.jpg" )
    , ( "Stride", "stride.png" )
    , ( "DefiLlama", "defillama.jpg" )
    , ( "Gravity Bridge", "gravity.jpg" )
    , ( "Coinhall", "coinhall.jpg" )
    , ( "Pulsar", "pulsar.jpg" )
    , ( "Nansen Portfolio", "nansenp.png" )
    , ( "DLOYAL Refer", "dloyal.svg" )
    , ( "PILOT", "pilot.png" )
    , ( "Unkown", "unknown.svg" )
    ]
