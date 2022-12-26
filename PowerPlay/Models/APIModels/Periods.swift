import Foundation
struct Periods : Codable {
	let first : Int?
	let second : String?

	enum CodingKeys: String, CodingKey {

		case first = "first"
		case second = "second"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		first = try values.decodeIfPresent(Int.self, forKey: .first)
		second = try values.decodeIfPresent(String.self, forKey: .second)
	}

}
