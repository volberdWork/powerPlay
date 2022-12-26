import Foundation
struct Parameters : Codable {
	let live : String?

	enum CodingKeys: String, CodingKey {

		case live = "live"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		live = try values.decodeIfPresent(String.self, forKey: .live)
	}

}
