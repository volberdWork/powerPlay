
import Foundation


struct ExapleModel{
    var date: String
    var leftImagName: String
    var rightImagName: String
    var fistComandName: String
    var secondComandName: String
    var firstPoint: Int
    var secondPoint: Int
    
    init(date: String, leftImagName: String, rightImagName: String, fistComandName: String, secondComandName: String, firstPoint: Int, secondPoint: Int) {
        self.date = date
        self.leftImagName = leftImagName
        self.rightImagName = rightImagName
        self.fistComandName = fistComandName
        self.secondComandName = secondComandName
        self.firstPoint = firstPoint
        self.secondPoint = secondPoint
    }
    
}
