import AppIntents

struct ConvertUnixTimeToDate: AppIntent, CustomIntentMigratedAppIntent {
    static let intentClassName = "UnixTimeToDateIntent"

    static let title: LocalizedStringResource = "Convert Unix Time to Date"

	static let description = IntentDescription(
"""
Returns the date for the input Unix time.

Unix time (also known as Epoch time) is a system for describing a point in time — the number of seconds that have elapsed since the Unix epoch.
""",
		categoryName: "Date"
	)

	@Parameter(title: "Unix Time", description: "Example: 1663178163", controlStyle: .field)
    var unixTime: Int

    static var parameterSummary: some ParameterSummary {
        Summary("Convert \(\.$unixTime) to a date")
    }

    func perform() async throws -> some IntentResult & ReturnsValue<Date> {
		.result(value: Date(timeIntervalSince1970: unixTime.toDouble))
    }
}
