import Foundation
struct Status : Codable {
	let long : String?
	let short : String?
	let elapsed : Int?

	enum CodingKeys: String, CodingKey {

		case long = "long"
		case short = "short"
		case elapsed = "elapsed"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		long = try values.decodeIfPresent(String.self, forKey: .long)
		short = try values.decodeIfPresent(String.self, forKey: .short)
		elapsed = try values.decodeIfPresent(Int.self, forKey: .elapsed)
	}

}
