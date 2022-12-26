import Foundation
struct Goals : Codable {
	let home : Int?
	let away : Int?

	enum CodingKeys: String, CodingKey {

		case home = "home"
		case away = "away"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		home = try values.decodeIfPresent(Int.self, forKey: .home)
		away = try values.decodeIfPresent(Int.self, forKey: .away)
	}

}
