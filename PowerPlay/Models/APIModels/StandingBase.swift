import Foundation
    struct StandingBase : Codable {
        let get : String?
        let parameters : ParametersStandings?
        let errors : [String]?
        let results : Int?
        let paging : PagingStandings?
        let response : [ResponseStandings]?
    }
    
    struct AllStandings : Codable {
        let played : Int?
        let win : Int?
        let draw : Int?
        let lose : Int?
        let goals : GoalsStendings?
    }
    
    struct AwayStandings : Codable {
        let played : Int?
        let win : Int?
        let draw : Int?
        let lose : Int?
        let goals : GoalsStendings?
    }
    
    struct HomeStandings : Codable {
        let played : Int?
        let win : Int?
        let draw : Int?
        let lose : Int?
        let goals : GoalsStendings?
    }
    
    struct LeagueStandings : Codable {
        let id : Int?
        let name : String?
        let country : String?
        let logo : String?
        let flag : String?
        let season : Int?
        let standings : [[Standings]]?
    }
    
    struct GoalsStendings : Codable {
        let forTeam : Int?
        let against : Int?
    }
  
    
    struct PagingStandings : Codable {
        let current : Int?
        let total : Int?
    }
    
    struct TeamStandings : Codable {
        let id : Int?
        let name : String?
        let logo : String?
    }
    
    struct Standings : Codable {
        let rank : Int?
        let team : TeamStandings?
        let points : Int?
        let goalsDiff : Int?
        let group : String?
        let form : String?
        let status : String?
        let description : String?
        let all : AllStandings?
        let home : HomeStandings?
        let away : AwayStandings?
        let update : String?
    }
    
    struct ParametersStandings : Codable {
        let league : String?
        let season : String?
    }
    
    struct ResponseStandings : Codable {
        let league : LeagueStandings?
    }

