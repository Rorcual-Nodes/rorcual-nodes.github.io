module Types exposing (..)

import Browser.Navigation exposing (Key)
import Http
import Url exposing (Url)


type alias Flags =
    {}


type alias Model =
    { projects : List Project
    , searchTerm : String
    , selectedTeam : String
    , selectedCategory : CategorySelected
    , catSearch : String
    , teamSearch : String
    , dropDown : Selection
    , currentRoute : Route
    , navigationKey : Key
    , copyString : String
    , notification : Notification
    , popUp : Bool
    , exchangeRates : List Rates
    , rawData : String
    }


type Route
    = Index
    | SmartContracts
    | AboutUs
    | Ecosystem
    | SubEcosystem String
    | SubContracts String
    | NotFound


type alias Project =
    { info : ProjectInfo
    , contracts : List Contract
    }


type alias ProjectInfo =
    { id : Int
    , createDate : String
    , name : String
    , team : String
    , website : Maybe Url
    , twitter : Maybe Url
    , discord : Maybe Url
    , telegram : Maybe Url
    , github : Maybe Url
    , category : Category
    , tags : List Tag
    , description : String
    , logo : String
    , ids : List Int
    }


type alias Contract =
    { address : String
    , createDate : String
    , code_id : Int
    , creator : String
    , admin : String
    , label : String
    }


type Category
    = Culture
    | Defi
    | Infra
    | Tools
    | Exchange
    | Integrations


type CategorySelected
    = All
    | Selected Category


type Tag
    = Marketplace
    | NFT
    | Gaming
    | DAO
    | Yield
    | MM
    | Liquid
    | Derivatives
    | Launchpad
    | RiskMgmt
    | Bridge
    | Node
    | Oracle
    | Wallet
    | Payments
    | Analytics
    | Explorer
    | DEX
    | CEX
    | Infrastructure
    | Staking
    | Community
    | Security
    | None


type alias Rates =
    { denom : String
    , rate : Float
    }


type Selection
    = Open
    | Close


type Msg
    = GotProjects (Result Http.Error (List ProjectInfo))
    | GotContracts (Result Http.Error (List Contract))
    | GotRates (Result Http.Error (List Rates))
    | GotContract (Result Http.Error String)
    | Search String
    | TeamSelected String
    | Current Route
    | SearchTeam String
    | SearchCategory String
    | SelectionOpen
    | SelectionClose
    | SendUserToExternalUrl String
    | UserChangedRoute Route
    | CategorySelect CategorySelected
    | Copy String
    | NoOp
    | PopUp Notification
    | HidePopUp
    | ScrollToTop
    | Back


type Notification
    = Success String
    | Error String
    | Warning String


zeroProject : Project
zeroProject =
    { info = zeroInfo
    , contracts = []
    }


zeroInfo : ProjectInfo
zeroInfo =
    { id = 0
    , createDate = ""
    , ids = []
    , name = ""
    , team = ""
    , website = Nothing
    , twitter = Nothing
    , discord = Nothing
    , telegram = Nothing
    , github = Nothing
    , category = Defi
    , tags = [ None ]
    , logo = ""
    , description = ""
    }
