//
//  iStarWarsUITestsLaunchTests.swift
//  iStarWarsUITests
//
//  Created by Amr Ahmed Elghadban on 23/01/2025.
//

import XCTest

final class iStarWarsUITestsLaunchTests: XCTestCase { // swiftlint:disable:this type_name

    let app = XCUIApplication()

    // swiftlint:disable:next static_over_final_class
    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    @MainActor
    func testLaunch() throws {
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }

}
