module Data exposing (..)

import Dict
import Types exposing (Category(..), Grantee, Tag(..))



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
    , ( "MantaDAO", "manta.svg" )
    , ( "TerraSpaces", "terraspaces.png" )
    , ( "ERIS Protocol", "eris.svg" )
    , ( "LocalDAO", "local.svg" )
    , ( "WinkHUB", "winkhub.jpg" )
    , ( "Unknown Team", "unknown.svg" )
    , ( "The Blend Builders", "blend.png" )
    , ( "Leap Cosmos", "leap.svg" )
    , ( "XDEFI Technologies", "xdefi.svg" )
    , ( "Nami", "nami.png" )
    , ( "Maya Protocol", "maya.png" )
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
            "DeFi"

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

        "Research" ->
            Research

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
            "Infra"

        Staking ->
            "Staking"

        Community ->
            "Community"

        Security ->
            "Security"

        Research ->
            "Research"

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
    , ( "Calculated Finance", "calc2.svg" )
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
    , ( "Manta", "manta.svg" )
    , ( "TerraSpaces", "terraspaces.png" )
    , ( "ERIS Protocol", "eris.svg" )
    , ( "LocalDAO", "local.svg" )
    , ( "GHOST", "ghost.png" )
    , ( "Sentinel", "kujira.svg" )
    , ( "WinkHUB", "winkhub.jpg" )
    , ( "Unkown", "unknown.svg" )
    , ( "Blend Protocol", "blend.png" )
    , ( "Leap Wallet", "leap.svg" )
    , ( "XDEFI Wallet", "xdefi.svg" )
    , ( "Ignition", "fuzion.png" )
    , ( "Quark", "quark.svg" )
    , ( "Unstake.fi", "unstake.png" )
    , ( "Nami Protocol", "nami.png" )
    , ( "Maya Protocol", "maya.png" )
    ]


granteeDict : Dict.Dict String Grantee
granteeDict =
    Dict.fromList whitelistGrantee


whitelistGrantee : List ( String, Grantee )
whitelistGrantee =
    [ ( "kujira1t29djm77sctjgjplduxgd7kgcgq7jtvrgwu4wd", Grantee "kujira1t29djm77sctjgjplduxgd7kgcgq7jtvrgwu4wd" "FIN Autowithdrawal" "Capybara Labs" )
    , ( "kujira1f49xq0rmah39sk58aaxq6gnqcvupee7j09yvp9", Grantee "kujira1f49xq0rmah39sk58aaxq6gnqcvupee7j09yvp9" "Batch Claim Rewards" "Capybara Labs" )
    , ( "kujira10fmz64pwj95qy3rgjm0kud2uz62thp3s88ajca", Grantee "kujira10fmz64pwj95qy3rgjm0kud2uz62thp3s88ajca" "CALC Stake" "CALC Finance" )
    , ( "kujira1mgwn34mwe85jwnkjkfgl84ngde0vzlhjz43cw3", Grantee "kujira1mgwn34mwe85jwnkjkfgl84ngde0vzlhjz43cw3" "CALC Stake" "CALC Finance" )
    , ( "kujira15064722pe9p7dqxcu8g560ufw9ckcs48e2u4ng", Grantee "kujira15064722pe9p7dqxcu8g560ufw9ckcs48e2u4ng" "CALC Stake" "CALC Finance" )
    , ( "kujira1377jxt6t0jrkk47thc86udxfxnvqkhj7evmd99", Grantee "kujira1377jxt6t0jrkk47thc86udxfxnvqkhj7evmd99" "CALC Stake" "CALC Finance" )
    , ( "kujira1dt7z77w6rwyvx2exczzfr7exgr4p7pk8kccum0", Grantee "kujira1dt7z77w6rwyvx2exczzfr7exgr4p7pk8kccum0" "CALC Stake" "CALC Finance" )
    , ( "kujira1e6fjnq7q20sh9cca76wdkfg69esha5zn53jjewrtjgm4nktk824stzyysu", Grantee "kujira1e6fjnq7q20sh9cca76wdkfg69esha5zn53jjewrtjgm4nktk824stzyysu" "CALC Autocompound" "CALC Finance" )
    , ( "kujira106n92ygqknaw5wcgl2e9v0duxxux6ntt8htkxp", Grantee "kujira106n92ygqknaw5wcgl2e9v0duxxux6ntt8htkxp" "Restake" "Golden Ratio Staking" )
    , ( "kujira1yxsmtnxdt6gxnaqrg0j0nudg7et2gqczq79u7u", Grantee "kujira1yxsmtnxdt6gxnaqrg0j0nudg7et2gqczq79u7u" "Restake" "ECO Stake 🌱" )
    , ( "kujira1xrrfek3qpz4ja8ccrjklfy064asyqq9kz65he9", Grantee "kujira1xrrfek3qpz4ja8ccrjklfy064asyqq9kz65he9" "Restake" "polkachu.com" )
    , ( "kujira1qtqwkth99f9argc37ya27gwglc62pum2alltf4", Grantee "kujira1qtqwkth99f9argc37ya27gwglc62pum2alltf4" "Restake" "AM Solutions 🐋" )
    , ( "kujira17j4r042dcvqpqdzxnw8eky02zv6gslrxjqju7u", Grantee "kujira17j4r042dcvqpqdzxnw8eky02zv6gslrxjqju7u" "Restake" "MMS" )
    , ( "kujira1n4mmffygh8wdm8zfxxv30cg0aq9m2s07lpa8kl", Grantee "kujira1n4mmffygh8wdm8zfxxv30cg0aq9m2s07lpa8kl" "Restake" "Allnodes.com ⚡️ 0% fee" )
    , ( "kujira1059rn0ksgn4e7rp2yq48vp6s8zqy5tl90gwwy5", Grantee "kujira1059rn0ksgn4e7rp2yq48vp6s8zqy5tl90gwwy5" "Restake" "Huginn" )
    , ( "kujira1tj0t93t6xjwe5dqptr62ej4pqvy2es0ryk2lje", Grantee "kujira1tj0t93t6xjwe5dqptr62ej4pqvy2es0ryk2lje" "Restake" "ChainTools" )
    , ( "kujira1murx57yjv5r5gvspcxxd8d3w0mmy52xtxu3q94", Grantee "kujira1murx57yjv5r5gvspcxxd8d3w0mmy52xtxu3q94" "Restake" "kjnodes.com 🦄" )
    , ( "kujira1r8egcurpwxftegr07gjv9gwffw4fk00960dj4f", Grantee "kujira1r8egcurpwxftegr07gjv9gwffw4fk00960dj4f" "Restake" "Kleomedes" )
    , ( "kujira1e44rluarkdw56dy2turnwjtvtg4wqvs0rrhu60", Grantee "kujira1e44rluarkdw56dy2turnwjtvtg4wqvs0rrhu60" "Restake" "WhisperNode🤐" )
    , ( "kujira1hcgxjhvv43g9z6dc58g428jgc8hdlmf7986d0g", Grantee "kujira1hcgxjhvv43g9z6dc58g428jgc8hdlmf7986d0g" "Restake" "Inter Blockchain Services" )
    , ( "kujira12xpq68caw2aqdu70jm4k792g0v9prhrp3tyudj", Grantee "kujira12xpq68caw2aqdu70jm4k792g0v9prhrp3tyudj" "Restake" "Lavender.Five Nodes 🐝" )
    , ( "kujira194ytn50yhh67rdha8akhs7c6zulnz4n2cltmpf", Grantee "kujira194ytn50yhh67rdha8akhs7c6zulnz4n2cltmpf" "Restake" "AutoStake 🛡️ Slash Protected" )
    , ( "kujira1m38vu5ynkdc76vfmyduxdy56yd47hrpdlegvg2", Grantee "kujira1m38vu5ynkdc76vfmyduxdy56yd47hrpdlegvg2" "Restake" "KujiDAO" )
    , ( "kujira19vpt6kqxel8ty727ftg7hn4rgyzr89m5tnhyem", Grantee "kujira19vpt6kqxel8ty727ftg7hn4rgyzr89m5tnhyem" "Restake" "Don Cryptonium" )
    , ( "kujira1dp67gfvhsffyn42k4srsw29wm6d55u9mx45n28", Grantee "kujira1dp67gfvhsffyn42k4srsw29wm6d55u9mx45n28" "Restake" "PFC" )
    , ( "kujira1sqqckf89jca2xehnj4tuda48h0an8xgpny9f53", Grantee "kujira1sqqckf89jca2xehnj4tuda48h0an8xgpny9f53" "Restake" "Narwhal Security" )
    , ( "kujira1p4557mdpc2qk8vcemeqgrcg55gs2uyzn474422", Grantee "kujira1p4557mdpc2qk8vcemeqgrcg55gs2uyzn474422" "Restake" "cosmosrescue" )
    , ( "kujira105fmlyf2r7yk542k85je6sly98nthvd036y2pl", Grantee "kujira105fmlyf2r7yk542k85je6sly98nthvd036y2pl" "Restake" "Kohola.io 🐋" )
    , ( "kujira1rguvj7fu77xr4qqqk8smuec8ps96800wshgmus", Grantee "kujira1rguvj7fu77xr4qqqk8smuec8ps96800wshgmus" "Restake" "mintthemoon" )
    , ( "kujira1v9vae554q55xa4pcfdm0p3kv8nxn50jkty92qr", Grantee "kujira1v9vae554q55xa4pcfdm0p3kv8nxn50jkty92qr" "Restake" "Cros-nest" )
    , ( "kujira1p0mr7h222e7ljkcmuje8gz0ayv43u50qse8d6w", Grantee "kujira1p0mr7h222e7ljkcmuje8gz0ayv43u50qse8d6w" "Restake" "OtterSync" )
    , ( "kujira1c905lutcz6mvav2q3smcgvksrgjzfepu4mt34h", Grantee "kujira1c905lutcz6mvav2q3smcgvksrgjzfepu4mt34h" "Restake" "Seoul Forest" )
    , ( "kujira1hy7fgsm0s5ewfswpmknyxfpqfw202wkj03qg0a", Grantee "kujira1hy7fgsm0s5ewfswpmknyxfpqfw202wkj03qg0a" "Restake" "Capybara Labs | Kujira Validator" )
    , ( "kujira1cj78sef57pm5w0h4q0gjtxjj8krfjht8acv6h2", Grantee "kujira1cj78sef57pm5w0h4q0gjtxjj8krfjht8acv6h2" "Restake" "danku_zone w/ DAIC" )
    , ( "kujira1hhzf9u376mg8zcuvx3jsls7t805kzcrssrvvk5", Grantee "kujira1hhzf9u376mg8zcuvx3jsls7t805kzcrssrvvk5" "Restake" "Synergy Nodes" )
    , ( "kujira1305e92ng6a9pdh3ttc3ld459ckxupxt3xycmhd", Grantee "kujira1305e92ng6a9pdh3ttc3ld459ckxupxt3xycmhd" "Restake" "✅ CryptoCrew Validators #IBCgang" )
    , ( "kujira1ckyt39wtj5kjuj7tn6agrg5jheua5cjkpxg80a", Grantee "kujira1ckyt39wtj5kjuj7tn6agrg5jheua5cjkpxg80a" "Restake" "defiantlabs" )
    , ( "kujira1m3rq2xswhgnt8hfqmggq5dtwjqkf0f0stgyrnu", Grantee "kujira1m3rq2xswhgnt8hfqmggq5dtwjqkf0f0stgyrnu" "Restake" "Smart Stake 📈📊 Analytics Hub" )
    , ( "kujira1ewps7h457xpuxhllyjwn0mnnhfprnqlhejxmq2", Grantee "kujira1ewps7h457xpuxhllyjwn0mnnhfprnqlhejxmq2" "Restake" "SCV-Security" )
    , ( "kujira1eml7agwd5x084ennlg6apvskufzrlvnr8cc0cn", Grantee "kujira1eml7agwd5x084ennlg6apvskufzrlvnr8cc0cn" "Restake" "Imperator.co" )
    , ( "kujira19p743n8f5syxjawlp6zhjje6jutywxuglu5hrd", Grantee "kujira19p743n8f5syxjawlp6zhjje6jutywxuglu5hrd" "Restake" "Enigma" )
    , ( "kujira1xs023g3yj2mavwn3cjclgsh8mlk0kgsjhkvwq0", Grantee "kujira1xs023g3yj2mavwn3cjclgsh8mlk0kgsjhkvwq0" "Restake" "kingnodes 👑" )
    , ( "kujira1ttlh4f6vdjecx7ktre6lr5feljy966dekaskqh", Grantee "kujira1ttlh4f6vdjecx7ktre6lr5feljy966dekaskqh" "Restake" "LittleFishStake" )
    , ( "kujira1xdlx2emsz589c06ajv7m4pcpwqkafcdd26ny7y", Grantee "kujira1xdlx2emsz589c06ajv7m4pcpwqkafcdd26ny7y" "Restake" "ChecksosVal" )
    , ( "kujira1t5ykuy6eqyh495ew79zl46ea4fcaw63cpt6sm4", Grantee "kujira1t5ykuy6eqyh495ew79zl46ea4fcaw63cpt6sm4" "Restake" "openbitlab" )
    , ( "kujira1xmdmznr3snzr5nq3dwwkyrprq5j4fl6zu0ws0x", Grantee "kujira1xmdmznr3snzr5nq3dwwkyrprq5j4fl6zu0ws0x" "Restake" "ghostinnet" )
    , ( "kujira1ksx5yarsdjw8wcgkqn4v5demdszzx9ereushmg", Grantee "kujira1ksx5yarsdjw8wcgkqn4v5demdszzx9ereushmg" "Restake" "NODEJUMPER" )
    , ( "kujira1njj830jqf0zg79w4n738c7jfr8w65e0ewvpy6f", Grantee "kujira1njj830jqf0zg79w4n738c7jfr8w65e0ewvpy6f" "Restake" "Crypto Chemistry" )
    , ( "kujira164e53fz34nkc03vnncdl5w9xp420lkak9prfpz", Grantee "kujira164e53fz34nkc03vnncdl5w9xp420lkak9prfpz" "Restake" "Oni ⛩️" )
    , ( "kujira1w4du0y6705rqregfl6cktm7swds6t4dsvjsesu", Grantee "kujira1w4du0y6705rqregfl6cktm7swds6t4dsvjsesu" "Restake" "Active Nodes" )
    ]
