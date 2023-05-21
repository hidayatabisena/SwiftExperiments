import UIKit

// Locale calendar
var userLocale = Locale.autoupdatingCurrent
var gregorianCalendar = Calendar(identifier: .gregorian)
gregorianCalendar.locale = userLocale

// Date formatter
let iso8601DateFormatter = ISO8601DateFormatter()
var dateFormatter = DateFormatter()
dateFormatter.dateStyle = .full
dateFormatter.timeStyle = .full

// Date objects
let independenceDayComponents = DateComponents(
    timeZone: TimeZone(identifier: "Asia?Jakarta"),
    year: 1945,
    month: 8,
    day: 17,
    hour: 10,
    minute: 00
)

let indonesiaIndependenceDate = gregorianCalendar.date(from: independenceDayComponents)!
let indonesiaIndependenceDateFormatted = dateFormatter.string(from: indonesiaIndependenceDate)
print("Introductions:")
print("• The Independence Day of Indonesia is a national holiday in Indonesia commemorating the anniversary of Indonesia's proclamation of independence on \(indonesiaIndependenceDateFormatted).")

print("===========")
print("\nAbout Swift:")

// Swift
let swiftIntroDate = iso8601DateFormatter.date(from: "2014-06-02T11:45:00-07:00")!
let swiftIntroDateFormatted = dateFormatter.string(from: swiftIntroDate)
print("• Swift was introduced to the world on \(swiftIntroDateFormatted).")

let appleSiliconIntroDate = iso8601DateFormatter.date(from: "2020-06-22T11:27:00-07:00")!
let appleSiliconIntroDateFormatted = dateFormatter.string(from: appleSiliconIntroDate)
print("• Apple Silicon was introduced to the world on \(appleSiliconIntroDateFormatted).")

print("===========")

// Daylight saving
let pacificTimeZone = TimeZone(identifier: "America/Los_Angeles")!
let berlinTimeZone = TimeZone(identifier: "Asia/Jakarta")!
let idesOfMarchDate = iso8601DateFormatter.date(from: "2023-05-21T12:00:00Z")!
let isDSTInPacificTimeZone = pacificTimeZone.isDaylightSavingTime(for: idesOfMarchDate)
let isDSTInBerlinTimeZone = berlinTimeZone.isDaylightSavingTime(for: idesOfMarchDate)
print("\nDaylight Saving Time:")
print("• Is it Daylight Saving Time in the Pacific time zone on May 21, 2023?: \(isDSTInPacificTimeZone)")
print("• Is it Daylight Saving Time in Jakarta on May 21, 2023?: \(isDSTInBerlinTimeZone)")

print("===========")

print("\nDate comparisons:")
print("• Swift was announced BEFORE SwiftUI: " +
    "\(swiftIntroDate < appleSiliconIntroDate)")

print("• Swift was announced AFTER SwiftUI: " +
    "\(swiftIntroDate > appleSiliconIntroDate)")

print("• Swift and SwiftUI were announced at the SAME date and time: " +
    "\(swiftIntroDate == appleSiliconIntroDate)")

print("• Swift and SwiftUI were announced at DIFFERENT dates and times: " +
    "\(swiftIntroDate != appleSiliconIntroDate)")

print("===========")

print("\nSince dates can be compared, they can also be sorted:")
let scrambledDates = [
  appleSiliconIntroDate,
  indonesiaIndependenceDate,
  swiftIntroDate
]
let sortedDates = scrambledDates.sorted()
for date in sortedDates {
  let dateFormatted = dateFormatter.string(from: date)
  print("• \(dateFormatted)")
}

print("===========")

print("\nIntervals between Dates, in seconds:")
print("• Number of seconds between the Swift and SwiftUI announcements: " +
    "\(swiftIntroDate.timeIntervalSince(appleSiliconIntroDate))")
print("• Number of seconds between the SwiftUI and Swift announcements: " +
    "\(appleSiliconIntroDate.timeIntervalSince(swiftIntroDate))")

print("===========")

let swiftUIIntroDates = [
  "swiftIntroDate"         : swiftIntroDate,
  
  // Adding and subtracting seconds to and from a Date with + and -
  "swiftIntroDate1SecondLater"   : swiftIntroDate + 1,
  "swiftIntroDate1SecondEarlier" : swiftIntroDate - 1,
  
  // Adding and subtracting seconds to and from a Date with addingTimeInterval()
  "swiftIntroDate1MinuteLater"   : swiftIntroDate.addingTimeInterval(60),
  "swiftIntroDate1MinuteEarlier" : swiftIntroDate.addingTimeInterval(-60),
  
  // Adding and subtracting seconds to and from a Date with advanced(by:)
  "swiftIntroDate1HourLater"   : swiftIntroDate.advanced(by: 60 * 60),
  "swiftIntroDate1HourEarlier"   : swiftIntroDate.advanced(by: -60 * 60),
]
for date in swiftUIIntroDates {
  print("• \(date.key): \(date.value.description(with: userLocale))")
}

print("===========")

print("\nIntervals between Dates, in more convenient units:")

let daysBetweenAnnouncements = gregorianCalendar.dateComponents(
  [.day],
  from: swiftIntroDate,
  to: appleSiliconIntroDate
)
print("• There were \(daysBetweenAnnouncements.day!) days between the introductions of Swift and Apple Silicon.")

let weeksBetweenAnnouncements = gregorianCalendar.dateComponents(
  [.weekOfYear],
  from: swiftIntroDate,
  to: appleSiliconIntroDate
)
print("• There were \(weeksBetweenAnnouncements.weekOfYear!) weeks between the introductions of Swift and Apple Silicon.")

let ymdhmBetweenAnnouncements = gregorianCalendar.dateComponents(
  [.year, .month, .day, .hour, .minute],
  from: swiftIntroDate,
  to: appleSiliconIntroDate
)
var years = ymdhmBetweenAnnouncements.year!
var months = ymdhmBetweenAnnouncements.month!
var days = ymdhmBetweenAnnouncements.day!
var hours = ymdhmBetweenAnnouncements.hour!
var minutes = ymdhmBetweenAnnouncements.minute!
print("• There were \(years) years, \(months) months, \(days) days, \(hours) hours, and \(minutes) minutes between the introductions of Swift and Apple Silicon.")

let ymdhmsComponentsList: Set = [
  Calendar.Component.year,
  Calendar.Component.month,
  Calendar.Component.day,
  Calendar.Component.hour,
  Calendar.Component.minute,
  Calendar.Component.second
]
let ymdhmsBetweeniPhoneIntroAndNow = gregorianCalendar.dateComponents(
  ymdhmsComponentsList,
  from: indonesiaIndependenceDate,
  to: Date()
)
print("• ymdhmsBetweeniPhoneIntroAndNow: \(ymdhmsBetweeniPhoneIntroAndNow)")

let ymdhmsBetweenNowAndSwiftIntro = gregorianCalendar.dateComponents(
  ymdhmsComponentsList,
  from: Date(),
  to: swiftIntroDate
)
var seconds: Int
(years, months, days, hours, minutes, seconds) = (
  ymdhmsBetweenNowAndSwiftIntro.year!,
  ymdhmsBetweenNowAndSwiftIntro.month!,
  ymdhmsBetweenNowAndSwiftIntro.day!,
  ymdhmsBetweenNowAndSwiftIntro.hour!,
  ymdhmsBetweenNowAndSwiftIntro.minute!,
  ymdhmsBetweenNowAndSwiftIntro.second!
)
print("• To go to the keynote when Swift was introduced, you’d have to travel \(years) years, \(months) months, \(days) days, \(hours) hours, \(minutes) minutes, and \(seconds) seconds.")

print("===========")

print("\nAdding and subtracting to and from Dates:")

let ninetyDaysFromNow = gregorianCalendar.date(
  byAdding: .day,
  value: 90,
  to: Date()
)!
dateFormatter.timeStyle = .none
let ninetyDaysFromNowFormatted = dateFormatter.string(from: ninetyDaysFromNow)
print("• 90 days from now is: \(ninetyDaysFromNowFormatted).")

let fiveWeeksAgo = gregorianCalendar.date(
  byAdding: .weekOfYear,
  value: -5,
  to: Date()
)!
let fiveWeeksAgoFormatted = dateFormatter.string(from: fiveWeeksAgo)
print("• 5 weeks ago was: \(fiveWeeksAgoFormatted).")

// First, we need to define a DateComponents struct representing
// a time interval of 4 hours and 30 minutes
var fourHoursThirtyMinutes = DateComponents()
fourHoursThirtyMinutes.hour = 4
fourHoursThirtyMinutes.minute = 30

// Now add the interval to the Date
let fourHoursThirtyMinutesFromNow = gregorianCalendar.date(
  byAdding: fourHoursThirtyMinutes,
  to: Date()
)!
dateFormatter.timeStyle = .full
let fourHoursThirtyMinutesFromNowFormatted = dateFormatter.string(from: fourHoursThirtyMinutesFromNow)
print("• 4 hours and 30 minutes from now will be: \(fourHoursThirtyMinutesFromNowFormatted).")

var pastInterval = DateComponents()
pastInterval.year = -2
pastInterval.day = -17
pastInterval.hour = -10
pastInterval.minute = -3
let pastDate = gregorianCalendar.date(
  byAdding: pastInterval,
  to: Date()
)!
let pastDateFormatted = dateFormatter.string(from:pastDate)
print("• 2 years, 17 days, 10 hours and 3 minutes ago was: \(pastDateFormatted).")

print("===========")

print("\nMore “human” Date comparisons:")
let appleSiliconIntroDatePlus1Second = appleSiliconIntroDate + 1
print("• appleSiliconIntroDate == appleSiliconIntroDatePlus1Second: " +
    "\(appleSiliconIntroDate == appleSiliconIntroDatePlus1Second)")

let appleSiliconIntroDatePlus5Minutes = gregorianCalendar.date(
  byAdding: .minute,
  value: 5,
  to: appleSiliconIntroDate
)!
let appleSiliconIntroDatePlus3Hours = gregorianCalendar.date(
  byAdding: .hour,
  value: 3,
  to: appleSiliconIntroDate
)!

let test1 = gregorianCalendar.compare(
  appleSiliconIntroDate,
  to: appleSiliconIntroDatePlus1Second,
  toGranularity: .second
) == .orderedSame
print("• appleSiliconIntroDate == appleSiliconIntroDatePlus1Second (with second granularity): \(test1)")

let test2 = gregorianCalendar.compare(
  appleSiliconIntroDate,
  to: appleSiliconIntroDatePlus1Second,
  toGranularity: .second
) == .orderedAscending
print("• appleSiliconIntroDate < appleSiliconIntroDatePlus1Second (with second granularity): \(test2)")

let test3 = gregorianCalendar.compare(
  appleSiliconIntroDate,
  to: appleSiliconIntroDatePlus1Second,
  toGranularity: .minute
) == .orderedSame
print("• appleSiliconIntroDate == appleSiliconIntroDatePlus1Second (with minute granularity): \(test3)")

let test4 = gregorianCalendar.compare(
  appleSiliconIntroDate,
  to: appleSiliconIntroDatePlus5Minutes,
  toGranularity: .hour
) == .orderedSame
print("• appleSiliconIntroDate == appleSiliconIntroDatePlus5Minutes (with hour granularity): \(test4)")

let test5 = gregorianCalendar.compare(
  appleSiliconIntroDatePlus5Minutes,
  to: appleSiliconIntroDate,
  toGranularity: .minute
) == .orderedDescending
print("• appleSiliconIntroDatePlus5Minutes > appleSiliconIntroDate (with minute granularity): \(test5)")

let test6 = gregorianCalendar.compare(
  appleSiliconIntroDate,
  to: appleSiliconIntroDatePlus3Hours,
  toGranularity: .day
) == .orderedSame
print("• appleSiliconIntroDate == appleSiliconIntroDatePlus3Hours (with day granularity): \(test6)")

print("===========")

print("\nNext Dates:")
let next3AmComponents = DateComponents(hour: 3)
let next3AmDate = gregorianCalendar.nextDate(
  after: Date(),
  matching: next3AmComponents,
  matchingPolicy: .nextTime
)!
let next3AmFormatted = dateFormatter.string(from: next3AmDate)
print("• The next time it will be 3:00 a.m. is: \(next3AmFormatted).")

let sundayComponents = DateComponents(
  weekday: 1
)
let previousSunday = gregorianCalendar.nextDate(
  after: Date(),
  matching: sundayComponents,
  matchingPolicy: .nextTime,
  direction: .backward
)!
let nextSunday = gregorianCalendar.nextDate(
  after: Date(),
  matching: sundayComponents,
  matchingPolicy: .nextTime,
  direction: .forward
)!
dateFormatter.timeStyle = .none
let previousSundayFormatted = dateFormatter.string(from: previousSunday)
let nextSundayFormatted = dateFormatter.string(from: nextSunday)
print("• The previous Sunday was \(previousSundayFormatted).")
print("• The next Sunday will be \(nextSundayFormatted).")

let nextThirdFridayComponents = DateComponents(
  weekday: 6,
  weekdayOrdinal: 3
)
let nextThirdFridayDate = gregorianCalendar.nextDate(
  after: Date(),
  matching: nextThirdFridayComponents,
  matchingPolicy: .nextTime
)!
let nextThirdFridayFormatted = dateFormatter.string(from: nextThirdFridayDate)
print("• The next third Friday of the month will be \(nextThirdFridayFormatted).")

print("===========")

print("\nUnlucky days:")
let friday13thComponents = DateComponents(
  day: 13,
  weekday: 6)
let nextFriday13thDate = gregorianCalendar.nextDate(
  after: Date(),
  matching: friday13thComponents,
  matchingPolicy: .nextTime
)!
let nextFriday13thFormatted = dateFormatter.string(from: nextFriday13thDate)
print("• The next Friday the 13th will be on \(nextFriday13thFormatted).")

let tuesday13thComponents = DateComponents(
  day: 13,
  weekday: 3)
let nexttuesday13thDate = gregorianCalendar.nextDate(
  after: Date(),
  matching: tuesday13thComponents,
  matchingPolicy: .nextTime
)!
let nexttuesday13thFormatted = dateFormatter.string(from: nexttuesday13thDate)
print("• The next Tuesday the 13th will be on \(nexttuesday13thFormatted).")

let friday17thComponents = DateComponents(
  day: 17,
  weekday: 6)
let nextFriday17thDate = gregorianCalendar.nextDate(
  after: Date(),
  matching: friday17thComponents,
  matchingPolicy: .nextTime
)!
let nextFriday17thFormatted = dateFormatter.string(from: nextFriday17thDate)
print("• The next Friday the 13th will be on \(nextFriday17thFormatted).")

func fridayThe13ths(inYear year: Int) -> [Date] {
  let iso8601DateFormatter = ISO8601DateFormatter()
  var result: [Date] = []
  
  gregorianCalendar.enumerateDates(
    startingAfter: iso8601DateFormatter.date(
      from: "\(year)-01-01T00:00:00Z"
    )!,
    matching: friday13thComponents,
    matchingPolicy: .nextTime
  ) { (date, strict, stop) in
    if let validDate = date {
      let dateComponents = gregorianCalendar.dateComponents(
        [.year],
        from: validDate
      )
      if dateComponents.year! > year {
        stop = true
      } else {
        result.append(validDate)
      }
    }
  }
  
  return result
}

print("\n👻 Here are the Friday the 13ths for 2024:")
for fridayThe13th in fridayThe13ths(inYear: 2024) {
  let fridayThe13thFormatted = dateFormatter.string(from: fridayThe13th)
  print("• \(fridayThe13thFormatted)")
}
