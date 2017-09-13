import GraphQL
import Graphiti

let teamData = [
    Team(name: "Los Angeles Chargers", abbv: "LAC", logo: "https://dl.airtable.com/Exq41QaRS6xxRG1ecKO0_cardinals.svg"),
    Team(name: "Washington Redskins", abbv: "WSH", logo: ""),
    Team(name: "Dallas Cowboys", abbv: "DAL", logo: "")
]

let schema = try! Schema<Void, Void> { schema in
    try schema.object(type: Team.self) { team in
        team.description = "NFL Teams (there are 32)"

        try team.field(
            name: "name",
            type: String.self,
            description: "Name of the team (including city name, e.g., Washington Redskins)"
        )

        try team.field(
            name: "abbreviation",
            type: String.self,
            description: "Three letter abbreviation of the team, i.e., Washington Redskins -> WSH"
        ) { team, _, _, _ in return team.abbv }

        try team.field(
            name: "logo",
            type: String.self,
            description: "Constant size SVG logo of the team"
        )
    }

    try schema.query { query in
        struct TeamArguments: Arguments {
            let teamId: String?
            static let descriptions = ["id": "id of the team, if omitted return all the teams."]
        }
        try query.field(name: "team", type: [Team].self) { (_, _, _, _) in
            // return all data for now since no db setup
            return teamData
        }
    }
}
