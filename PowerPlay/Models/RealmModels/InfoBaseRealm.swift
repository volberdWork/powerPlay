import Foundation
import RealmSwift


class InfoBaseRealm: Object{
    @Persisted(primaryKey: true) var fixtersId :Int?
    @Persisted var date: String
    @Persisted var homaName: String
    @Persisted var awayName: String
    @Persisted var homeLogoLink: String
    @Persisted var awayLogoLink: String
    @Persisted var homePoint: Int
    @Persisted var awayPoint: Int
    @Persisted var yearText: String
    @Persisted var awayId: Int
    @Persisted var homeId: Int
    @Persisted var league: Int
    @Persisted var season: Int

}
