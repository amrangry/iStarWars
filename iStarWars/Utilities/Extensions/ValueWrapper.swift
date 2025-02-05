//
//  ValueWrapper.swift
//  ADKATech.com
//
//  Created by Amr Elghadban on 9/20/18.
//  Copyright © 2018 Mobile DevOps. All rights reserved.

import Foundation

/// Convertible Protocol for NSNumber
public protocol NSNumberConvertible {
    /// NSNumber value
    var numberValue: NSNumber? { get }
}

/// Convertible Protocol for String
public protocol StringConvertible {
    /// string value
    var stringValue: String { get }
}
/// Convertible Protocol for Int
public protocol IntConvertible {
    /// string Int
    var intValue: Int? { get }
}
/// Convertible Protocol for Double
public protocol DoubleConvertible {
    /// string Double
    var doubleValue: Double? { get }
}
/// Convertible Protocol for Bool
public protocol BoolConvertible {
    /// string Bool
    var boolValue: Bool? { get }
}
/// Convertible Protocol for Bool
public protocol DataConvertible {
    /// string Data
    var dataValue: Data? { get }
}

extension ValueWrapper: Hashable {
    
}

extension ValueWrapper: Displayable { }

public enum ValueWrapper: Codable {
    case string(String)
    case int(Int)
    case double(Double)
    case bool(Bool)
    case data(Data)
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let value = try? container.decode(String.self) {
            self = .string(value)
            return
        }
        if let value = try? container.decode(Bool.self) {
            self = .bool(value)
            return
        }
        if let value = try? container.decode(Double.self) {
            self = .double(value)
            return
        }
        if let value = try? container.decode(Int.self) {
            self = .int(value)
            return
        }
        if let value = try? container.decode(Data.self) {
            self = .data(value)
            return
        }
        throw DecodingError.typeMismatch(ValueWrapper.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for ValueWrapper"))
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
            case let .string(value):
                try container.encode(value)
            case let .bool(value):
                try container.encode(value)
            case let .int(value):
                try container.encode(value)
            case let .double(value):
                try container.encode(value)
            case let .data(value):
                try container.encode(value)
        }
    }
    
}

// MARK: - extension StringConvertible Protocol Conform
extension ValueWrapper: StringConvertible {
    public var stringValue: String {
        var result: String
        switch self {
            case let .string(value):
                result = value
            case let .bool(value):
                result = String(value)
            case let .int(value):
                result = String(value)
            case let .double(value):
                let isInt = floor(value) == value
                if isInt {  // true
                    result = String(Int(value))
                } else {
                    result = String(value)
                }
            case let .data(value):
                result = String(decoding: value, as: UTF8.self)
        }
        return result
    }
}

// MARK: - extension IntConvertible Protocol Conform
extension ValueWrapper: IntConvertible {
    public var intValue: Int? {
        var result: Int?
        switch self {
            case let .string(value):
                result = Int(value)
            case let .int(value):
                result = value
            case let .bool(value):
                result = value ? 1 : 0
            case let .double(value):
                result = Int(value)
            case let .data(value):
                let string = String(decoding: value, as: UTF8.self)
                result = Int(string)
        }
        return result
    }
}

// MARK: - extension DoubleConvertible Protocol Conform
extension ValueWrapper: DoubleConvertible {
    public var doubleValue: Double? {
        var result: Double?
        switch self {
            case let .string(value):
                //Way 1 Remove commas from the string
                //            let cleanedValue = value.replacingOccurrences(of: ",", with: "")
                //            result = Double(cleanedValue)
                //Way 2 Use NumberFormatter to handle different number formats
                let numberFormatter = NumberFormatter()
                numberFormatter.numberStyle = .decimal
                result = numberFormatter.number(from: value)?.doubleValue
            case let .int(value):
                result = Double(value)
            case let .bool(value):
                result = value ? 1 : 0
            case let .double(value):
                result = value
            case let .data(value):
                let string = String(decoding: value, as: UTF8.self)
                let numberFormatter = NumberFormatter()
                // Use NumberFormatter for conversion
                // Use NumberFormatter to handle different number formats
                numberFormatter.numberStyle = .decimal
                result = numberFormatter.number(from: string)?.doubleValue
                //result = Double(string)
        }
        return result
    }
}

// MARK: - extension BoolConvertible Protocol Conform
extension ValueWrapper: BoolConvertible {
    public var boolValue: Bool? {
        var result: Bool?
        switch self {
            case let .string(value):
                result = Bool(value)
            case let .bool(value):
                result = value
            case let .int(value):
                result = Bool(truncating: value as NSNumber)
            case let .double(value):
                result = Bool(truncating: value as NSNumber)
            case let .data(value):
                let string = String(decoding: value, as: UTF8.self)
                result = Bool(string)
        }
        return result
    }
}

// MARK: - extension DataConvertible Protocol Conform
extension ValueWrapper: DataConvertible {
    public var dataValue: Data? {
        var result: Data?
        switch self {
            case let .data(value):
                result = value
            default:
                let value = self.stringValue
                result = value.data(using: .utf8)
                //result = try? JSONEncoder().encode(self)
        }
        //        switch self {
        //        case let .string(value):
        //            result = value.data(using: .utf8)//Bool(value)
        //        case let .boolValue(value):
        //            result = try? JSONEncoder().encode(value)
        //        case let .int(value):
        //            result = try? JSONEncoder().encode(value)
        //        case let .double(value):
        //            result = try? JSONEncoder().encode(value)
        //        case let .data(value):
        //            result = try? JSONEncoder().encode(value)
        //        }
        return result
    }
}

