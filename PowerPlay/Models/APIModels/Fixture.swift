import Foundation
struct Fixture : Codable {
	let id : Int?
	let referee : String?
	let timezone : String?
	let date : String?
	let timestamp : Int?
	let periods : Periods?
	let venue : Venue?
	let status : Status?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case referee = "referee"
		case timezone = "timezone"
		case date = "date"
		case timestamp = "timestamp"
		case periods = "periods"
		case venue = "venue"
		case status = "status"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		referee = try values.decodeIfPresent(String.self, forKey: .referee)
		timezone = try values.decodeIfPresent(String.self, forKey: .timezone)
		date = try values.decodeIfPresent(String.self, forKey: .date)
		timestamp = try values.decodeIfPresent(Int.self, forKey: .timestamp)
		periods = try values.decodeIfPresent(Periods.self, forKey: .periods)
		venue = try values.decodeIfPresent(Venue.self, forKey: .venue)
		status = try values.decodeIfPresent(Status.self, forKey: .status)
	}

}
