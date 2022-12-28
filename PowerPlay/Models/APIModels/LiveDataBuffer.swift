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
    
    enum CodingKeys: String, CodingKey {
        
        case id = "id"
        case name = "name"
        case logo = "logo"
        case winner = "winner"
    }
}


struct Extratime : Codable {
    let home : String?
    let away : String?
    
    enum CodingKeys: String, CodingKey {
        
        case home = "home"
        case away = "away"
    }
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
}

struct Fulltime : Codable {
    let home : Int?
    let away : Int?
    
    enum CodingKeys: String, CodingKey {
        
        case home = "home"
        case away = "away"
    }
}

struct Goals : Codable {
    let home : Int?
    let away : Int?
    
    enum CodingKeys: String, CodingKey {
        
        case home = "home"
        case away = "away"
    }
}

struct Halftime : Codable {
    let home : Int?
    let away : Int?
    
    enum CodingKeys: String, CodingKey {
        
        case home = "home"
        case away = "away"
    }
}

struct Home : Codable {
    let id : Int?
    let name : String?
    let logo : String?
    let winner : String?
    
    enum CodingKeys: String, CodingKey {
        
        case id = "id"
        case name = "name"
        case logo = "logo"
        case winner = "winner"
    }
}

struct InfoTrend : Codable {
    let get : String?
    let parameters : Parameters?
    let errors : [String]?
    let results : Int?
    let paging : Paging?
    let response : [ResponseResult]
    
    enum CodingKeys: String, CodingKey {
        
        case get = "get"
        case parameters = "parameters"
        case errors = "errors"
        case results = "results"
        case paging = "paging"
        case response = "response"
    }
}

struct League : Codable {
    let id : Int?
    let name : String?
    let country : String?
    let logo : String?
    let flag : String?
    let season : Int?
    let round : String?
    
    enum CodingKeys: String, CodingKey {
        
        case id = "id"
        case name = "name"
        case country = "country"
        case logo = "logo"
        case flag = "flag"
        case season = "season"
        case round = "round"
    }
}

struct Paging : Codable {
    let current : Int?
    let total : Int?
    
    enum CodingKeys: String, CodingKey {
        
        case current = "current"
        case total = "total"
    }
}

struct Parameters : Codable {
    let date : String?
    
    enum CodingKeys: String, CodingKey {
        
        case date = "date"
    }
}

struct Penalty : Codable {
    let home : String?
    let away : String?
    
    enum CodingKeys: String, CodingKey {
        
        case home = "home"
        case away = "away"
    }
}

struct Periods : Codable {
    let first : Int?
    let second : Int?
    
    enum CodingKeys: String, CodingKey {
        
        case first = "first"
        case second = "second"
    }
}

struct ResponseResult : Codable {
    let fixture : Fixture?
    let league : League?
    let teams : Teams?
    let goals : Goals?
    let score : Score?
    
    enum CodingKeys: String, CodingKey {
        
        case fixture = "fixture"
        case league = "league"
        case teams = "teams"
        case goals = "goals"
        case score = "score"
    }
}

struct Score : Codable {
    let halftime : Halftime?
    let fulltime : Fulltime?
    let extratime : Extratime?
    let penalty : Penalty?
    
    enum CodingKeys: String, CodingKey {
        
        case halftime = "halftime"
        case fulltime = "fulltime"
        case extratime = "extratime"
        case penalty = "penalty"
    }
}

struct Status : Codable {
    let long : String?
    let short : String?
    let elapsed : Int?
    
    enum CodingKeys: String, CodingKey {
        
        case long = "long"
        case short = "short"
        case elapsed = "elapsed"
    }
}

struct Teams : Codable {
    let home : Home?
    let away : Away?
    
    enum CodingKeys: String, CodingKey {
        
        case home = "home"
        case away = "away"
    }
}

struct Venue : Codable {
    let id : Int?
    let name : String?
    let city : String?
    
    enum CodingKeys: String, CodingKey {
        
        case id = "id"
        case name = "name"
        case city = "city"
    }
}











