import Vapor
import Graphiti
import Meow

public final class Team: Model {
    // var _id = ObjectId()
    var name: String
    var abbv: String
    var logo: String

    init(name: String, abbv: String, logo: String) {
        self.name = name
        self.abbv = abbv
        self.logo = logo
    }

// swiftlint:disable line_length trailing_semicolon identifier_name
// sourcery:inline:auto:Team.Meow
	@available(*, unavailable, message: "This API is internal to Meow. You can create a new instance using your own inits or using init(newFrom:).")
	public required init(restoring source: BSON.Primitive, key: String) throws {
		guard let document = source as? BSON.Document else {
			throw Meow.Error.cannotDeserialize(type: Team.self, source: source, expectedPrimitive: BSON.Document.self);
		}

		Meow.pool.free(self._id)
		self._id = try document.unpack("_id")
		self.name = try document.unpack(Key.name.keyString)
		self.abbv = try document.unpack(Key.abbv.keyString)
		self.logo = try document.unpack(Key.logo.keyString)
	}

	public required init(newFrom source: BSON.Primitive) throws {
		guard let document = source as? BSON.Document else {
			throw Meow.Error.cannotDeserialize(type: Team.self, source: source, expectedPrimitive: BSON.Document.self);
		}

		self.logo = (try document.unpack(Key.logo.keyString))
		self.abbv = (try document.unpack(Key.abbv.keyString))
		self.name = (try document.unpack(Key.name.keyString))
	}
	public var _id = Meow.pool.newObjectId() { didSet { Meow.pool.free(oldValue) } }

	deinit {
		Meow.pool.handleDeinit(self)
	}
// sourcery:end
// swiftlint:enable
}

extension Team: OutputType {}
