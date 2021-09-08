//
//  CloneInstagramApp.swift
//  CloneInstagram
//
//  Created by FX on 2021/09/07.
//

import SwiftUI
import Firebase


@main
struct CloneInstagramApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOpinions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        print("Firebase...")
        FirebaseApp.configure()
        return true
    }
}
