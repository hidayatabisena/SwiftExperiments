import UIKit
import Foundation

let currentDate = Date()
let someDateInThePast = Date(timeIntervalSinceNow: (61 * 60 * 24 * 2) * -1)

let formatterNumeric = RelativeDateTimeFormatter()
formatterNumeric.unitsStyle = .full
formatterNumeric.dateTimeStyle = .numeric
formatterNumeric.formattingContext = .middleOfSentence
formatterNumeric.locale = Locale(identifier: "id")

let now = formatterNumeric.localizedString(for: currentDate, relativeTo: currentDate)
let relativeDateString = formatterNumeric.localizedString(for: someDateInThePast, relativeTo: currentDate)

print("Rana was arrived \(relativeDateString)")
print("Rana will about to arrive \(now)")
