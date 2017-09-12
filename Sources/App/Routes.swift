import Vapor

extension Droplet {
    func setupRoutes() throws {
        get("graphiql") { _ in
            return try self.view.make("graphiql")
        }

        all("api") { req in
            let query = req.data["query"]?.string
            let result = try schema.execute(request: query!)
            return result.description
        }
    }
}
