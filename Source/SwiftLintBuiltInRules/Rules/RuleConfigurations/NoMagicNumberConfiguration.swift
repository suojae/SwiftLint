import SwiftLintCore

struct NoMagicNumbersRuleConfiguration: RuleConfiguration {
    typealias Parent = NoMagicNumbersRule

    private(set) var allowedNumbers: Set<Double> = []
    private(set) var allowedMethodNames: Set<String> = []

    var consoleDescription: String {
        [
            "allowed_numbers: \(allowedNumbers.sorted())",
            "allowed_method_names: \(allowedMethodNames.sorted())"
        ].joined(separator: ", ")
    }

    mutating func apply(configuration: Any) throws {
        guard let config = configuration as? [String: Any] else {
            throw Issue.invalidConfiguration(ruleID: Parent.identifier)
        }

        if let numbers = config["allowed_numbers"] as? [Double] {
            allowedNumbers = Set(numbers)
        }

        if let ints = config["allowed_numbers"] as? [Int] {
            allowedNumbers = Set(ints.map(Double.init))
        }

        if let methodNames = config["allowed_method_names"] as? [String] {
            allowedMethodNames = Set(methodNames)
        }
    }
}
