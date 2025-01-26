//
//  StringExtensionTests.swift
//  iStarWarTests
//
//  Created by Amr Ahmed Elghadban on 23/01/2025.
//

import XCTest
@testable import iStarWars

class StringExtensionTests: XCTestCase {
    
    // MARK: - localized
    func testLocalized() {
        // Given
        let key = "test_key"
        
        // When
        let localizedString = key.localized
        
        // Then
        XCTAssertEqual(localizedString, NSLocalizedString(key, comment: ""), "Localized string should match")
    }
    
    // MARK: - trim
    func testTrim() {
        // Given
        let stringWithWhitespace = "  Hello, World!  "
        
        // When
        let trimmedString = stringWithWhitespace.trim
        
        // Then
        XCTAssertEqual(trimmedString, "Hello, World!", "Trimmed string should remove leading and trailing whitespace")
    }
    
    // MARK: - isEmptyOrWhitespace
    func testIsEmptyOrWhitespace() {
        // Given
        let emptyString = ""
        let whitespaceString = "   "
        let nonEmptyString = "Hello"
        
        // Then
        XCTAssertTrue(emptyString.isEmptyOrWhitespace, "Empty string should return true")
        XCTAssertTrue(whitespaceString.isEmptyOrWhitespace, "Whitespace string should return true")
        XCTAssertFalse(nonEmptyString.isEmptyOrWhitespace, "Non-empty string should return false")
    }
    
    // MARK: - isValidEmail
    func testIsValidEmail() {
        // Given
        let validEmail = "test@example.com"
        let invalidEmail = "test@.com"
        
        // Then
        XCTAssertTrue(validEmail.isValidEmail, "Valid email should return true")
        XCTAssertFalse(invalidEmail.isValidEmail, "Invalid email should return false")
    }
    
    // MARK: - isValidPhoneNumber
    func testIsValidPhoneNumber() {
        // Given
        let validPhoneNumber = "+1234567890"
        let invalidPhoneNumber = "123"
        
        // Then
        XCTAssertTrue(validPhoneNumber.isValidPhoneNumber, "Valid phone number should return true")
        XCTAssertFalse(invalidPhoneNumber.isValidPhoneNumber, "Invalid phone number should return false")
    }
    
    // MARK: - isValidPassword
    func testIsValidPassword() {
        // Given
        let validPassword = "password123"
        let invalidPassword = "pass"
        
        // Then
        XCTAssertTrue(validPassword.isValidPassword, "Valid password should return true")
        XCTAssertFalse(invalidPassword.isValidPassword, "Invalid password should return false")
    }
    
    // MARK: - isValidName
    func testIsValidName() {
        // Given
        let validName = "Amr"
        let invalidName = "   "
        
        // Then
        XCTAssertTrue(validName.isValidName, "Valid name should return true")
        XCTAssertFalse(invalidName.isValidName, "Invalid name should return false")
    }
    
    // MARK: - isValidAge
    func testIsValidAge() {
        // Given
        let validAge = "25"
        let invalidAge = "12"
        let nonNumericAge = "abc"
        
        // Then
        XCTAssertTrue(validAge.isValidAge, "Valid age should return true")
        XCTAssertFalse(invalidAge.isValidAge, "Invalid age should return false")
        XCTAssertFalse(nonNumericAge.isValidAge, "Non-numeric age should return false")
    }
    
    // MARK: - isValidAlphaNumeric
    func testIsValidAlphaNumeric() {
        // Given
        let validAlphaNumeric = "abc123"
        let invalidAlphaNumeric = "abc@123"
        
        // Then
        XCTAssertTrue(validAlphaNumeric.isValidAlphaNumeric, "Valid alphanumeric string should return true")
        XCTAssertFalse(invalidAlphaNumeric.isValidAlphaNumeric, "Invalid alphanumeric string should return false")
    }
}
