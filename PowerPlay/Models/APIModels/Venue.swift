import Foundation
struct Venue : Codable {
	let id : Int?
	let name : String?
	let city : String?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case name = "name"
		case city = "city"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		city = try values.decodeIfPresent(String.self, forKey: .city)
	}

}
