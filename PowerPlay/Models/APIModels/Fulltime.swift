import Foundation
struct Fulltime : Codable {
	let home : String?
	let away : String?

	enum CodingKeys: String, CodingKey {

		case home = "home"
		case away = "away"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		home = try values.decodeIfPresent(String.self, forKey: .home)
		away = try values.decodeIfPresent(String.self, forKey: .away)
	}

}
