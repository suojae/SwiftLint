import SwiftLintCore

struct NoMagicNumbersRuleConfiguration: RuleConfiguration {
    typealias Parent = NoMagicNumbersRule

    private(set) var allowedMethodNames: Set<String> = []
    private(set) var allowedArgumentLabels: Set<String> = []

    var consoleDescription: String {
        [
            "allowed_method_names: \(allowedMethodNames.sorted())",
            "allowed_argument_labels: \(allowedArgumentLabels.sorted())"
        ].joined(separator: ", ")
    }

    mutating func apply(configuration: Any) throws {
        guard let config = configuration as? [String: Any] else {
            throw Issue.invalidConfiguration(ruleID: Parent.identifier)
        }

        if let methodNames = config["allowed_method_names"] as? [String] {
            allowedMethodNames = Set(methodNames)
        }

        if let labels = config["allowed_argument_labels"] as? [String] {
            allowedArgumentLabels = Set(labels)
        }
    }
}
