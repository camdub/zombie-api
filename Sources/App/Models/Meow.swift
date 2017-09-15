// Generated using Sourcery 0.8.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT


// MARK: Meow.ejs
// MARK: MeowCore.ejs


// MARK: - General Information
// Supported Primitives: ObjectId, String, Int, Int32, Bool, Document, Double, Data, Binary, Date, RegularExpression
// Sourcery Types: class Team
import Foundation
import Meow
import ExtendedJSON


// MARK: Protocols.ejs




// MARK: - 🐈 for Team
// MARK: Serializable.ejs
// MARK: SerializableStructClass.ejs

extension Team : SerializableToDocument {

	

	public func serialize() -> Document {
		var document: Document = [:]
		document.pack(self._id, as: "_id")
		document.pack(self.name, as: Key.name.keyString)
		document.pack(self.abbv, as: Key.abbv.keyString)
		document.pack(self.logo, as: Key.logo.keyString)
		return document
	}

	public static func validateUpdate(with document: Document) throws {
		let keys = document.keys
		if keys.contains(Key.name.keyString) {
			_ = (try document.unpack(Key.name.keyString)) as String
		}
		if keys.contains(Key.abbv.keyString) {
			_ = (try document.unpack(Key.abbv.keyString)) as String
		}
		if keys.contains(Key.logo.keyString) {
			_ = (try document.unpack(Key.logo.keyString)) as String
		}
	}

	public func update(with document: Document) throws {
		try Team.validateUpdate(with: document)

		for key in document.keys {
			switch key {
			case Key.name.keyString:
				self.name = try document.unpack(Key.name.keyString)
			case Key.abbv.keyString:
				self.abbv = try document.unpack(Key.abbv.keyString)
			case Key.logo.keyString:
				self.logo = try document.unpack(Key.logo.keyString)
			default: break
			}
		}
	}

	
	
	public static let collection: MongoKitten.Collection = Meow.database["teams"]
	

	// MARK: ModelResolvingFunctions.ejs

	
	public static func byId(_ value: ObjectId) throws -> Team? {
		return try Team.findOne("_id" == value)
	}
	



	public static func byName(_ value: String) throws -> Team? {
		return try Team.findOne(Key.name.rawValue == value)
	}

	public static func byAbbv(_ value: String) throws -> Team? {
		return try Team.findOne(Key.abbv.rawValue == value)
	}

	public static func byLogo(_ value: String) throws -> Team? {
		return try Team.findOne(Key.logo.rawValue == value)
	}


	

	// MARK: KeyEnum.ejs

	public enum Key : String, ModelKey {
		case _id
		case name = "name"
		case abbv = "abbv"
		case logo = "logo"


		public var keyString: String { return self.rawValue }

		public var type: Any.Type {
			switch self {
			case ._id: return ObjectId.self
			case .name: return String.self
			case .abbv: return String.self
			case .logo: return String.self
			}
		}

		public static var all: Set<Key> {
			return [._id, .name, .abbv, .logo]
		}
	}

	// MARK: Values.ejs
	

	/// Represents (part of) the values of a Team
	public struct Values : ModelValues {
		public init() {}
		public init(restoring source: BSON.Primitive, key: String) throws {
			guard let document = source as? BSON.Document else {
				throw Meow.Error.cannotDeserialize(type: Team.Values.self, source: source, expectedPrimitive: BSON.Document.self);
			}
			try self.update(with: document)
		}

		public var name: String?
		public var abbv: String?
		public var logo: String?


		public func serialize() -> Document {
			var document: Document = [:]			
			document.pack(self.name, as: Key.name.keyString)
			document.pack(self.abbv, as: Key.abbv.keyString)
			document.pack(self.logo, as: Key.logo.keyString)
			return document
		}

		public mutating func update(with document: Document) throws {
			for key in document.keys {
				switch key {
				case Key.name.keyString:
					self.name = try document.unpack(Key.name.keyString)
				case Key.abbv.keyString:
					self.abbv = try document.unpack(Key.abbv.keyString)
				case Key.logo.keyString:
					self.logo = try document.unpack(Key.logo.keyString)
				default: break
				}
			}
		}
	}

	// MARK: VirtualInstanceStructClass.ejs


public struct VirtualInstance : VirtualModelInstance {
	/// Compares this model's VirtualInstance type with an actual model and generates a Query
	public static func ==(lhs: VirtualInstance, rhs: Team?) -> Query {
		
		return (lhs.referencedKeyPrefix + "_id") == rhs?._id
		
	}

	public let keyPrefix: String

	public let isReference: Bool

	
	public var _id: VirtualObjectId {
		return VirtualObjectId(name: referencedKeyPrefix + Key._id.keyString)
	}
	

	
		 /// name: String
		 public var name: VirtualString { return VirtualString(name: referencedKeyPrefix + Key.name.keyString) } 
		 /// abbv: String
		 public var abbv: VirtualString { return VirtualString(name: referencedKeyPrefix + Key.abbv.keyString) } 
		 /// logo: String
		 public var logo: VirtualString { return VirtualString(name: referencedKeyPrefix + Key.logo.keyString) } 

	public init(keyPrefix: String = "", isReference: Bool = false) {
		self.keyPrefix = keyPrefix
		self.isReference = isReference
	}
} // end VirtualInstance

}

// CustomStringConvertible.ejs


extension Team : CustomStringConvertible {
	public var description: String {
	
		return "Team<\(ObjectIdentifier(self).hashValue),\((self.serialize() as Document).makeExtendedJSON(typeSafe: false).serializedString())>"
	
	}
}






fileprivate let meows: [Any.Type] = [Team.self]

extension Meow {
	static func `init`(_ connectionString: String) throws {
		try Meow.init(connectionString, meows)
	}
	
	static func `init`(_ db: MongoKitten.Database) {
		Meow.init(db, meows)
	}
}

// 🐈 Statistics
// Models: 1
//   Team
// Serializables: 1
//   Team
// Model protocols: 0
//   
// Tuples: 0
