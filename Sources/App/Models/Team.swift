import Vapor
import Graphiti

final class Team {
    var name: String
    var id: String

    init(id: String, name: String) {
        self.id = id
        self.name = name
    }
}

extension Team: OutputType {}

