import GraphQL
import Graphiti
import Meow

// swiftlint:disable force_try
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
            let abbv: String?
            static let descriptions = ["abbv": "Three letter abbreviation for the team"]
        }
        try query.field(name: "team", type: [Team].self) { (_, arguments: TeamArguments, _, _) in
            if let abbv = arguments.abbv {
                if let team = try Team.findOne { team in team.abbv == abbv } {
                    return [team]
                }
                return []
            }
            let teams = try Team.find()
            return Array(teams)
        }
    }
}
