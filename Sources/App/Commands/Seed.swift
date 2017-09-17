import Vapor
import Console

final class SeedCommand: Command, ConfigInitializable {
    public let id = "seed" // swiftlint:disable:this identifier_name
    public let help = ["Seed the database"]
    let console: ConsoleProtocol
    let client: ClientFactoryProtocol

    fileprivate var apiKey: String?
    fileprivate var apiUrl: String?

    required init(config: Config) throws {
        self.console = try config.resolveConsole()
        self.client = try config.resolveClient()

        self.apiKey = config["app", "airtable_api_key"]?.string
        self.apiUrl = config["app", "airtable_url"]?.string
    }

    public func run(arguments: [String]) throws {
        do {
            console.info("Removing Team collection", newLine: true)
            try Team.collection.remove()
        } catch let error {
            console.error(error.localizedDescription, newLine: true)
        }

        console.info("Fetching Data from Airtable")
        let res = try client.get("\(apiUrl!)/Teams", query: [
            "api_key": apiKey!
        ])

        if res.status == .ok {
            let teams = res.data["records"]?.array!
            teams?.forEach { teamData in
                let team = Team(
                    name: (teamData["fields", "Name"]?.string)!,
                    abbv: (teamData["fields", "Abbv"]?.string)!,
                    logo: (teamData["fields", "Logo", 1, "url"]?.string)!
                )
                do {
                    try team.save()
                } catch let err {
                    console.error("\(team.description) could not be added: \(err.localizedDescription)")
                }
            }
        }
    }
}
