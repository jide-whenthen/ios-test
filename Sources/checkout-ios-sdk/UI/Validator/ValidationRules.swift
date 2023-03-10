//
//  File.swift
//  
//
//  Created by Elikem Savie on 17/10/2022.
//

import Foundation


enum ValidationRules: String {

    case invalidCardNumber
    case cardNumberRequired
    case cardMinimmun
    case fullNameRequired
    case cardExpired
    case cvvRequired
    case dateRequired
    case textTooShort

    var reason: String {
        switch self {
        case .invalidCardNumber:
            return LocalizableString.ERROR_CARD_NUMBER_INVALID
        case .cardNumberRequired:
            return LocalizableString.ERROR_CARD_NUMBER_INVALID
        case .cardMinimmun:
            return LocalizableString.ERROR_CARD_MIN_NUMBER
        case .fullNameRequired:
            return LocalizableString.ERROR_FULLNAME_REQUIRED
        case .cardExpired:
            return LocalizableString.ERROR_CARD_EXPIRED
        case .cvvRequired:
            return LocalizableString.ERROR_CVC_REQUIRED
        case .dateRequired:
            return LocalizableString.ERROR_EXPIRED_DATE_REQUIRED
        case .textTooShort:
            return LocalizableString.ERROR_TEXT_TOO_SHORT
        }
    }
}

protocol Validatable {
    var validationRules: [ValidationRules] { get set }
    var inputData: String { get }
    var identifier: String { get }
    func containsValidInput() -> Bool
    func containsValidInputWithError() -> Bool
    func triggerError(message: String)
}

protocol FormValidatable {
    var forms: [Validatable] { get set }
    func areFormsValid() -> Bool
    func areFormsValidShowingError() -> Bool
    func isFormValid(_ form: Validatable) -> Bool
}

extension FormValidatable {
    func areFormsValid() -> Bool {
        return !forms.contains(where: {$0.containsValidInput() == false})
    }

    func areFormsValidShowingError() -> Bool {
        forms.forEach({$0.containsValidInputWithError()})
        return !forms.contains(where: {$0.containsValidInput() == false})
    }

    func isFormValid(_ form: Validatable) -> Bool {
        let _form = forms.first(where: {$0.identifier == form.identifier})
        let _ = _form?.containsValidInputWithError()
        return _form?.containsValidInput() ?? false
    }
}


extension Validatable {
    @discardableResult
    func containsValidInput() -> Bool {
        let validator = Validator(item: self)
        return validator.isValid(triggeringError: false)
    }

    @discardableResult
    func containsValidInputWithError() -> Bool {
        let validator = Validator(item: self)
        return validator.isValid(triggeringError: true)
    }
}

class Validator<T: Validatable> {

    let item: T

    init(item: T) {
        self.item = item
    }
    
    func validate(using rule: ValidationRules, triggerError: Bool) -> Bool {
        switch rule {
        case .invalidCardNumber:
            let cardNumber = item.inputData
            let isValid = cardNumber.count >= 13
            (triggerError && !isValid) ? item.triggerError(message: rule.reason) : ()
            return isValid
        case .cardNumberRequired, .fullNameRequired, .cvvRequired, .dateRequired:
            let isEmpty = item.inputData.isEmpty
            (triggerError && isEmpty) ? item.triggerError(message: rule.reason) : ()
            return !isEmpty
        case .cardMinimmun:
            let cardNumber = item.inputData
            let isValid = cardNumber.count >= 13
            (triggerError && !isValid) ? item.triggerError(message: rule.reason) : ()
            return isValid
        case .cardExpired:
            return triggerError
        case .textTooShort:
            let isTooShort = item.inputData.count <= 2
            (triggerError && isTooShort) ? item.triggerError(message: rule.reason) : ()
            return !isTooShort
        }
    }

    func isValid(triggeringError triggerError: Bool) -> Bool {
        return !item.validationRules.contains(
            where: { validate(using: $0, triggerError: triggerError) == false }
        )
    }
}
