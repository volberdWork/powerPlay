import Foundation
struct Response : Codable {
	let fixture : Fixture?
	let league : League?
	let teams : Teams?
	let goals : Goals?
	let score : Score?
}
