//
//  PoziApp.swift
//  Pozi
//
//  Created by seunghwan Lee on 2022/07/16.
//

import SwiftUI
import Firebase

@main
struct PoziApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            TestView()
        }
    }
}
