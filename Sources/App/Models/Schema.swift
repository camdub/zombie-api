import GraphQL
import Graphiti

let teamData = [
    Team(id: "1", name: "Hawks"),
    Team(id: "2", name: "Warriors")
]

let schema = try! Schema<Void, Void> { schema in
    try schema.object(type: Team.self) { team in
        team.description = "A team in the NFL"

        try team.exportFields()

        try team.field(
            name: "name",
            type: String.self,
            description: "Name of the team"
        )
    }

    try schema.query { query in
        struct TeamArguments: Arguments {
            let teamId: String?
            static let descriptions = ["id": "id of the team, if omitted return all the teams."]
        }
        try query.field(name: "team", type: [Team].self) { (_, arguments: TeamArguments, _, _) in
            if let id = arguments.teamId {
                return teamData.filter({ $0.id == id })
            }
            return teamData
        }
    }
}
