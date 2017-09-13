import Vapor
import Graphiti

final class Team {
    var name: String
    var abbv: String
    var logo: String

    init(name: String, abbv: String, logo: String) {
        self.name = name
        self.abbv = abbv
        self.logo = logo
    }
}

extension Team: OutputType {}
