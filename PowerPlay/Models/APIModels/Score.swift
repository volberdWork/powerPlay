import Foundation
struct Score : Codable {
	let halftime : Halftime?
	let fulltime : Fulltime?
	let extratime : Extratime?
	let penalty : Penalty?
}
