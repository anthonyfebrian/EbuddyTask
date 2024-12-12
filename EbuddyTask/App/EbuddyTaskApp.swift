//
//  EbuddyTaskApp.swift
//  EbuddyTask
//
//  Created by brian on 11/12/24.
//

import SwiftUI

@main
struct EbuddyTaskApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            ListUserScreen()
                .environmentObject(UserObs())
        }
    }
}
