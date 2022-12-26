import Foundation
struct InfoBase : Codable {
	let get : String?
	let parameters : Parameters?
	let errors : [String]?
	let results : Int?
	let paging : Paging?
	let response : [Response]?

	enum CodingKeys: String, CodingKey {

		case get = "get"
		case parameters = "parameters"
		case errors = "errors"
		case results = "results"
		case paging = "paging"
		case response = "response"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		get = try values.decodeIfPresent(String.self, forKey: .get)
		parameters = try values.decodeIfPresent(Parameters.self, forKey: .parameters)
		errors = try values.decodeIfPresent([String].self, forKey: .errors)
		results = try values.decodeIfPresent(Int.self, forKey: .results)
		paging = try values.decodeIfPresent(Paging.self, forKey: .paging)
		response = try values.decodeIfPresent([Response].self, forKey: .response)
	}

}
