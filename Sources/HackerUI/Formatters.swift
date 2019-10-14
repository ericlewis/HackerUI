import Foundation

public struct Formatters {
    public static let relativeDate = RelativeDateTimeFormatter()
    public static var count: NumberFormatter {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }
}
