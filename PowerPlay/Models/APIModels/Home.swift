import Foundation
struct Home : Codable {
	let id : Int?
	let name : String?
	let logo : String?
	let winner : String?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case name = "name"
		case logo = "logo"
		case winner = "winner"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		logo = try values.decodeIfPresent(String.self, forKey: .logo)
		winner = try values.decodeIfPresent(String.self, forKey: .winner)
	}

}
