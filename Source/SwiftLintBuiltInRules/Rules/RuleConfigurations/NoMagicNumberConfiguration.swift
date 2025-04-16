import SwiftLintCore

@AutoConfigParser
struct NoMagicNumbersRuleConfiguration: RuleConfiguration {
    typealias Parent = NoMagicNumbersRule

    @ConfigurationElement(key: "allowed_method_names")
    private(set) var allowedMethodNames: Set<String> = []

    @ConfigurationElement(key: "allowed_argument_labels")
    private(set) var allowedArgumentLabels: Set<String> = []

    var consoleDescription: String {
        [
            "allowed_method_names: \(allowedMethodNames.sorted())",
            "allowed_argument_labels: \(allowedArgumentLabels.sorted())"
        ].joined(separator: ", ")
    }
}
