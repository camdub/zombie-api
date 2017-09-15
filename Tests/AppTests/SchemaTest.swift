import XCTest
@testable import App

class SchemaTest: TestCase {
    func testExample() throws {
        // let query = "query getTeams { team { name } }"
        // let result = try schema.execute(request: query)
        // Fake example while testing strategy is refined
        XCTAssertEqual("", "")
    }
}


extension SchemaTest {
    /// This is a requirement for XCTest on Linux
    /// to function properly.
    /// See ./Tests/LinuxMain.swift for examples
    static let allTests = [
        ("getTeams", testExample)
    ]
}
