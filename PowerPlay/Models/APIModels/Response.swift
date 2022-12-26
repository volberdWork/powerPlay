import Foundation
struct Response : Codable {
	let fixture : Fixture?
	let league : League?
	let teams : Teams?
	let goals : Goals?
	let score : Score?
	let events : [String]?

	enum CodingKeys: String, CodingKey {

		case fixture = "fixture"
		case league = "league"
		case teams = "teams"
		case goals = "goals"
		case score = "score"
		case events = "events"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		fixture = try values.decodeIfPresent(Fixture.self, forKey: .fixture)
		league = try values.decodeIfPresent(League.self, forKey: .league)
		teams = try values.decodeIfPresent(Teams.self, forKey: .teams)
		goals = try values.decodeIfPresent(Goals.self, forKey: .goals)
		score = try values.decodeIfPresent(Score.self, forKey: .score)
		events = try values.decodeIfPresent([String].self, forKey: .events)
	}

}
