//
//  String+Extension.swift
//  iStarWars
//
//  Created by Amr Ahmed Elghadban on 23/01/2025.
//

import Foundation

/// String extension  funcationality 
extension String {

    var localized: String {
        NSLocalizedString(self, comment: "")
    }

    var trim: String {
        self.trimmingCharacters(in: .whitespacesAndNewlines)
    }

    var isEmptyOrWhitespace: Bool {
        trim.isEmpty
    }

    var isValidEmail: Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        return range(of: emailRegex, options: .regularExpression, range: nil, locale: nil) != nil
    }

    var isValidPhoneNumber: Bool {
        let phoneNumberRegex = "^(\\+\\d{1,3})?([-. (]*(\\d{3})[-. )]*)?(\\d{3})[-. ]*(\\d{4})(?: *x(\\d{1,5}))?$"

        // Create a regular expression object
        guard let regex = try? NSRegularExpression(pattern: phoneNumberRegex) else {
            return false
        }

        // Define the range of the string to check
        let range = NSRange(location: 0, length: self.utf16.count)

        // Check if the string matches the regex
        return regex.firstMatch(in: self, options: [], range: range) != nil
    }

    var isValidPassword: Bool {
        return count >= 8
    }

    var isValidName: Bool {
        return !isEmptyOrWhitespace
    }

    var isValidAge: Bool {
        guard let age = Int(self) else { return false }
        return age >= 13
    }

    var isValidAlphaNumeric: Bool {
        return range(of: "[^a-zA-Z0-9]", options: .regularExpression, range: nil, locale: nil) == nil
    }

}
