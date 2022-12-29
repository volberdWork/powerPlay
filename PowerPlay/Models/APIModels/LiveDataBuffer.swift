import Foundation
import Alamofire

class LiveDataBuffer {
    static var upcomingData: InfoTrend?
}


struct Away : Codable {
    let id : Int?
    let name : String?
    let logo : String?
    let winner : String?
}


struct Extratime : Codable {
    let home : String?
    let away : String?
}

struct Fixture : Codable {
    let id : Int?
    let referee : String?
    let timezone : String?
    let date : String?
    let timestamp : Int?
    let periods : Periods?
    let venue : Venue?
    let status : Status?
}

struct Fulltime : Codable {
    let home : Int?
    let away : Int?
}

struct Goals : Codable {
    let home : Int?
    let away : Int?
}

struct Halftime : Codable {
    let home : Int?
    let away : Int?
}

struct Home : Codable {
    let id : Int?
    let name : String?
    let logo : String?
    let winner : String?
}

struct InfoTrend : Codable {
    let get : String?
    let parameters : Parameters?
    let errors : [String]?
    let results : Int?
    let paging : Paging?
    let response : [ResponseResult]
}

struct League : Codable {
    let id : Int?
    let name : String?
    let country : String?
    let logo : String?
    let flag : String?
    let season : Int?
    let round : String?
}

struct Paging : Codable {
    let current : Int?
    let total : Int?
}

struct Parameters : Codable {
    let date : String?
}

struct Penalty : Codable {
    let home : String?
    let away : String?
}

struct Periods : Codable {
    let first : Int?
    let second : Int?
}

struct ResponseResult : Codable {
    let fixture : Fixture?
    let league : League?
    let teams : Teams?
    let goals : Goals?
    let score : Score?
}

struct Score : Codable {
    let halftime : Halftime?
    let fulltime : Fulltime?
    let extratime : Extratime?
    let penalty : Penalty?
}

struct Status : Codable {
    let long : String?
    let short : String?
    let elapsed : Int?
}

struct Teams : Codable {
    let home : Home?
    let away : Away?
}

struct Venue : Codable {
    let id : Int?
    let name : String?
    let city : String?
}











