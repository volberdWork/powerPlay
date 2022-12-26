import Foundation
struct Paging : Codable {
	let current : Int?
	let total : Int?

	enum CodingKeys: String, CodingKey {

		case current = "current"
		case total = "total"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		current = try values.decodeIfPresent(Int.self, forKey: .current)
		total = try values.decodeIfPresent(Int.self, forKey: .total)
	}

}
