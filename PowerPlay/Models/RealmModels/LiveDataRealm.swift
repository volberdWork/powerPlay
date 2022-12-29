import Foundation

import RealmSwift

class LiveDataRealm: Object{
    @Persisted var date: String
    @Persisted var awayImage: String
    @Persisted var homeImage: String
    @Persisted var awayTeamName:String
    @Persisted var homeTeamName: String
    @Persisted var awayPoint : Int
    @Persisted var homePoint: Int 
    
}
