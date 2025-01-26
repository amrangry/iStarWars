//
//  iStarWarsApp.swift
//  iStarWars
//
//  Created by Amr Ahmed Elghadban on 23/01/2025.
//

import SwiftUI

@main
struct iStarWarsApp: App { // swiftlint:disable:this type_name

    @StateObject private var coordinator = AppCoordinator()

    init() {
        // Configure CacheManager
        let cacheExpiryInterval = Constants.cacheExpiryInterval
        let cacheSizeMemory = Constants.cacheSizeMemory
        let cacheSizeDisk = Constants.cacheSizeDisk
        let cacheDiskPath = Constants.cacheDiskPath
        CacheManager.configure(cacheExpiryInterval: cacheExpiryInterval,
                               cacheSizeMemory: cacheSizeMemory,
                               cacheSizeDisk: cacheSizeDisk,
                               cacheDiskPath: cacheDiskPath)
    }

    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $coordinator.navigationPath) {
                coordinator.view(for: .planetList)
                    .environmentObject(coordinator)
            }
        }
    }

}
