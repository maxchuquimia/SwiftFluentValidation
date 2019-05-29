# Fluent Validation. In Swift.

Inspired by [JeremySkinner/FluentValidation](https://github.com/JeremySkinner/FluentValidation)

## Example

```swift
import FluentValidation

class CustomerValidator: FluentValidator<CustomerModel, CustomerValidator.CustomerError> {

    enum CustomerError: Error {
        case surnameEmpty, forenameEmpty, addressLineError, invalidPostcode
    }

    init() {
        super.init()

        rule(\.surname).notEmpty().error(.surnameEmpty)
        rule(\.forename).notEmpty().error(.forenameEmpty)
        rule(\.addressLines).length(isBetween: 1, and: 4).error(.addressLineError)
        rule(\.postcode).must(beAValidPostcode).error(.invalidPostcode)
    }

    private func beAValidPostcode(value: String) -> Bool {
        // custom postcode validating logic goes here
    }
}

let customer = CustomerModel()
let validator = CustomerValidator()

let result = validator.validate(customer)

switch result {
    case .success: ...
    case .failure(let error): ...
}

```

## Note
This is very much still in a Proof of Concept state. Not everything has a unit test, and support for Optionals is nonexistent. Some of the .NET Fluent Validation features are yet to be ported here.