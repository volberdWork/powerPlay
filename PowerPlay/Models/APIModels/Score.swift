import Foundation
struct Score : Codable {
	let halftime : Halftime?
	let fulltime : Fulltime?
	let extratime : Extratime?
	let penalty : Penalty?

	enum CodingKeys: String, CodingKey {

		case halftime = "halftime"
		case fulltime = "fulltime"
		case extratime = "extratime"
		case penalty = "penalty"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		halftime = try values.decodeIfPresent(Halftime.self, forKey: .halftime)
		fulltime = try values.decodeIfPresent(Fulltime.self, forKey: .fulltime)
		extratime = try values.decodeIfPresent(Extratime.self, forKey: .extratime)
		penalty = try values.decodeIfPresent(Penalty.self, forKey: .penalty)
	}

}
