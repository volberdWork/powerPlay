import Foundation
struct HeadToHeadBase : Codable {
	let get : String?
	let errors : [String]?
	let results : Int?
	let paging : Paging?
	let response : [Response]?
}
