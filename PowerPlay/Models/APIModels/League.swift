import Foundation
struct League : Codable {
	let id : Int?
	let name : String?
	let country : String?
	let logo : String?
	let flag : String?
	let season : Int?
	let round : String?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case name = "name"
		case country = "country"
		case logo = "logo"
		case flag = "flag"
		case season = "season"
		case round = "round"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		country = try values.decodeIfPresent(String.self, forKey: .country)
		logo = try values.decodeIfPresent(String.self, forKey: .logo)
		flag = try values.decodeIfPresent(String.self, forKey: .flag)
		season = try values.decodeIfPresent(Int.self, forKey: .season)
		round = try values.decodeIfPresent(String.self, forKey: .round)
	}

}
