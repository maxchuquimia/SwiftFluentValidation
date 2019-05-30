# Fluent Validation. In Swift.

Inspired by [JeremySkinner/FluentValidation](https://github.com/JeremySkinner/FluentValidation)

## Example

```swift
import FluentValidation

// Create a validator for CustomerModel
class CustomerValidator: FluentValidator<CustomerModel, CustomerValidator.Problem> {

    enum Problem: Error {
        case noName, underage, invalidAddress, invalidEmail
    }

    override init() {
        super.init()

        rule(\.name).isNotEmpty().error(.noName)
        rule(\.age).greaterThanOrEqualTo(18).error(.underage)
        rule(\.addressLines).isSome().length(isBetween: 1, and: 4).error(.invalidAddress)
        rule(\.emailAddress).must(beAnEmailAddress).error(.invalidEmail)
    }

    private func beAnEmailAddress(value: String) -> Bool {
        // Execute custom logic
        return true
    }
}
```

where `CustomerModel` is an object such as:
```swift
struct CustomerModel {
    let name: String
    let age: Int
    let addressLines: [String]?
    let emailAddress: String
}
```

You can then instantiate the generator and use it to validate your `CustomerModel`s, getting a strongly typed error on failure:
```swift
let validator = CustomerValidator()
let customer = CustomerModel(name: "Henry Kendall", age: 43, addressLines: nil, emailAddress: "")

// result is Result<Void, CustomerValidator.Problem>
let result = validator.validate(customer)

switch result {
case .success: proceed()
case .failure(let problem): handle(error: problem)
}
```

## Note
Some of the .NET Fluent Validation features are yet to be ported here.