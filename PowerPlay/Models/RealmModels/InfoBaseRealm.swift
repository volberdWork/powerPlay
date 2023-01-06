import Foundation
import RealmSwift


class InfoBaseRealm: Object{
    @Persisted(primaryKey: true) var fixtersId: Int
    @Persisted var date: String
    @Persisted var homaName: String
    @Persisted var awayName: String
    @Persisted var homeLogoLink: String
    @Persisted var awayLogoLink: String
    @Persisted var homePoint: Int
    @Persisted var awayPoint: Int
}

