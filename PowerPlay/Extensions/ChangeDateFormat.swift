import Foundation
import AudioToolbox


    func changeDateFormat(dateString: String, fromFormat: String, toFormat: String) ->String {
        let inputDateFormatter = DateFormatter()
        inputDateFormatter.dateFormat = fromFormat
       
        let date = inputDateFormatter.date(from: dateString)
        
        let outputDateFormatter = DateFormatter()
        outputDateFormatter.dateFormat = toFormat
        outputDateFormatter.locale = Locale(identifier: "en_US_POSIX")
        return outputDateFormatter.string(from: date!)
    }




