//
//  String+NumberDecoration.swift
//  iStarWars
//
//  Created by Amr Ahmed Elghadban on 16/02/2025.
//

import Foundation

extension String {

    /// The `integerDecoration` property formats an integer value into a compact representation.
    ///
    /// **Logic:**
    /// - Values less than 500 are returned as-is.
    /// - Values between 500 and 999 return "Less than 1K".
    /// - Values between 1,000 and 999,999 are formatted as `K` (thousands).
    /// - Values between 1,000,000 and 999,999,999 are formatted as `M` (millions).
    /// - Values between 1,000,000,000 and 999,999,999,999 are formatted as `B` (billions).
    /// - Values greater than or equal to 1,000,000,000,000 are formatted as `T` (trillions).
    ///
    /// **Formatting:**
    /// - If the value is a whole number (e.g., 2000 → 2K), it removes the decimal part.
    /// - If the value has a fractional part (e.g., 2500 → 2.5K), it formats it to one decimal place.
    ///
    /// **Examples:**
    /// ```
    /// print("1000".integerDecoration!)       // Output: "1K"
    /// print("2000".integerDecoration!)       // Output: "2K"
    /// print("2500".integerDecoration!)       // Output: "2.5K"
    /// print("1_000_000".integerDecoration!)  // Output: "1M"
    /// print("1_500_000".integerDecoration!)  // Output: "1.5M"
    /// print("1_000_000_000".integerDecoration!)  // Output: "1B"
    /// print("1_200_000_000".integerDecoration!)  // Output: "1.2B"
    /// print("1_000_000_000_000".integerDecoration!)  // Output: "1T"
    /// print("1_500_000_000_000".integerDecoration!)  // Output: "1.5T"
    /// print("-100".integerDecoration!)       // Output: "Empty :)"
    /// print("999".integerDecoration!)        // Output: "999"
    /// print("500".integerDecoration!)        // Output: "Less than 1K"
    /// ```
    var integerDecoration: String {
        guard let intValue = Int(self), intValue > 0, intValue != Int.max else { return "0" }
        switch intValue {
            case 0..<500:
                return "\(intValue)"
            case 500..<1_000:
                return "Less than 1K"
            case 1_000..<1_000_000:
                let kValue = Double(intValue) / 1_000
                return formatCompactValue(kValue, suffix: "K")
            case 1_000_000..<1_000_000_000:
                let mValue = Double(intValue) / 1_000_000
                return formatCompactValue(mValue, suffix: "M")
            case 1_000_000_000..<1_000_000_000_000:
                let bValue = Double(intValue) / 1_000_000_000
                return formatCompactValue(bValue, suffix: "B")
            default:
                let tValue = Double(intValue) / 1_000_000_000_000
                return formatCompactValue(tValue, suffix: "T")
        }
    }

    /// Formats a numeric value into a compact string representation.
    ///
    /// - Parameters:
    ///   - value: The numeric value to format.
    ///   - suffix: The suffix to append (e.g., "K", "M", "B", "T").
    /// - Returns: A formatted string (e.g., "1K", "2.5M").
    private func formatCompactValue(_ value: Double, suffix: String) -> String {
        if value.truncatingRemainder(dividingBy: 1) == 0 {
            return "\(Int(value))\(suffix)"
        } else {
            return String(format: "%.1f\(suffix)", value)
        }
    }

}
